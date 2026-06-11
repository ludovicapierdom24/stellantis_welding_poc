# Guida BigQuery per dashboard — Anomaly detection saldature 3L · 4,8 mm

Documento per il team **BI / Dashboard**.  
Qui trovi **quali tabelle usare**, **cosa contengono**, **quali grafici costruire** e **query SQL di partenza**.

---

## In sintesi

Il modello assegna a ogni saldatura un **punteggio di anomalia** (`anomaly_score`).  
**Più alto = più prioritario** per un controllo. Non è un “sì/no difetto”: è una **lista di priorità**.

| | |
|--|--|
| Saldature totali | ~143 000 |
| Saldature con esito ultrasuono (composizione principale) | **504** (di cui **23 difettose**) |
| Composizione principale | `2.0·0.8·2.0` → filtro `is_dominant_stack = TRUE` |
| Progetto BQ | `stellantis-molding-anomaly-det` |
| Dataset BQ | `molding_anomaly_poc` |
| Regione | `europe-west8` |

**Filtro consigliato su tutti i grafici:** `is_dominant_stack = TRUE`

**Chiavi per collegare le tabelle:** `original_filename` + `TimeStamp`

---

## Tabelle da usare (tutte disponibili)

| # | Tabella | Tipo | Righe | Uso |
|---|---------|------|------:|-----|
| 1 | `weld_training_scores_madi_3l48` | Tabella | 143 000 | Score e ranking per saldatura |
| 2 | `weld_training_madi_shap_3l48` | Tabella | 2 520 | Spiegazione del punteggio (5 segnali per saldatura) |
| 3 | `v_madi_kpi_dominant_3l48` | Vista | 3 | KPI aggregati (card grafico 4) |

Le altre tabelle del dataset (`weld_training_features_3l48`, `weld_training_scores_3l48`) **non servono** per la dashboard standard.

---

## Tabella 1 — Score saldature

`stellantis-molding-anomaly-det.molding_anomaly_poc.weld_training_scores_madi_3l48`

**Una riga = una saldatura.**

| Colonna | Tipo | Significato |
|---------|------|-------------|
| `original_filename` | STRING | Chiave saldatura |
| `TimeStamp` | TIMESTAMP | Chiave + asse temporale |
| `timer_name` | STRING | Timer / linea |
| `spot_name` | STRING | Punto di saldatura |
| `composition` | STRING | Stack lamiere |
| `anomaly_score` | FLOAT | **Punteggio anomalia** — ordinare DESC |
| `class_prob` | FLOAT | Probabilità “normale” |
| `is_dominant_stack` | BOOL | `TRUE` = composizione principale |
| `is_labeled` | BOOL | `TRUE` = ha esito ultrasuono |
| `Ultrasound` | STRING | `Good` o `KO` |
| `y` | INT | `0` = Good, `1` = KO |
| `scored_at` | TIMESTAMP | Versione dati |

---

## Tabella 2 — Spiegazione del punteggio

`stellantis-molding-anomaly-det.molding_anomaly_poc.weld_training_madi_shap_3l48`

**Formato long:** fino a **5 righe per saldatura** (top 5 segnali che spiegano il punteggio).  
Perimetro attuale: **504 saldature etichettate** sulla composizione principale.

| Colonna | Tipo | Significato |
|---------|------|-------------|
| `original_filename`, `TimeStamp` | | Chiavi (join con tabella 1) |
| `timer_name`, `spot_name`, `composition` | STRING | Filtri / etichette |
| `anomaly_score`, `class_prob` | FLOAT | Punteggio della saldatura |
| `y`, `Ultrasound`, `is_labeled` | | Esito ultrasuono |
| `rank` | INT | Posizione nel ranking sulle 504 etichettate (1 = più anomala) |
| `rank_pct` | FLOAT | Percentile nel ranking (0–100) |
| `in_top_5pct`, `in_top_10pct`, `in_top_15pct` | BOOL | Flag coda priorità |
| `shap_rank` | INT | 1 = segnale che spiega di più |
| `feature` | STRING | Nome segnale PLC (es. `pct_delta_voltage`) |
| `shap_anomaly` | FLOAT | Contributo: **positivo** = spinge verso anomalia |
| `abs_shap` | FLOAT | Importanza assoluta del segnale |
| `feature_value` | FLOAT | Valore del segnale (per tooltip) |
| `attribution_method` | STRING | Metodo usato (`shap_tree_explainer`) |
| `scored_at`, `computed_at` | TIMESTAMP | Versione score / calcolo spiegazione |

---

## Tabella 3 — KPI aggregati

`stellantis-molding-anomaly-det.molding_anomaly_poc.v_madi_kpi_dominant_3l48`

**Tre righe fisse** (top 5%, 10%, 15%). Leggere direttamente, **nessun join**.

| Colonna | Significato |
|---------|-------------|
| `top_pct` | `0.05`, `0.10`, `0.15` |
| `n_labeled` | Saldature etichettate (504) |
| `n_ko_total` | Difettose totali (23) |
| `n_top` | Saldature nella coda |
| `n_ko_top` | Difettose nella coda |
| `pct_ko_top` | % KO nella coda |
| `lift` | Ricchezza difetti vs media (~1 = caso, >1 = meglio) |
| `scored_at` | Versione dati |

**Valori attuali (run al 2026-06-05):**

| Coda | `n_top` | `n_ko_top` | `pct_ko_top` | `lift` |
|------|--------:|-----------:|-------------:|-------:|
| Top 5% | 26 | 3 | 11,5% | 2,53 |
| Top 10% | 51 | 4 | 7,8% | 1,72 |
| Top 15% | 76 | 4 | 5,3% | 1,15 |

Baseline: **4,6%** KO sulle 504 (`23 / 504`).

---

## Glossario

| Termine | Significato |
|---------|-------------|
| **anomaly_score** | Indice di priorità; non è “difetto sì/no” |
| **Good / KO** | Esito ultrasuono reale (solo 504 saldature) |
| **Top 10%** | ~51 saldature con score più alto sulle etichettate |
| **Lift** | Quanto la coda è più ricca di difetti della media |
| **feature** | Grandezza di processo (tensione, corrente, tempo, usura, …) |
| **shap_anomaly** | Contributo del segnale al punteggio alto |

---

## Grafici da realizzare (6)

### A — Operativi (3 grafici)

#### 1. Lista priorità saldature

| | |
|--|--|
| Tipo | Tabella ordinata |
| Dati | Tabella 1 |
| Filtro | `is_dominant_stack = TRUE` |
| Ordine | `anomaly_score DESC` |
| Colonne | `TimeStamp`, `timer_name`, `spot_name`, `anomaly_score`, `Ultrasound` |

```sql
SELECT
  TimeStamp,
  timer_name,
  spot_name,
  anomaly_score,
  Ultrasound
FROM `stellantis-molding-anomaly-det.molding_anomaly_poc.weld_training_scores_madi_3l48`
WHERE is_dominant_stack = TRUE
ORDER BY anomaly_score DESC
```

#### 2. Perché questa saldatura è in cima? (drill-down)

| | |
|--|--|
| Tipo | Barre orizzontali |
| Dati | Tabella 1 + Tabella 2 |
| Filtro | Una saldatura selezionata dal grafico 1 |
| Asse X | `shap_anomaly` |
| Asse Y | `feature` (`shap_rank` ≤ 5) |
| Tooltip | `feature_value` |

```sql
SELECT
  sh.feature,
  sh.shap_anomaly,
  sh.abs_shap,
  sh.feature_value,
  sh.shap_rank
FROM `stellantis-molding-anomaly-det.molding_anomaly_poc.weld_training_madi_shap_3l48` AS sh
WHERE sh.original_filename = @filename
  AND sh.TimeStamp = @timestamp
  AND sh.shap_rank <= 5
ORDER BY sh.shap_rank
```

#### 3. Segnali che spiegano di più i difetti

| | |
|--|--|
| Tipo | Barre verticali |
| Dati | Tabella 2 |
| Filtro | `y = 1` (solo KO) |
| Asse X | `feature` |
| Asse Y | `AVG(abs_shap)` |
| Ordine | Decrescente |

```sql
SELECT
  feature,
  AVG(abs_shap) AS avg_abs_shap,
  COUNT(*) AS n
FROM `stellantis-molding-anomaly-det.molding_anomaly_poc.weld_training_madi_shap_3l48`
WHERE y = 1
GROUP BY feature
ORDER BY avg_abs_shap DESC
```

---

### B — Validazione modello (3 grafici)

*Perimetro: `is_labeled = TRUE AND is_dominant_stack = TRUE` (504 righe, 23 KO).*

#### 4. KPI — Difetti trovati in cima alla lista

| | |
|--|--|
| Tipo | Card o mini-tabella (3 righe) |
| Dati | Tabella 3 (vista) |
| Metriche | `n_ko_top` / `n_ko_total`, `lift`, `pct_ko_top` |

```sql
SELECT
  top_pct,
  n_top,
  n_ko_top,
  n_ko_total,
  pct_ko_top,
  lift
FROM `stellantis-molding-anomaly-det.molding_anomaly_poc.v_madi_kpi_dominant_3l48`
ORDER BY top_pct
```

#### 5. Concentrazione difetti per fascia di score

| | |
|--|--|
| Tipo | Barre + linea di riferimento |
| Dati | Tabella 1 |
| Asse X | Decile 1–10 (10 = score più alto) |
| Asse Y | % KO nel decile |
| Linea | 4,6% (baseline) |

```sql
WITH labeled AS (
  SELECT anomaly_score, y
  FROM `stellantis-molding-anomaly-det.molding_anomaly_poc.weld_training_scores_madi_3l48`
  WHERE is_dominant_stack AND is_labeled
),
deciled AS (
  SELECT
    y,
    NTILE(10) OVER (ORDER BY anomaly_score ASC) AS decile
  FROM labeled
)
SELECT
  decile,
  COUNT(*) AS n,
  COUNTIF(y = 1) AS n_ko,
  100.0 * COUNTIF(y = 1) / COUNT(*) AS pct_ko
FROM deciled
GROUP BY decile
ORDER BY decile
```

#### 6. Distribuzione punteggio: Good vs difettose

| | |
|--|--|
| Tipo | Violin o box plot |
| Dati | Tabella 1 |
| Asse X | `Ultrasound` |
| Asse Y | `anomaly_score` |

```sql
SELECT Ultrasound, anomaly_score
FROM `stellantis-molding-anomaly-det.molding_anomaly_poc.weld_training_scores_madi_3l48`
WHERE is_dominant_stack AND is_labeled
```

---

## Schema collegamento

```text
  weld_training_scores_madi_3l48          v_madi_kpi_dominant_3l48
  (1 riga = 1 saldatura)                  (3 righe KPI)
         │                                        │
         │ join su original_filename + TimeStamp   │
         ▼                                        │
  weld_training_madi_shap_3l48                     │
  (max 5 righe / saldatura)                        │
                                                   │
  Grafici 1, 5, 6 ◄── score          Grafico 4 ◄── KPI
  Grafici 2, 3    ◄── score + SHAP
```

---

## Note per chi costruisce la dashboard

1. **Ranking, non classificazione:** `anomaly_score` ordina le saldature; non usare come soglia binaria “difetto sì/no”.
2. **Etichette limitate:** `Good`/`KO` esiste solo su 504 saldature — serve per validare il modello, non per etichettare tutte le 143k.
3. **Flag coda priorità:** `in_top_10pct` ecc. sono nella tabella SHAP (perimetro 504). Per la lista su tutte le 143k, ordinare per `anomaly_score`.
4. **Versione dati:** usare `scored_at` per allineare score, SHAP e KPI allo stesso aggiornamento.
5. **SHAP:** spiega quali segnali PLC hanno contribuito al punteggio; utile per drill-down e review dei casi in cima alla lista.

---

## Cosa non serve

- Tabella feature grezza (`weld_training_features_3l48`) — i valori rilevanti sono già in `feature_value` nella tabella SHAP
- Secondo modello (`weld_training_scores_3l48`) — solo per confronti interni, non per la dashboard operativa
- Spiegazioni su tutte le 143k saldature — la tabella SHAP copre le 504 etichettate

---

*Ultimo aggiornamento: 2026-06-10 · tabelle 1–3 pubblicate e verificate*
