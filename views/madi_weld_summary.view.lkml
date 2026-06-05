view: madi_weld_summary {
  derived_table: {
sql:
-- 1. Vero Positivo (Spatter per Corrente/Forza)
SELECT
  CAST('120996310' AS STRING) AS prot_record_id,
  CAST('KO' AS STRING) AS ultrasound_result,
  CAST(-0.882 AS FLOAT64) AS madi_score,
  CAST(TRUE AS BOOLEAN) AS is_anomaly,
  CAST(0.68 AS FLOAT64) AS attrib_current,
  CAST(0.22 AS FLOAT64) AS attrib_force,
  CAST(0.05 AS FLOAT64) AS attrib_time,
  CAST(0.05 AS FLOAT64) AS attrib_wear,
  CAST('Current_Actual (68%), Force_Curve_Drop (22%)' AS STRING) AS top_attributions_summary,
  CAST('L\'anomalia è causata principalmente da un picco di Corrente (68%) accompagnato da un calo improvviso di Forza (22%). Questo pattern è il sintomo classico di una espulsione di materiale fuso (Spatter). \n\n**Azioni Suggerite:**\n1. Controllare i parametri di serraggio pneumatico della pinza.\n2. Verificare eventuale sporco o gap eccessivo tra le lamiere.' AS STRING) AS gemini_rca_text

UNION ALL

-- 2. Vero Positivo (Saldatura Fredda per Usura Elettrodo)
SELECT
  '121333155', 'KO', -0.651, TRUE, 0.05, 0.05, 0.05, 0.85, 'Electrode_Wear_Max (85%), Tip_Dress_Delay (10%)',
  'Il modello MADI attribuisce l\'anomalia in modo preponderante all\'Usura dell\'Elettrodo (85%). Una superficie di contatto appiattita riduce drasticamente la densità di corrente, portando a un giunto freddo con lente insufficiente.\n\n**Azioni Suggerite:**\n1. Forzare un ciclo immediato di ravvivatura (Tip Dress).\n2. Ispezionare la fresa della stazione di pulizia per verificare che non sia consumata.'

UNION ALL

-- 3. Falso Positivo / Falso Allarme (Problema di Tempo, ma pezzo OK)
SELECT
  '120851301', 'Good', -0.105, TRUE, 0.10, 0.15, 0.55, 0.20, 'Time_Cycle_Prolongation (55%)',
  'Rilevato un prolungamento anomalo del Tempo di Ciclo (55%). Essendo il test a ultrasuoni "Good", la tenuta del giunto non è compromessa. Si tratta di una deviazione di processo, non di qualità.\n\n**Azioni Suggerite:**\n1. Monitorare la fluidità dei movimenti del robot.\n2. Verificare se vi sono impuntamenti meccanici o cali di pressione nell\'aria compressa di stabilizzazione.'

UNION ALL

-- 4. Pezzo Normale
SELECT
  '121395023', 'Good', 0.950, FALSE, 0.10, 0.10, 0.10, 0.10, 'N/A (Normal)',
  'Nessuna anomalia rilevata. I parametri fisici rientrano perfettamente nel profilo standard del modello MADI.'

UNION ALL

-- 5. Falso Negativo (Missed Defect)
SELECT
  '120286645', 'KO', 0.150, FALSE, 0.25, 0.30, 0.10, 0.05, 'N/A (Missed Defect)',
  'Il modello non ha rilevato derive statisticamente significative (Score positivo), ma il pezzo risulta scartato agli ultrasuoni. \n\n**Nota per Data Science:** Possibile necessità di ritraining del modello o l\'anomalia è causata da una variabile attualmente non monitorata dal PLC (es. lega del materiale non conforme).';;
  }
  label: "MADI & Gemini Analysis"

  # ==========================================
  # DIMENSIONS (Base Columns)
  # ==========================================

  dimension: prot_record_id {
    primary_key: yes
    type: string
    label: "Prot Record ID"
    description: "Unique identifier for the welding spot. Used as primary key for joins."
    sql: ${TABLE}.prot_record_id ;;
  }

  dimension: ultrasound_result {
    type: string
    label: "Ultrasound Result"
    description: "Physical Non-Destructive Test outcome (Ground Truth). Values: Good, KO."
    sql: ${TABLE}.ultrasound_result ;;
  }

  dimension: madi_score {
    type: number
    label: "MADI Score"
    description: "Anomaly score calculated by the Multivariate Anomaly Detection algorithm. Values < 0 represent anomalies."
    value_format_name: decimal_3
    sql: ${TABLE}.madi_score ;;
  }

  dimension: is_anomaly {
    type: yesno
    label: "Is AI Anomaly (MADI)"
    description: "Boolean flag indicating if the model classified the weld as an anomaly (Score < 0)."
    sql: ${TABLE}.is_anomaly ;;
  }

  # ==========================================
  # DIMENSIONS: FEATURE ATTRIBUTIONS (MADI)
  # ==========================================

  dimension: attrib_current {
    type: number
    hidden: yes # Hidden to avoid cluttering the UI; we will expose the measures instead.
    sql: ${TABLE}.attrib_current ;;
  }

  dimension: attrib_force {
    type: number
    hidden: yes
    sql: ${TABLE}.attrib_force ;;
  }

  dimension: attrib_time {
    type: number
    hidden: yes
    sql: ${TABLE}.attrib_time ;;
  }

  dimension: attrib_wear {
    type: number
    hidden: yes
    sql: ${TABLE}.attrib_wear ;;
  }

  dimension: top_attributions_summary {
    type: string
    label: "Top Feature Contributions"
    description: "String summarizing the main physical variables driving the anomaly. Used as context for Gemini RCA."
    sql: ${TABLE}.top_attributions_summary ;;
  }

  # ==========================================
  # DIMENSIONS: GENERATIVE AI OUTPUT
  # ==========================================

  dimension: gemini_rca_text {
    type: string
    label: "Root Cause Analysis (Gemini)"
    description: "Pre-calculated AI diagnostic and suggested actions generated by Vertex AI based on MADI attributions."
    sql: ${TABLE}.gemini_rca_text ;;
    # The HTML tag ensures that line breaks (\n) and markdown elements generated by Gemini are rendered properly in Looker.
    html: <div style="white-space: pre-wrap; line-height: 1.5; color: #3C4043;">{{ value }}</div> ;;
  }

  # ==========================================
  # MEASURES (KPIs & Aggregations)
  # ==========================================

  measure: total_welds {
    type: count
    label: "Total Welds Analyzed"
    description: "Total count of welding records processed by the system."
  }

  measure: count_ai_anomalies {
    type: count
    label: "Detected Anomalies (MADI)"
    description: "Count of welds flagged as anomalous by the MADI algorithm."
    filters: [is_anomaly: "yes"]
  }

  measure: count_ko {
    type: count
    label: "Defective Welds (UT KO)"
    description: "Count of welds that failed the physical ultrasound test."
    filters: [ultrasound_result: "KO"]
  }

  measure: defect_rate {
    type: number
    label: "Defect Rate %"
    description: "Percentage of defective welds (UT KO) over the total."
    value_format_name: percent_2
    sql: 1.0 * ${count_ko} / NULLIF(${total_welds}, 0) ;;
  }

  measure: estimated_copq {
    type: number
    label: "Estimated COPQ"
    description: "Cost Of Poor Quality: Economic impact estimation of scrapped parts (Defective Welds * Unit Cost)."
    value_format: "\"€\"#,##0.00"
    sql: ${count_ko} * 35.50 ;;
  }

  measure: average_madi_score {
    type: average
    label: "Average MADI Score"
    description: "Average anomaly score across the selected dataset."
    value_format_name: decimal_3
    sql: ${madi_score} ;;
  }

  # ==========================================
  # MEASURES: GLOBAL ATTRIBUTION AVERAGES
  # ==========================================
  # These measures are filtered to compute the average ONLY for anomalous records.
  # This prevents normal welds (with 0 attributions) from diluting the metrics in the bar chart.

  measure: avg_attrib_current {
    type: average
    label: "Avg Contribution: Current"
    group_label: "Global Feature Attribution"
    description: "Average contribution of Welding Current to the detected anomalies."
    value_format_name: percent_1
    filters: [is_anomaly: "yes"]
    sql: ${attrib_current} ;;
  }

  measure: avg_attrib_force {
    type: average
    label: "Avg Contribution: Force"
    group_label: "Global Feature Attribution"
    description: "Average contribution of Applied Force to the detected anomalies."
    value_format_name: percent_1
    filters: [is_anomaly: "yes"]
    sql: ${attrib_force} ;;
  }

  measure: avg_attrib_time {
    type: average
    label: "Avg Contribution: Time Cycle"
    group_label: "Global Feature Attribution"
    description: "Average contribution of Cycle Time to the detected anomalies."
    value_format_name: percent_1
    filters: [is_anomaly: "yes"]
    sql: ${attrib_time} ;;
  }

  measure: avg_attrib_wear {
    type: average
    label: "Avg Contribution: Electrode Wear"
    group_label: "Global Feature Attribution"
    description: "Average contribution of Electrode Wear to the detected anomalies."
    value_format_name: percent_1
    filters: [is_anomaly: "yes"]
    sql: ${attrib_wear} ;;
  }



  }
