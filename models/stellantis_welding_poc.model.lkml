# Define the database connection to be used for this model.
connection: "stellantis_welding"

# include all the views
include: "/views/**/*.view.lkml"
include: "/dashboards/*.dashboard.lookml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: stellantis_welding_poc_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hour"
}

persist_with: stellantis_welding_poc_default_datagroup


explore: welding_anomaly_poc {
  view_name: plc_logs
  label: "PLC Welding Logs & Curves"
  description: "Explore for high-frequency PLC data, including dynamic welding curves (current, voltage, force) and sheet configurations."

  fields: [
    ALL_FIELDS*,

    summary_weldlog.ultrasound,
    summary_weldlog.anomaly_score,
    summary_weldlog.total_welds,
    summary_weldlog.count_ko,
    summary_weldlog.count_good,
    summary_weldlog.defect_rate
    ]
  #-summary_weldlog*,

  # ==========================================
  # 1. Unnested Array Joins (Dynamic Curves)
  # ==========================================

  join: plc_logs__message__weld_log__force_curve {
    view_label: "Curve: Force"
    sql: LEFT JOIN UNNEST(${plc_logs.message__weld_log__force_curve}) as plc_logs__message__weld_log__force_curve ;;
    relationship: one_to_many
  }

  join: plc_logs__message__weld_log__voltage_curve {
    view_label: "Curve: Voltage"
    sql: LEFT JOIN UNNEST(${plc_logs.message__weld_log__voltage_curve}) as plc_logs__message__weld_log__voltage_curve ;;
    relationship: one_to_many
  }

  join: plc_logs__message__weld_log__current_curve {
    view_label: "Curve: Current"
    sql: LEFT JOIN UNNEST(${plc_logs.message__weld_log__current_curve}) as plc_logs__message__weld_log__current_curve ;;
    relationship: one_to_many
  }


  # ==========================================
  # 2. Relational Joins (Metadata & Configs)
  # ==========================================

  join: spot_sheet_details {
    view_label: "Spot Sheet Details"
    type: inner
    sql_on: SAFE_CAST(SPLIT(${plc_logs.message__weld_log__spot_name}, '_')[OFFSET(0)] AS NUMERIC) = ${spot_sheet_details.spot_name} ;;
    relationship: many_to_one
  }

  # ==========================================
  # 3. Isolation Forest Model Output
  # ==========================================

  join: summary_weldlog{
    view_label: "Model Output"
    type: inner
    sql_on: ${plc_logs.original_filename}= ${summary_weldlog.filename};;
    relationship: one_to_one
  }

  sql_always_where:  ${summary_weldlog.ultrasound} in ('Good', 'KO') and ${message__weld_log__spot_name} is not null and ${message__weld_log__weld_time_actual_value} !=0;;

}
