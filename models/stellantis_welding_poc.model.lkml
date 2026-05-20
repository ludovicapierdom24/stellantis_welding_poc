# Define the database connection to be used for this model.
connection: "stellantis_welding"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: stellantis_welding_poc_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: stellantis_welding_poc_default_datagroup

explore: summary_weldlog {
  join: spot_sheet_details {
    type: left_outer
    sql_on: ${summary_weldlog.spot_name} = ${spot_sheet_details.spot_name} ;;
    relationship: many_to_one
}
}

