view: weld_training_scores_madi_3l48 {
  sql_table_name: `stellantis-molding-anomaly-det.molding_anomaly_poc.weld_training_scores_madi_labeled_dominant_3l48` ;;

    dimension: anomaly_score {
      type: number
      description: "Punteggio anomalia del modello; più alto = più sospetto. MADI: 1 − class_prob. IF: score sklearn (più alto = più anomalo)."
      sql: ${TABLE}.anomaly_score ;;
    }
    dimension: class_prob {
      type: number
      description: "Probabilità stimata di appartenenza alla classe normale (MADI); più bassa = più anomalo."
      sql: ${TABLE}.class_prob ;;
    }
    dimension: composition {
      type: string
      description: "Stack lamiere th1·th2·th3 (testo, mm)."
      sql: ${TABLE}.composition ;;
    }
    dimension: decile_global {
      type: number
      description: "Fascia decile 1–10 sul ranking globale (10 = score più alti)."
      sql: ${TABLE}.decile_global ;;
    }
    dimension: feature_set_id {
      type: string
      description: "Identificativo ricetta feature (es. v1_voltage_plus)."
      sql: ${TABLE}.feature_set_id ;;
    }
    dimension: in_top_10pct {
      type: yesno
      description: "TRUE se la saldatura è nella coda priorità globale top 10% del pool scoreato."
      sql: ${TABLE}.in_top_10pct ;;
    }
    dimension: in_top_15pct {
      type: yesno
      description: "TRUE se la saldatura è nella coda priorità globale top 15% del pool scoreato."
      sql: ${TABLE}.in_top_15pct ;;
    }
    dimension: in_top_5pct {
      type: yesno
      description: "TRUE se la saldatura è nella coda priorità globale top 5% del pool scoreato."
      sql: ${TABLE}.in_top_5pct ;;
    }
    dimension: is_dominant_stack {
      type: yesno
      description: "True se composizione = 2.0·0.8·2.0 mm (stack dominante su questa tipologia)."
      sql: ${TABLE}.is_dominant_stack ;;
    }
    dimension: is_labeled {
      type: yesno
      description: "True se la saldatura ha etichetta ultrasuoni."
      sql: ${TABLE}.is_labeled ;;
    }
    dimension: madi_sample_delta {
      type: number
      description: "Iperparametro MADI sample_delta al momento del fit."
      sql: ${TABLE}.madi_sample_delta ;;
    }
    dimension: madi_sample_ratio {
      type: number
      description: "Iperparametro MADI sample_ratio al momento del fit."
      sql: ${TABLE}.madi_sample_ratio ;;
    }
    dimension: model_algorithm {
      type: string
      description: "Algoritmo usato per lo score (es. MADI-NegativeSamplingRandomForest)."
      sql: ${TABLE}.model_algorithm ;;
    }
    dimension: original_filename {
      primary_key: yes
      hidden: yes
      type: string
      description: "Nome file log PLC; chiave verso plc_logs e summary_weldlog."
      sql: ${TABLE}.original_filename ;;
    }
    dimension: rank_dominant_labeled {
      type: number
      description: "Rank tra sole etichettate dominante (504); NULL se non etichettata o fuori perimetro."
      sql: ${TABLE}.rank_dominant_labeled ;;
    }
    dimension: rank_global {
      type: number
      description: "Posizione nel ranking globale per anomaly_score DESC (1 = più anomala nel pool scoreato)."
      sql: ${TABLE}.rank_global ;;
    }
    dimension: rank_pct_global {
      type: number
      description: "Percentile nel ranking globale (0–100; più basso = più in cima)."
      sql: ${TABLE}.rank_pct_global ;;
    }
    dimension: scored_at {
      type: string
      description: "Timestamp UTC dell'ultimo run di scoring pubblicato su BigQuery."
      sql: ${TABLE}.scored_at ;;
    }
    dimension: sheet {
      type: number
      description: "Numero di lamiere del giunto (da spot_sheet_details)."
      sql: ${TABLE}.sheet ;;
    }
    dimension: split {
      type: string
      description: "Partizione temporale globale: train o test (solo informativa; il fit MADI ufficiale non usa le etichette)."
      sql: ${TABLE}.split ;;
    }
    dimension: spot_name {
      type: string
      description: "Identificativo punto di saldatura sul pezzo (stringa PLC)."
      sql: ${TABLE}.spot_name ;;
    }
    dimension_group: time_stamp {
      type: time
      description: "Istante della saldatura (UTC)."
      timeframes: [raw, time, date, week, month, quarter, year]
      sql: ${TABLE}.TimeStamp ;;
    }
    dimension: timer_name {
      type: string
      description: "Identificativo controller di saldatura (PLC)."
      sql: ${TABLE}.timer_name ;;
    }
    dimension: train_recent_quantile {
      type: number
      description: "Quantile temporale minimo per il fit (es. 0.75 = ultimo quarto); NULL se non applicato."
      sql: ${TABLE}.train_recent_quantile ;;
    }
    dimension: train_scope {
      type: string
      description: "Perimetro di fit del modello (es. unlabeled_dominant_recent, labeled_good_dominant)."
      sql: ${TABLE}.train_scope ;;
    }
    dimension: tth_round {
      type: number
      description: "Spessore totale arrotondato a 0,1 mm (filtro tipologia)."
      sql: ${TABLE}.Tth_round ;;
    }
    dimension: ultrasound {
      type: string
      description: "Esito controllo ultrasuoni: Good o KO (NULL se non etichettato)."
      sql: ${TABLE}.Ultrasound ;;
    }
    dimension: y {
      type: number
      description: "Target binario: 0=Good, 1=KO, NULL se non etichettato."
      sql: ${TABLE}.y ;;
    }
    measure: count {
      type: count
      drill_fields: [timer_name, original_filename, spot_name]
    }
}
