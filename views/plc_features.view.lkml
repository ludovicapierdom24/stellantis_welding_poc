# The name of this view in Looker is "Plc Features"
view: plc_features {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `molding_anomaly_poc.plc_features` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Curr Max" in Explore.

  dimension: curr_max {
    type: number
    sql: ${TABLE}.curr_max ;;
  }

  dimension: curr_mean {
    type: number
    sql: ${TABLE}.curr_mean ;;
  }

  dimension: curr_std {
    type: number
    sql: ${TABLE}.curr_std ;;
  }

  dimension: delta_current_pct {
    type: number
    sql: ${TABLE}.delta_current_pct ;;
  }

  dimension: delta_energy_pct {
    type: number
    sql: ${TABLE}.delta_energy_pct ;;
  }

  dimension: delta_resistance_pct {
    type: number
    sql: ${TABLE}.delta_resistance_pct ;;
  }

  dimension: delta_stabilisation_pct {
    type: number
    sql: ${TABLE}.delta_stabilisation_pct ;;
  }

  dimension: delta_time_pct {
    type: number
    sql: ${TABLE}.delta_time_pct ;;
  }

  dimension: force_max {
    type: number
    sql: ${TABLE}.force_max ;;
  }

  dimension: force_mean {
    type: number
    sql: ${TABLE}.force_mean ;;
  }

  dimension: force_std {
    type: number
    sql: ${TABLE}.force_std ;;
  }

  dimension: is_prolonged {
    type: number
    sql: ${TABLE}.is_prolonged ;;
  }

  dimension: is_regulated {
    type: number
    sql: ${TABLE}.is_regulated ;;
  }

  dimension: output_format {
    type: string
    sql: ${TABLE}.OutputFormat ;;
  }

  dimension: pha_std {
    type: number
    sql: ${TABLE}.phaStd ;;
  }

  dimension: raw_name {
    type: string
    sql: ${TABLE}.Raw_Name ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: raw_time_stamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Raw_TimeStamp ;;
  }

  dimension: reg_splash_time {
    type: number
    sql: ${TABLE}.regSplashTime ;;
  }

  dimension: servo_current {
    type: number
    sql: ${TABLE}.servo_current ;;
  }

  dimension: volt_max {
    type: number
    sql: ${TABLE}.volt_max ;;
  }

  dimension: volt_mean {
    type: number
    sql: ${TABLE}.volt_mean ;;
  }

  dimension: volt_std {
    type: number
    sql: ${TABLE}.volt_std ;;
  }

  dimension: wear_per_cent {
    type: number
    sql: ${TABLE}.wearPerCent ;;
  }

  dimension: weld_timer {
    type: string
    sql: ${TABLE}.WeldTimer ;;
  }
  measure: count {
    type: count
    drill_fields: [raw_name]
  }
}
