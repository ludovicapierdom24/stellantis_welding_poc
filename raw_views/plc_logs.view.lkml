view: plc_logs {
  sql_table_name: `stellantis-molding-anomaly-det.molding_anomaly_poc.plc_logs` ;;

  dimension: message__weld_log__contact_wait_time {
    type: string
    sql: ${TABLE}.Message.WeldLog.contactWaitTime ;;
    group_label: "Message Weld Log"
    group_item_label: "Contact Wait Time"
  }
  dimension: message__weld_log__current_actual_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.currentActualValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Current Actual Value"
  }
  dimension: message__weld_log__current_curve {
    hidden: yes
    sql: ${TABLE}.Message.WeldLog.CurrentCurve ;;
    group_label: "Message Weld Log"
    group_item_label: "Current Curve"
  }
  dimension: message__weld_log__current_factor {
    type: number
    sql: ${TABLE}.Message.WeldLog.currentFactor ;;
    group_label: "Message Weld Log"
    group_item_label: "Current Factor"
  }
  dimension: message__weld_log__current_reference_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.currentReferenceValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Current Reference Value"
  }
  dimension_group: message__weld_log__date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Message.WeldLog.dateTime ;;
  }
  dimension: message__weld_log__decline_usp {
    type: number
    sql: ${TABLE}.Message.WeldLog.declineUsp ;;
    group_label: "Message Weld Log"
    group_item_label: "Decline Usp"
  }
  dimension: message__weld_log__electrode_no {
    type: number
    sql: ${TABLE}.Message.WeldLog.electrodeNo ;;
    group_label: "Message Weld Log"
    group_item_label: "Electrode No"
  }
  dimension: message__weld_log__energy_actual_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.energyActualValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Energy Actual Value"
  }
  dimension: message__weld_log__energy_ref_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.energyRefValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Energy Ref Value"
  }
  dimension: message__weld_log__force_curve {
    hidden: yes
    sql: ${TABLE}.Message.WeldLog.ForceCurve ;;
    group_label: "Message Weld Log"
    group_item_label: "Force Curve"
  }
  dimension: message__weld_log__fqf_actual_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.fqfActualValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Fqf Actual Value"
  }
  dimension: message__weld_log__fqf_measuring_active {
    type: number
    sql: ${TABLE}.Message.WeldLog.fqfMeasuringActive ;;
    group_label: "Message Weld Log"
    group_item_label: "Fqf Measuring Active"
  }
  dimension: message__weld_log__fqf_mon_cond_lower_tol {
    type: number
    sql: ${TABLE}.Message.WeldLog.fqfMonCondLowerTol ;;
    group_label: "Message Weld Log"
    group_item_label: "Fqf Mon Cond Lower Tol"
  }
  dimension: message__weld_log__fqf_mon_cond_upper_tol {
    type: number
    sql: ${TABLE}.Message.WeldLog.fqfMonCondUpperTol ;;
    group_label: "Message Weld Log"
    group_item_label: "Fqf Mon Cond Upper Tol"
  }
  dimension: message__weld_log__fqf_mon_lower_tol {
    type: number
    sql: ${TABLE}.Message.WeldLog.fqfMonLowerTol ;;
    group_label: "Message Weld Log"
    group_item_label: "Fqf Mon Lower Tol"
  }
  dimension: message__weld_log__fqf_mon_upper_tol {
    type: number
    sql: ${TABLE}.Message.WeldLog.fqfMonUpperTol ;;
    group_label: "Message Weld Log"
    group_item_label: "Fqf Mon Upper Tol"
  }
  dimension: message__weld_log__fqf_ref_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.fqfRefValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Fqf Ref Value"
  }
  dimension: message__weld_log__i_actual1 {
    type: number
    sql: ${TABLE}.Message.WeldLog.iActual1 ;;
    group_label: "Message Weld Log"
    group_item_label: "I Actual1"
  }
  dimension: message__weld_log__i_actual2 {
    type: number
    sql: ${TABLE}.Message.WeldLog.iActual2 ;;
    group_label: "Message Weld Log"
    group_item_label: "I Actual2"
  }
  dimension: message__weld_log__i_actual3 {
    type: number
    sql: ${TABLE}.Message.WeldLog.iActual3 ;;
    group_label: "Message Weld Log"
    group_item_label: "I Actual3"
  }
  dimension: message__weld_log__i_demand1 {
    type: number
    sql: ${TABLE}.Message.WeldLog.iDemand1 ;;
    group_label: "Message Weld Log"
    group_item_label: "I Demand1"
  }
  dimension: message__weld_log__i_demand2 {
    type: number
    sql: ${TABLE}.Message.WeldLog.iDemand2 ;;
    group_label: "Message Weld Log"
    group_item_label: "I Demand2"
  }
  dimension: message__weld_log__i_demand3 {
    type: number
    sql: ${TABLE}.Message.WeldLog.iDemand3 ;;
    group_label: "Message Weld Log"
    group_item_label: "I Demand3"
  }
  dimension: message__weld_log__i_demand_std {
    type: number
    sql: ${TABLE}.Message.WeldLog.iDemandStd ;;
    group_label: "Message Weld Log"
    group_item_label: "I Demand Std"
  }
  dimension: message__weld_log__ilsts {
    type: number
    sql: ${TABLE}.Message.WeldLog.ilsts ;;
    group_label: "Message Weld Log"
    group_item_label: "Ilsts"
  }
  dimension: message__weld_log__measure_state {
    type: number
    sql: ${TABLE}.Message.WeldLog.measureState ;;
    group_label: "Message Weld Log"
    group_item_label: "Measure State"
  }
  dimension: message__weld_log__monitor_mode {
    type: number
    sql: ${TABLE}.Message.WeldLog.monitorMode ;;
    group_label: "Message Weld Log"
    group_item_label: "Monitor Mode"
  }
  dimension: message__weld_log__monitor_state {
    type: number
    sql: ${TABLE}.Message.WeldLog.monitorState ;;
    group_label: "Message Weld Log"
    group_item_label: "Monitor State"
  }
  dimension: message__weld_log__norming_time {
    type: number
    sql: ${TABLE}.Message.WeldLog.normingTime ;;
    group_label: "Message Weld Log"
    group_item_label: "Norming Time"
  }
  dimension: message__weld_log__nugget_diameter {
    type: number
    sql: ${TABLE}.Message.WeldLog.nuggetDiameter ;;
    group_label: "Message Weld Log"
    group_item_label: "Nugget Diameter"
  }
  dimension: message__weld_log__offset_usp {
    type: number
    sql: ${TABLE}.Message.WeldLog.offsetUsp ;;
    group_label: "Message Weld Log"
    group_item_label: "Offset Usp"
  }
  dimension: message__weld_log__part_ident_string {
    type: string
    sql: ${TABLE}.Message.WeldLog.partIdentString ;;
    group_label: "Message Weld Log"
    group_item_label: "Part Ident String"
  }
  dimension: message__weld_log__pha1 {
    type: number
    sql: ${TABLE}.Message.WeldLog.pha1 ;;
    group_label: "Message Weld Log"
    group_item_label: "Pha1"
  }
  dimension: message__weld_log__pha2 {
    type: number
    sql: ${TABLE}.Message.WeldLog.pha2 ;;
    group_label: "Message Weld Log"
    group_item_label: "Pha2"
  }
  dimension: message__weld_log__pha3 {
    type: number
    sql: ${TABLE}.Message.WeldLog.pha3 ;;
    group_label: "Message Weld Log"
    group_item_label: "Pha3"
  }
  dimension: message__weld_log__pha_std {
    type: number
    sql: ${TABLE}.Message.WeldLog.phaStd ;;
    group_label: "Message Weld Log"
    group_item_label: "Pha Std"
  }
  dimension: message__weld_log__power_actual_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.powerActualValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Power Actual Value"
  }
  dimension: message__weld_log__power_ref_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.powerRefValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Power Ref Value"
  }
  dimension: message__weld_log__power_state {
    type: number
    sql: ${TABLE}.Message.WeldLog.powerState ;;
    group_label: "Message Weld Log"
    group_item_label: "Power State"
  }
  dimension: message__weld_log__prog_no {
    type: number
    sql: ${TABLE}.Message.WeldLog.progNo ;;
    group_label: "Message Weld Log"
    group_item_label: "Prog No"
  }
  dimension: message__weld_log__prot_record_id {
    type: number
    sql: ${TABLE}.Message.WeldLog.protRecord_ID ;;
    group_label: "Message Weld Log"
    group_item_label: "Prot Record ID"
  }
  dimension: message__weld_log__pulse_width_actual_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.pulseWidthActualValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Pulse Width Actual Value"
  }
  dimension: message__weld_log__pulse_width_ref_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.pulseWidthRefValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Pulse Width Ref Value"
  }
  dimension: message__weld_log__reg_splash_time {
    type: number
    sql: ${TABLE}.Message.WeldLog.regSplashTime ;;
    group_label: "Message Weld Log"
    group_item_label: "Reg Splash Time"
  }
  dimension: message__weld_log__reg_spot_dia_actual {
    type: number
    sql: ${TABLE}.Message.WeldLog.regSpotDiaActual ;;
    group_label: "Message Weld Log"
    group_item_label: "Reg Spot Dia Actual"
  }
  dimension: message__weld_log__reg_spot_dia_min_demand {
    type: number
    sql: ${TABLE}.Message.WeldLog.regSpotDiaMinDemand ;;
    group_label: "Message Weld Log"
    group_item_label: "Reg Spot Dia Min Demand"
  }
  dimension: message__weld_log__reg_usr_usp_junction {
    type: number
    sql: ${TABLE}.Message.WeldLog.regUsrUspJunction ;;
    group_label: "Message Weld Log"
    group_item_label: "Reg Usr Usp Junction"
  }
  dimension: message__weld_log__reg_usr_usp_max {
    type: number
    sql: ${TABLE}.Message.WeldLog.regUsrUspMax ;;
    group_label: "Message Weld Log"
    group_item_label: "Reg Usr Usp Max"
  }
  dimension: message__weld_log__regulation1 {
    type: number
    sql: ${TABLE}.Message.WeldLog.regulation1 ;;
    group_label: "Message Weld Log"
    group_item_label: "Regulation1"
  }
  dimension: message__weld_log__regulation2 {
    type: number
    sql: ${TABLE}.Message.WeldLog.regulation2 ;;
    group_label: "Message Weld Log"
    group_item_label: "Regulation2"
  }
  dimension: message__weld_log__regulation3 {
    type: number
    sql: ${TABLE}.Message.WeldLog.regulation3 ;;
    group_label: "Message Weld Log"
    group_item_label: "Regulation3"
  }
  dimension: message__weld_log__regulation_start_time {
    type: number
    sql: ${TABLE}.Message.WeldLog.regulationStartTime ;;
    group_label: "Message Weld Log"
    group_item_label: "Regulation Start Time"
  }
  dimension: message__weld_log__regulation_state {
    type: number
    sql: ${TABLE}.Message.WeldLog.regulationState ;;
    group_label: "Message Weld Log"
    group_item_label: "Regulation State"
  }
  dimension: message__weld_log__regulation_std {
    type: number
    sql: ${TABLE}.Message.WeldLog.regulationStd ;;
    group_label: "Message Weld Log"
    group_item_label: "Regulation Std"
  }
  dimension: message__weld_log__resistance_actual_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.resistanceActualValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Resistance Actual Value"
  }
  dimension: message__weld_log__resistance_ref_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.resistanceRefValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Resistance Ref Value"
  }
  dimension: message__weld_log__return_to_constant_current {
    type: number
    sql: ${TABLE}.Message.WeldLog.returnToConstantCurrent ;;
    group_label: "Message Weld Log"
    group_item_label: "Return to Constant Current"
  }
  dimension: message__weld_log__reweld_active {
    type: number
    sql: ${TABLE}.Message.WeldLog.reweldActive ;;
    group_label: "Message Weld Log"
    group_item_label: "Reweld Active"
  }
  dimension: message__weld_log__sequence_repeat {
    type: number
    sql: ${TABLE}.Message.WeldLog.sequenceRepeat ;;
    group_label: "Message Weld Log"
    group_item_label: "Sequence Repeat"
  }
  dimension: message__weld_log__sequence_state {
    type: number
    sql: ${TABLE}.Message.WeldLog.sequenceState ;;
    group_label: "Message Weld Log"
    group_item_label: "Sequence State"
  }
  dimension: message__weld_log__sequence_state_add {
    type: number
    sql: ${TABLE}.Message.WeldLog.sequenceStateAdd ;;
    group_label: "Message Weld Log"
    group_item_label: "Sequence State Add"
  }
  dimension: message__weld_log__sg_aperture_dim_in_suff {
    type: string
    sql: ${TABLE}.Message.WeldLog.sg_ApertureDimInSuff ;;
    group_label: "Message Weld Log"
    group_item_label: "Sg Aperture Dim In Suff"
  }
  dimension: message__weld_log__sg_beam_up_arching {
    type: string
    sql: ${TABLE}.Message.WeldLog.sg_Beam_UpArching ;;
    group_label: "Message Weld Log"
    group_item_label: "Sg Beam Up Arching"
  }
  dimension: message__weld_log__sg_force {
    type: number
    sql: ${TABLE}.Message.WeldLog.sgForce ;;
    group_label: "Message Weld Log"
    group_item_label: "Sg Force"
  }
  dimension: message__weld_log__sg_force_corr {
    type: string
    sql: ${TABLE}.Message.WeldLog.sg_Force_Corr ;;
    group_label: "Message Weld Log"
    group_item_label: "Sg Force Corr"
  }
  dimension: message__weld_log__sg_force_set_point {
    type: string
    sql: ${TABLE}.Message.WeldLog.sgForceSetPoint ;;
    group_label: "Message Weld Log"
    group_item_label: "Sg Force Set Point"
  }
  dimension: message__weld_log__sg_motor_current {
    type: number
    sql: ${TABLE}.Message.WeldLog.sgMotorCurrent ;;
    group_label: "Message Weld Log"
    group_item_label: "Sg Motor Current"
  }
  dimension: message__weld_log__sg_motor_temp {
    type: number
    sql: ${TABLE}.Message.WeldLog.sgMotorTemp ;;
    group_label: "Message Weld Log"
    group_item_label: "Sg Motor Temp"
  }
  dimension: message__weld_log__sg_sag_gc {
    type: number
    sql: ${TABLE}.Message.WeldLog.sgSagGc ;;
    group_label: "Message Weld Log"
    group_item_label: "Sg Sag Gc"
  }
  dimension: message__weld_log__sg_sag_gp {
    type: number
    sql: ${TABLE}.Message.WeldLog.sgSagGp ;;
    group_label: "Message Weld Log"
    group_item_label: "Sg Sag Gp"
  }
  dimension: message__weld_log__sg_sag_gp_set_point {
    type: string
    sql: ${TABLE}.Message.WeldLog.sgSagGpSetPoint ;;
    group_label: "Message Weld Log"
    group_item_label: "Sg Sag Gp Set Point"
  }
  dimension: message__weld_log__sg_sheet_thickness {
    type: number
    sql: ${TABLE}.Message.WeldLog.sgSheetThickness ;;
    group_label: "Message Weld Log"
    group_item_label: "Sg Sheet Thickness"
  }
  dimension: message__weld_log__sg_sheet_thickness_set_point {
    type: string
    sql: ${TABLE}.Message.WeldLog.sgSheetThicknessSetPoint ;;
    group_label: "Message Weld Log"
    group_item_label: "Sg Sheet Thickness Set Point"
  }
  dimension: message__weld_log__sg_spot_with_sg {
    type: number
    sql: ${TABLE}.Message.WeldLog.sgSpotWithSg ;;
    group_label: "Message Weld Log"
    group_item_label: "Sg Spot with Sg"
  }
  dimension: message__weld_log__sg_torque_gp {
    type: string
    sql: ${TABLE}.Message.WeldLog.sg_Torque_Gp ;;
    group_label: "Message Weld Log"
    group_item_label: "Sg Torque Gp"
  }
  dimension: message__weld_log__sg_wear_length {
    type: string
    sql: ${TABLE}.Message.WeldLog.sg_Wear_Length ;;
    group_label: "Message Weld Log"
    group_item_label: "Sg Wear Length"
  }
  dimension: message__weld_log__sg_weldspot_geo_wear {
    type: string
    sql: ${TABLE}.Message.WeldLog.sg_Weldspot_Geo_Wear ;;
    group_label: "Message Weld Log"
    group_item_label: "Sg Weldspot Geo Wear"
  }
  dimension: message__weld_log__spot_name {
    type: string
    sql: ${TABLE}.Message.WeldLog.spotName ;;
    group_label: "Message Weld Log"
    group_item_label: "Spot Name"
  }
  dimension: message__weld_log__stabilisation_factor_act_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.stabilisationFactorActValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Stabilisation Factor Act Value"
  }
  dimension: message__weld_log__stabilisation_factor_ref_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.stabilisationFactorRefValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Stabilisation Factor Ref Value"
  }
  dimension: message__weld_log__t_actual_std {
    type: number
    sql: ${TABLE}.Message.WeldLog.tActualStd ;;
    group_label: "Message Weld Log"
    group_item_label: "T Actual Std"
  }
  dimension: message__weld_log__t_i_demand_std {
    type: number
    value_format_name: id
    sql: ${TABLE}.Message.WeldLog.t_iDemandStd ;;
    group_label: "Message Weld Log"
    group_item_label: "T I Demand Std"
  }
  dimension: message__weld_log__threshold_stabilisation_factor {
    type: number
    sql: ${TABLE}.Message.WeldLog.thresholdStabilisationFactor ;;
    group_label: "Message Weld Log"
    group_item_label: "Threshold Stabilisation Factor"
  }
  dimension: message__weld_log__timer_name {
    type: string
    sql: ${TABLE}.Message.WeldLog.timerName ;;
    group_label: "Message Weld Log"
    group_item_label: "Timer Name"
  }
  dimension: message__weld_log__tip_dress_counter {
    type: number
    sql: ${TABLE}.Message.WeldLog.tipDressCounter ;;
    group_label: "Message Weld Log"
    group_item_label: "Tip Dress Counter"
  }
  dimension: message__weld_log__trigger_time {
    type: number
    sql: ${TABLE}.Message.WeldLog.triggerTime ;;
    group_label: "Message Weld Log"
    group_item_label: "Trigger Time"
  }
  dimension: message__weld_log__uip_actual_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.uipActualValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Uip Actual Value"
  }
  dimension: message__weld_log__uip_mon_cond_upper_tol {
    type: number
    sql: ${TABLE}.Message.WeldLog.uipMonCondUpperTol ;;
    group_label: "Message Weld Log"
    group_item_label: "Uip Mon Cond Upper Tol"
  }
  dimension: message__weld_log__uip_ref_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.uipRefValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Uip Ref Value"
  }
  dimension: message__weld_log__uir_expulsion_time {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirExpulsionTime ;;
    group_label: "Message Weld Log"
    group_item_label: "Uir Expulsion Time"
  }
  dimension: message__weld_log__uir_measuring_active {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirMeasuringActive ;;
    group_label: "Message Weld Log"
    group_item_label: "Uir Measuring Active"
  }
  dimension: message__weld_log__uir_monitoring_active {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirMonitoringActive ;;
    group_label: "Message Weld Log"
    group_item_label: "Uir Monitoring Active"
  }
  dimension: message__weld_log__uir_psf_cond_tol {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirPsfCondTol ;;
    group_label: "Message Weld Log"
    group_item_label: "Uir Psf Cond Tol"
  }
  dimension: message__weld_log__uir_psf_lower_tol {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirPsfLowerTol ;;
    group_label: "Message Weld Log"
    group_item_label: "Uir Psf Lower Tol"
  }
  dimension: message__weld_log__uir_qstopp_act_cnt_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirQStoppActCntValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Uir Qstopp Act Cnt Value"
  }
  dimension: message__weld_log__uir_qstopp_ref_cnt_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirQStoppRefCntValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Uir Qstopp Ref Cnt Value"
  }
  dimension: message__weld_log__uir_regulation_active {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirRegulationActive ;;
    group_label: "Message Weld Log"
    group_item_label: "Uir Regulation Active"
  }
  dimension: message__weld_log__uir_uip_cond_tol {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirUipCondTol ;;
    group_label: "Message Weld Log"
    group_item_label: "Uir Uip Cond Tol"
  }
  dimension: message__weld_log__uir_uip_lower_tol {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirUipLowerTol ;;
    group_label: "Message Weld Log"
    group_item_label: "Uir Uip Lower Tol"
  }
  dimension: message__weld_log__uir_uip_upper_tol {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirUipUpperTol ;;
    group_label: "Message Weld Log"
    group_item_label: "Uir Uip Upper Tol"
  }
  dimension: message__weld_log__uir_weld_time_prolongation_active {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirWeldTimeProlongationActive ;;
    group_label: "Message Weld Log"
    group_item_label: "Uir Weld Time Prolongation Active"
  }
  dimension: message__weld_log__usp {
    type: number
    sql: ${TABLE}.Message.WeldLog.usp ;;
    group_label: "Message Weld Log"
    group_item_label: "Usp"
  }
  dimension: message__weld_log__voltage_actual_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.voltageActualValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Voltage Actual Value"
  }
  dimension: message__weld_log__voltage_curve {
    hidden: yes
    sql: ${TABLE}.Message.WeldLog.VoltageCurve ;;
    group_label: "Message Weld Log"
    group_item_label: "Voltage Curve"
  }
  dimension: message__weld_log__voltage_ref_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.voltageRefValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Voltage Ref Value"
  }
  dimension: message__weld_log__wear {
    type: number
    sql: ${TABLE}.Message.WeldLog.wear ;;
    group_label: "Message Weld Log"
    group_item_label: "Wear"
  }
  dimension: message__weld_log__wear_per_cent {
    type: number
    sql: ${TABLE}.Message.WeldLog.wearPerCent ;;
    group_label: "Message Weld Log"
    group_item_label: "Wear per Cent"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_1 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_1 ;;
    group_label: "Message Weld Log"
    group_item_label: "Weld Spot Cust Data P16 1"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_10 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_10 ;;
    group_label: "Message Weld Log"
    group_item_label: "Weld Spot Cust Data P16 10"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_11 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_11 ;;
    group_label: "Message Weld Log"
    group_item_label: "Weld Spot Cust Data P16 11"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_13 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_13 ;;
    group_label: "Message Weld Log"
    group_item_label: "Weld Spot Cust Data P16 13"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_14 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_14 ;;
    group_label: "Message Weld Log"
    group_item_label: "Weld Spot Cust Data P16 14"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_15 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_15 ;;
    group_label: "Message Weld Log"
    group_item_label: "Weld Spot Cust Data P16 15"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_16 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_16 ;;
    group_label: "Message Weld Log"
    group_item_label: "Weld Spot Cust Data P16 16"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_17 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_17 ;;
    group_label: "Message Weld Log"
    group_item_label: "Weld Spot Cust Data P16 17"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_2 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_2 ;;
    group_label: "Message Weld Log"
    group_item_label: "Weld Spot Cust Data P16 2"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_3 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_3 ;;
    group_label: "Message Weld Log"
    group_item_label: "Weld Spot Cust Data P16 3"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_4 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_4 ;;
    group_label: "Message Weld Log"
    group_item_label: "Weld Spot Cust Data P16 4"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_5 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_5 ;;
    group_label: "Message Weld Log"
    group_item_label: "Weld Spot Cust Data P16 5"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_7 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_7 ;;
    group_label: "Message Weld Log"
    group_item_label: "Weld Spot Cust Data P16 7"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_8 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_8 ;;
    group_label: "Message Weld Log"
    group_item_label: "Weld Spot Cust Data P16 8"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_9 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_9 ;;
    group_label: "Message Weld Log"
    group_item_label: "Weld Spot Cust Data P16 9"
  }
  dimension: message__weld_log__weld_spot_cust_data_p32_12 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP32_12 ;;
    group_label: "Message Weld Log"
    group_item_label: "Weld Spot Cust Data P32 12"
  }
  dimension: message__weld_log__weld_spot_cust_data_p32_18 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP32_18 ;;
    group_label: "Message Weld Log"
    group_item_label: "Weld Spot Cust Data P32 18"
  }
  dimension: message__weld_log__weld_spot_cust_data_p32_6 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP32_6 ;;
    group_label: "Message Weld Log"
    group_item_label: "Weld Spot Cust Data P32 6"
  }
  dimension: message__weld_log__weld_time_actual_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldTimeActualValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Weld Time Actual Value"
  }
  dimension: message__weld_log__weld_time_ref_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldTimeRefValue ;;
    group_label: "Message Weld Log"
    group_item_label: "Weld Time Ref Value"
  }
  dimension: message__weld_log__weldspot_ref_ident {
    type: string
    sql: ${TABLE}.Message.WeldLog.weldspotRefIdent ;;
    group_label: "Message Weld Log"
    group_item_label: "Weldspot Ref Ident"
  }
  dimension: message__weld_log__wld_effect_stabilisation_factor {
    type: number
    sql: ${TABLE}.Message.WeldLog.wldEffectStabilisationFactor ;;
    group_label: "Message Weld Log"
    group_item_label: "Wld Effect Stabilisation Factor"
  }
  dimension: message__weld_log__xqr_measuring_active {
    type: number
    sql: ${TABLE}.Message.WeldLog.xqrMeasuringActive ;;
    group_label: "Message Weld Log"
    group_item_label: "Xqr Measuring Active"
  }
  dimension: message__weld_log__xqr_mode_off {
    type: number
    sql: ${TABLE}.Message.WeldLog.xqrModeOff ;;
    group_label: "Message Weld Log"
    group_item_label: "Xqr Mode Off"
  }
  dimension: message__weld_log__xqr_monitoring_active {
    type: number
    sql: ${TABLE}.Message.WeldLog.xqrMonitoringActive ;;
    group_label: "Message Weld Log"
    group_item_label: "Xqr Monitoring Active"
  }
  dimension: message__weld_log__xqr_regulation_active {
    type: number
    sql: ${TABLE}.Message.WeldLog.xqrRegulationActive ;;
    group_label: "Message Weld Log"
    group_item_label: "Xqr Regulation Active"
  }
  dimension: message__weld_log__xqr_weld_time_prolongation_active {
    type: number
    sql: ${TABLE}.Message.WeldLog.xqrWeldTimeProlongationActive ;;
    group_label: "Message Weld Log"
    group_item_label: "Xqr Weld Time Prolongation Active"
  }
  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  dimension: original_filename {
    primary_key: yes
    type: string
    sql: ${TABLE}.original_filename ;;
  }
  dimension: output_format {
    type: string
    sql: ${TABLE}.OutputFormat ;;
  }
  dimension_group: time_stamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.TimeStamp ;;
  }
  dimension: weld_timer {
    type: string
    sql: ${TABLE}.WeldTimer ;;
  }
  measure: count {
    type: count
    drill_fields: [original_filename, name, message__weld_log__spot_name, message__weld_log__timer_name]
  }
}

view: plc_logs__message__weld_log__force_curve {

  dimension: plc_logs__message__weld_log__force_curve {
    type: number
    sql: plc_logs__message__weld_log__force_curve ;;
  }
}

view: plc_logs__message__weld_log__voltage_curve {

  dimension: plc_logs__message__weld_log__voltage_curve {
    type: number
    sql: plc_logs__message__weld_log__voltage_curve ;;
  }
}

view: plc_logs__message__weld_log__current_curve {

  dimension: plc_logs__message__weld_log__current_curve {
    type: number
    sql: plc_logs__message__weld_log__current_curve ;;
  }
}
