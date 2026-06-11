# Define the database connection to be used for this model.
connection: "stellantis_welding"

# include all the views
include: "/views/**/*.view.lkml"
#include: "/dashboards/*.dashboard.lookml"

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
    sql: LEFT JOIN UNNEST(${plc_logs.message__weld_log__force_curve}) as plc_logs__message__weld_log__force_curve WITH OFFSET AS array_index;;
    relationship: one_to_many
  }

  join: plc_logs__message__weld_log__voltage_curve {
    view_label: "Curve: Voltage"
    sql: LEFT JOIN UNNEST(${plc_logs.message__weld_log__voltage_curve}) as plc_logs__message__weld_log__voltage_curve WITH OFFSET AS array_index ;;
    relationship: one_to_many
  }

  join: plc_logs__message__weld_log__current_curve {
    view_label: "Curve: Current"
    sql: LEFT JOIN UNNEST(${plc_logs.message__weld_log__current_curve}) as plc_logs__message__weld_log__current_curve WITH OFFSET AS array_index ;;
    relationship: one_to_many
  }

#  join: madi_weld_summary {
#    type: full_outer
#    sql_on: cast(${plc_logs.message__weld_log__prot_record_id} as string)=${madi_weld_summary.prot_record_id} ;;
#    relationship: one_to_one
#  }


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
    view_label: "Real Anomalies"
    type: inner
    sql_on: ${plc_logs.original_filename}= ${summary_weldlog.filename};;
    relationship: one_to_one
  }

  sql_always_where:  ${summary_weldlog.ultrasound} in ('Good', 'KO') and ${message__weld_log__spot_name} is not null and ${message__weld_log__weld_time_actual_value} !=0;;

}


explore: stellantis_molding_anomaly_det
{
view_name: weld_training_scores_madi_3l48
view_label: "MADI Anomaly Scores"
label: "AI Welding Detection"
description: "Explore for analyzing training features and MADI anomaly scores for the spot welding process. It includes SHAP (SHapley Additive exPlanations) values that provide the feature contribution for each input variable to every anomaly score detection, enabling explainability of the MADI model predictions."
sql_always_where: ${weld_training_scores_madi_3l48.is_dominant_stack}=TRUE ;;

join: weld_training_features_3l48 {
  view_label: "MADI Training Features"
  type: inner
  sql_on: cast(${weld_training_features_3l48.original_filename} as string)=${weld_training_scores_madi_3l48.original_filename} ;;
  relationship: one_to_one
}

# ==========================================
# MADI Explainability (SHAP values)
# ==========================================
join: weld_training_madi_shap_3l48 {
view_label: "MADI Feature Contribution"
type: inner
sql_on: ${weld_training_scores_madi_3l48.original_filename} = ${weld_training_madi_shap_3l48.original_filename}
AND ${weld_training_scores_madi_3l48.time_stamp_raw} = ${weld_training_madi_shap_3l48.time_stamp_raw} ;;
relationship: one_to_many
}



join: weld_feature_bounds {
  type: left_outer
  sql_on: ${weld_training_madi_shap_3l48.feature} = ${weld_feature_bounds.feature} ;;
  relationship: many_to_one
}

# ==========================================
# MADI KPI (top 5/10/15% lift table)
# ==========================================
join: v_madi_kpi_dominant_3l48 {
view_label: "Overall MADI KPI"
type: inner
sql_on: 1=1 ;;
relationship: one_to_one
  }
}
