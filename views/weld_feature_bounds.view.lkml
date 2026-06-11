view: weld_feature_bounds {
  derived_table: {
    sql:
      SELECT
        feature,
        MIN(feature_value) AS global_min,
        MAX(feature_value) AS global_max
      FROM `stellantis-molding-anomaly-det.molding_anomaly_poc.weld_training_madi_shap_3l48`
      GROUP BY 1 ;;
  }

  dimension: feature {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.feature ;;
  }

  dimension: global_min {
    type: number
    hidden: yes
    sql: ${TABLE}.global_min ;;
  }

  dimension: global_max {
    type: number
    hidden: yes
    sql: ${TABLE}.global_max ;;
  }
}
