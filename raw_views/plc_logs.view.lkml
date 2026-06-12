view: plc_logs {
  sql_table_name: `stellantis-molding-anomaly-det.molding_anomaly_poc.plc_logs` ;;

  dimension: message__weld_log__contact_wait_time {
    type: string
    sql: ${TABLE}.Message.WeldLog.contactWaitTime ;;

    label: "Contact Wait Time"
  }
  dimension: message__weld_log__current_actual_value {
    type: number
    description: "Current actual value of the weld in kA"
    sql: ${TABLE}.Message.WeldLog.currentActualValue ;;

    label: "Current Actual Value"
  }
  dimension: message__weld_log__current_curve {
    hidden: yes
    sql: ${TABLE}.Message.WeldLog.CurrentCurve ;;

    label: "Current Curve"
  }
  dimension: message__weld_log__current_factor {
    type: number
    sql: ${TABLE}.Message.WeldLog.currentFactor ;;

    label: "Current Factor"
  }
  dimension: message__weld_log__current_reference_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.currentReferenceValue ;;

    label: "Current Reference Value"
  }
  dimension_group: message__weld_log__date {
    type: time
    timeframes: [raw, time, date, week, day_of_week, month, quarter, year]
    sql: ${TABLE}.Message.WeldLog.dateTime ;;
  }
  dimension: message__weld_log__decline_usp {
    type: number
    sql: ${TABLE}.Message.WeldLog.declineUsp ;;

    label: "Decline Usp"
  }
  dimension: message__weld_log__electrode_no {
    type: number
    sql: ${TABLE}.Message.WeldLog.electrodeNo ;;

    label: "Electrode No"
  }
  dimension: message__weld_log__energy_actual_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.energyActualValue ;;

    label: "Energy Actual Value"
  }
  dimension: message__weld_log__energy_ref_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.energyRefValue ;;

    label: "Energy Ref Value"
  }
  dimension: message__weld_log__force_curve {
    hidden: yes
    sql: ${TABLE}.Message.WeldLog.ForceCurve ;;

    label: "Force Curve"
  }
  dimension: message__weld_log__fqf_actual_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.fqfActualValue ;;

    label: "Fqf Actual Value"
  }
  dimension: message__weld_log__fqf_measuring_active {
    type: number
    sql: ${TABLE}.Message.WeldLog.fqfMeasuringActive ;;

    label: "Fqf Measuring Active"
  }
  dimension: message__weld_log__fqf_mon_cond_lower_tol {
    type: number
    sql: ${TABLE}.Message.WeldLog.fqfMonCondLowerTol ;;

    label: "Fqf Mon Cond Lower Tol"
  }
  dimension: message__weld_log__fqf_mon_cond_upper_tol {
    type: number
    sql: ${TABLE}.Message.WeldLog.fqfMonCondUpperTol ;;

    label: "Fqf Mon Cond Upper Tol"
  }
  dimension: message__weld_log__fqf_mon_lower_tol {
    type: number
    sql: ${TABLE}.Message.WeldLog.fqfMonLowerTol ;;

    label: "Fqf Mon Lower Tol"
  }
  dimension: message__weld_log__fqf_mon_upper_tol {
    type: number
    sql: ${TABLE}.Message.WeldLog.fqfMonUpperTol ;;

    label: "Fqf Mon Upper Tol"
  }
  dimension: message__weld_log__fqf_ref_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.fqfRefValue ;;

    label: "Fqf Ref Value"
  }
  dimension: message__weld_log__i_actual1 {
    type: number
    sql: ${TABLE}.Message.WeldLog.iActual1 ;;

    label: "I Actual1"
  }
  dimension: message__weld_log__i_actual2 {
    type: number
    sql: ${TABLE}.Message.WeldLog.iActual2 ;;

    label: "I Actual2"
  }
  dimension: message__weld_log__i_actual3 {
    type: number
    sql: ${TABLE}.Message.WeldLog.iActual3 ;;

    label: "I Actual3"
  }
  dimension: message__weld_log__i_demand1 {
    type: number
    sql: ${TABLE}.Message.WeldLog.iDemand1 ;;

    label: "I Demand1"
  }
  dimension: message__weld_log__i_demand2 {
    type: number
    sql: ${TABLE}.Message.WeldLog.iDemand2 ;;

    label: "I Demand2"
  }
  dimension: message__weld_log__i_demand3 {
    type: number
    sql: ${TABLE}.Message.WeldLog.iDemand3 ;;

    label: "I Demand3"
  }
  dimension: message__weld_log__i_demand_std {
    type: number
    sql: ${TABLE}.Message.WeldLog.iDemandStd ;;

    label: "I Demand Std"
  }
  dimension: message__weld_log__ilsts {
    type: number
    sql: ${TABLE}.Message.WeldLog.ilsts ;;

    label: "Ilsts"
  }
  dimension: message__weld_log__measure_state {
    type: number
    sql: ${TABLE}.Message.WeldLog.measureState ;;

    label: "Measure State"
  }
  dimension: message__weld_log__monitor_mode {
    type: number
    sql: ${TABLE}.Message.WeldLog.monitorMode ;;

    label: "Monitor Mode"
  }
  dimension: message__weld_log__monitor_state {
    type: number
    sql: ${TABLE}.Message.WeldLog.monitorState ;;

    label: "Monitor State"
  }
  dimension: message__weld_log__norming_time {
    type: number
    sql: ${TABLE}.Message.WeldLog.normingTime ;;

    label: "Norming Time"
  }
  dimension: message__weld_log__nugget_diameter {
    type: number
    sql: ${TABLE}.Message.WeldLog.nuggetDiameter ;;

    label: "Nugget Diameter"
  }
  dimension: message__weld_log__offset_usp {
    type: number
    sql: ${TABLE}.Message.WeldLog.offsetUsp ;;

    label: "Offset Usp"
  }
  dimension: message__weld_log__part_ident_string {
    type: string
    sql: ${TABLE}.Message.WeldLog.partIdentString ;;

    label: "Part Ident String"
  }
  dimension: message__weld_log__pha1 {
    type: number
    sql: ${TABLE}.Message.WeldLog.pha1 ;;

    label: "Pha1"
  }
  dimension: message__weld_log__pha2 {
    type: number
    sql: ${TABLE}.Message.WeldLog.pha2 ;;

    label: "Pha2"
  }
  dimension: message__weld_log__pha3 {
    type: number
    sql: ${TABLE}.Message.WeldLog.pha3 ;;

    label: "Pha3"
  }
  dimension: message__weld_log__pha_std {
    type: number
    sql: ${TABLE}.Message.WeldLog.phaStd ;;

    label: "Pha Std"
  }
  dimension: message__weld_log__power_actual_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.powerActualValue ;;

    label: "Power Actual Value"
  }
  dimension: message__weld_log__power_ref_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.powerRefValue ;;

    label: "Power Ref Value"
  }
  dimension: message__weld_log__power_state {
    type: number
    sql: ${TABLE}.Message.WeldLog.powerState ;;

    label: "Power State"
  }
  dimension: message__weld_log__prog_no {
    type: number
    sql: ${TABLE}.Message.WeldLog.progNo ;;

    label: "Prog No"
  }
  dimension: message__weld_log__prot_record_id {
    type: number
    sql: ${TABLE}.Message.WeldLog.protRecord_ID ;;

    label: "Prot Record ID"
  }
  dimension: message__weld_log__pulse_width_actual_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.pulseWidthActualValue ;;

    label: "Pulse Width Actual Value"
  }
  dimension: message__weld_log__pulse_width_ref_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.pulseWidthRefValue ;;

    label: "Pulse Width Ref Value"
  }
  dimension: message__weld_log__reg_splash_time {
    type: number
    sql: ${TABLE}.Message.WeldLog.regSplashTime ;;

    label: "Reg Splash Time"
  }
  dimension: message__weld_log__reg_spot_dia_actual {
    type: number
    sql: ${TABLE}.Message.WeldLog.regSpotDiaActual ;;

    label: "Reg Spot Dia Actual"
  }
  dimension: message__weld_log__reg_spot_dia_min_demand {
    type: number
    sql: ${TABLE}.Message.WeldLog.regSpotDiaMinDemand ;;

    label: "Reg Spot Dia Min Demand"
  }
  dimension: message__weld_log__reg_usr_usp_junction {
    type: number
    sql: ${TABLE}.Message.WeldLog.regUsrUspJunction ;;

    label: "Reg Usr Usp Junction"
  }
  dimension: message__weld_log__reg_usr_usp_max {
    type: number
    sql: ${TABLE}.Message.WeldLog.regUsrUspMax ;;

    label: "Reg Usr Usp Max"
  }
  dimension: message__weld_log__regulation1 {
    type: number
    sql: ${TABLE}.Message.WeldLog.regulation1 ;;

    label: "Regulation1"
  }
  dimension: message__weld_log__regulation2 {
    type: number
    sql: ${TABLE}.Message.WeldLog.regulation2 ;;

    label: "Regulation2"
  }
  dimension: message__weld_log__regulation3 {
    type: number
    sql: ${TABLE}.Message.WeldLog.regulation3 ;;

    label: "Regulation3"
  }
  dimension: message__weld_log__regulation_start_time {
    type: number
    sql: ${TABLE}.Message.WeldLog.regulationStartTime ;;

    label: "Regulation Start Time"
  }
  dimension: message__weld_log__regulation_state {
    type: number
    sql: ${TABLE}.Message.WeldLog.regulationState ;;

    label: "Regulation State"
  }
  dimension: message__weld_log__regulation_std {
    type: number
    sql: ${TABLE}.Message.WeldLog.regulationStd ;;

    label: "Regulation Std"
  }
  dimension: message__weld_log__resistance_actual_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.resistanceActualValue ;;

    label: "Resistance Actual Value"
  }
  dimension: message__weld_log__resistance_ref_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.resistanceRefValue ;;

    label: "Resistance Ref Value"
  }
  dimension: message__weld_log__return_to_constant_current {
    type: number
    sql: ${TABLE}.Message.WeldLog.returnToConstantCurrent ;;

    label: "Return to Constant Current"
  }
  dimension: message__weld_log__reweld_active {
    type: number
    sql: ${TABLE}.Message.WeldLog.reweldActive ;;

    label: "Reweld Active"
  }
  dimension: message__weld_log__sequence_repeat {
    type: number
    sql: ${TABLE}.Message.WeldLog.sequenceRepeat ;;

    label: "Sequence Repeat"
  }
  dimension: message__weld_log__sequence_state {
    type: number
    sql: ${TABLE}.Message.WeldLog.sequenceState ;;

    label: "Sequence State"
  }
  dimension: message__weld_log__sequence_state_add {
    type: number
    sql: ${TABLE}.Message.WeldLog.sequenceStateAdd ;;

    label: "Sequence State Add"
  }
  dimension: message__weld_log__sg_aperture_dim_in_suff {
    type: string
    sql: ${TABLE}.Message.WeldLog.sg_ApertureDimInSuff ;;

    label: "Sg Aperture Dim In Suff"
  }
  dimension: message__weld_log__sg_beam_up_arching {
    type: string
    sql: ${TABLE}.Message.WeldLog.sg_Beam_UpArching ;;

    label: "Sg Beam Up Arching"
  }
  dimension: message__weld_log__sg_force {
    type: number
    sql: ${TABLE}.Message.WeldLog.sgForce ;;

    label: "Sg Force"
  }
  dimension: message__weld_log__sg_force_corr {
    type: string
    sql: ${TABLE}.Message.WeldLog.sg_Force_Corr ;;

    label: "Sg Force Corr"
  }
  dimension: message__weld_log__sg_force_set_point {
    type: string
    sql: ${TABLE}.Message.WeldLog.sgForceSetPoint ;;

    label: "Sg Force Set Point"
  }
  dimension: message__weld_log__sg_motor_current {
    type: number
    sql: ${TABLE}.Message.WeldLog.sgMotorCurrent ;;

    label: "Sg Motor Current"
  }
  dimension: message__weld_log__sg_motor_temp {
    type: number
    sql: ${TABLE}.Message.WeldLog.sgMotorTemp ;;

    label: "Sg Motor Temp"
  }
  dimension: message__weld_log__sg_sag_gc {
    type: number
    sql: ${TABLE}.Message.WeldLog.sgSagGc ;;

    label: "Sg Sag Gc"
  }
  dimension: message__weld_log__sg_sag_gp {
    type: number
    sql: ${TABLE}.Message.WeldLog.sgSagGp ;;

    label: "Sg Sag Gp"
  }
  dimension: message__weld_log__sg_sag_gp_set_point {
    type: string
    sql: ${TABLE}.Message.WeldLog.sgSagGpSetPoint ;;

    label: "Sg Sag Gp Set Point"
  }
  dimension: message__weld_log__sg_sheet_thickness {
    type: number
    sql: ${TABLE}.Message.WeldLog.sgSheetThickness ;;

    label: "Sg Sheet Thickness"
  }
  dimension: message__weld_log__sg_sheet_thickness_set_point {
    type: string
    sql: ${TABLE}.Message.WeldLog.sgSheetThicknessSetPoint ;;

    label: "Sg Sheet Thickness Set Point"
  }
  dimension: message__weld_log__sg_spot_with_sg {
    type: number
    sql: ${TABLE}.Message.WeldLog.sgSpotWithSg ;;

    label: "Sg Spot with Sg"
  }
  dimension: message__weld_log__sg_torque_gp {
    type: string
    sql: ${TABLE}.Message.WeldLog.sg_Torque_Gp ;;

    label: "Sg Torque Gp"
  }
  dimension: message__weld_log__sg_wear_length {
    type: string
    sql: ${TABLE}.Message.WeldLog.sg_Wear_Length ;;

    label: "Sg Wear Length"
  }
  dimension: message__weld_log__sg_weldspot_geo_wear {
    type: string
    sql: ${TABLE}.Message.WeldLog.sg_Weldspot_Geo_Wear ;;

    label: "Sg Weldspot Geo Wear"
  }
  dimension: message__weld_log__spot_name {
    type: string
    sql: ${TABLE}.Message.WeldLog.spotName ;;

    label: "Spot Name"
  }
  dimension: message__weld_log__stabilisation_factor_act_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.stabilisationFactorActValue ;;

    label: "Stabilisation Factor Act Value"
  }
  dimension: message__weld_log__stabilisation_factor_ref_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.stabilisationFactorRefValue ;;

    label: "Stabilisation Factor Ref Value"
  }
  dimension: message__weld_log__t_actual_std {
    type: number
    sql: ${TABLE}.Message.WeldLog.tActualStd ;;

    label: "T Actual Std"
  }
  dimension: message__weld_log__t_i_demand_std {
    type: number
    value_format_name: id
    sql: ${TABLE}.Message.WeldLog.t_iDemandStd ;;

    label: "T I Demand Std"
  }
  dimension: message__weld_log__threshold_stabilisation_factor {
    type: number
    sql: ${TABLE}.Message.WeldLog.thresholdStabilisationFactor ;;

    label: "Threshold Stabilisation Factor"
  }
  dimension: message__weld_log__timer_name {
    type: string
    sql: ${TABLE}.Message.WeldLog.timerName ;;

    label: "Timer Name"
  }
  dimension: message__weld_log__tip_dress_counter {
    type: number
    sql: ${TABLE}.Message.WeldLog.tipDressCounter ;;

    label: "Tip Dress Counter"
  }
  dimension: message__weld_log__trigger_time {
    type: number
    sql: ${TABLE}.Message.WeldLog.triggerTime ;;

    label: "Trigger Time"
  }
  dimension: message__weld_log__uip_actual_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.uipActualValue ;;

    label: "Uip Actual Value"
  }
  dimension: message__weld_log__uip_mon_cond_upper_tol {
    type: number
    sql: ${TABLE}.Message.WeldLog.uipMonCondUpperTol ;;

    label: "Uip Mon Cond Upper Tol"
  }
  dimension: message__weld_log__uip_ref_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.uipRefValue ;;

    label: "Uip Ref Value"
  }
  dimension: message__weld_log__uir_expulsion_time {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirExpulsionTime ;;

    label: "Uir Expulsion Time"
  }
  dimension: message__weld_log__uir_measuring_active {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirMeasuringActive ;;

    label: "Uir Measuring Active"
  }
  dimension: message__weld_log__uir_monitoring_active {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirMonitoringActive ;;

    label: "Uir Monitoring Active"
  }
  dimension: message__weld_log__uir_psf_cond_tol {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirPsfCondTol ;;

    label: "Uir Psf Cond Tol"
  }
  dimension: message__weld_log__uir_psf_lower_tol {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirPsfLowerTol ;;

    label: "Uir Psf Lower Tol"
  }
  dimension: message__weld_log__uir_qstopp_act_cnt_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirQStoppActCntValue ;;

    label: "Uir Qstopp Act Cnt Value"
  }
  dimension: message__weld_log__uir_qstopp_ref_cnt_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirQStoppRefCntValue ;;

    label: "Uir Qstopp Ref Cnt Value"
  }
  dimension: message__weld_log__uir_regulation_active {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirRegulationActive ;;

    label: "Uir Regulation Active"
  }
  dimension: message__weld_log__uir_uip_cond_tol {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirUipCondTol ;;

    label: "Uir Uip Cond Tol"
  }
  dimension: message__weld_log__uir_uip_lower_tol {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirUipLowerTol ;;

    label: "Uir Uip Lower Tol"
  }
  dimension: message__weld_log__uir_uip_upper_tol {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirUipUpperTol ;;

    label: "Uir Uip Upper Tol"
  }
  dimension: message__weld_log__uir_weld_time_prolongation_active {
    type: number
    sql: ${TABLE}.Message.WeldLog.uirWeldTimeProlongationActive ;;

    label: "Uir Weld Time Prolongation Active"
  }
  dimension: message__weld_log__usp {
    type: number
    sql: ${TABLE}.Message.WeldLog.usp ;;

    label: "Usp"
  }
  dimension: message__weld_log__voltage_actual_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.voltageActualValue ;;

    label: "Voltage Actual Value"
  }
  dimension: message__weld_log__voltage_curve {
    hidden: yes
    sql: ${TABLE}.Message.WeldLog.VoltageCurve ;;

    label: "Voltage Curve"
  }
  dimension: message__weld_log__voltage_ref_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.voltageRefValue ;;

    label: "Voltage Ref Value"
  }
  dimension: message__weld_log__wear {
    type: number
    sql: ${TABLE}.Message.WeldLog.wear ;;

    label: "Wear"
  }
  dimension: message__weld_log__wear_per_cent {
    type: number
    sql: ${TABLE}.Message.WeldLog.wearPerCent ;;

    label: "Wear per Cent"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_1 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_1 ;;

    label: "Weld Spot Cust Data P16 1"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_10 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_10 ;;

    label: "Weld Spot Cust Data P16 10"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_11 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_11 ;;

    label: "Weld Spot Cust Data P16 11"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_13 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_13 ;;

    label: "Weld Spot Cust Data P16 13"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_14 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_14 ;;

    label: "Weld Spot Cust Data P16 14"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_15 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_15 ;;

    label: "Weld Spot Cust Data P16 15"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_16 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_16 ;;

    label: "Weld Spot Cust Data P16 16"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_17 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_17 ;;

    label: "Weld Spot Cust Data P16 17"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_2 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_2 ;;

    label: "Weld Spot Cust Data P16 2"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_3 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_3 ;;

    label: "Weld Spot Cust Data P16 3"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_4 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_4 ;;

    label: "Weld Spot Cust Data P16 4"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_5 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_5 ;;

    label: "Weld Spot Cust Data P16 5"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_7 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_7 ;;

    label: "Weld Spot Cust Data P16 7"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_8 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_8 ;;

    label: "Weld Spot Cust Data P16 8"
  }
  dimension: message__weld_log__weld_spot_cust_data_p16_9 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP16_9 ;;

    label: "Weld Spot Cust Data P16 9"
  }
  dimension: message__weld_log__weld_spot_cust_data_p32_12 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP32_12 ;;

    label: "Weld Spot Cust Data P32 12"
  }
  dimension: message__weld_log__weld_spot_cust_data_p32_18 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP32_18 ;;

    label: "Weld Spot Cust Data P32 18"
  }
  dimension: message__weld_log__weld_spot_cust_data_p32_6 {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldSpotCustDataP32_6 ;;

    label: "Weld Spot Cust Data P32 6"
  }
  dimension: message__weld_log__weld_time_actual_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldTimeActualValue ;;

    label: "Weld Time Actual Value"
  }
  dimension: message__weld_log__weld_time_ref_value {
    type: number
    sql: ${TABLE}.Message.WeldLog.weldTimeRefValue ;;

    label: "Weld Time Ref Value"
  }
  dimension: message__weld_log__weldspot_ref_ident {
    type: string
    sql: ${TABLE}.Message.WeldLog.weldspotRefIdent ;;

    label: "Weldspot Ref Ident"
  }
  dimension: message__weld_log__wld_effect_stabilisation_factor {
    type: number
    sql: ${TABLE}.Message.WeldLog.wldEffectStabilisationFactor ;;

    label: "Wld Effect Stabilisation Factor"
  }
  dimension: message__weld_log__xqr_measuring_active {
    type: number
    sql: ${TABLE}.Message.WeldLog.xqrMeasuringActive ;;

    label: "Xqr Measuring Active"
  }
  dimension: message__weld_log__xqr_mode_off {
    type: number
    sql: ${TABLE}.Message.WeldLog.xqrModeOff ;;

    label: "Xqr Mode Off"
  }
  dimension: message__weld_log__xqr_monitoring_active {
    type: number
    sql: ${TABLE}.Message.WeldLog.xqrMonitoringActive ;;

    label: "Xqr Monitoring Active"
  }
  dimension: message__weld_log__xqr_regulation_active {
    type: number
    sql: ${TABLE}.Message.WeldLog.xqrRegulationActive ;;

    label: "Xqr Regulation Active"
  }
  dimension: message__weld_log__xqr_weld_time_prolongation_active {
    type: number
    sql: ${TABLE}.Message.WeldLog.xqrWeldTimeProlongationActive ;;

    label: "Xqr Weld Time Prolongation Active"
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
