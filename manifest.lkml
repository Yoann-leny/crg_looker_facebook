project_name: "facebook"

constant: CONNECTION_NAME {
  value: "djpocbigquery"
  export: override_required
}
###Constant variable for David Jones
constant: DJ_PROJECT_NAME {
  value: "david-jones-ga360-240101"
  export: override_optional
}
constant: DJ_DATASET_NAME {
  value: "Social_media_analysis"
  export: override_optional
}
constant: DJ_FORECAST_DATASET {
  value: "paid_social_forecast"
  export: override_optional
}



constant: MINIMUM_SPEND_CLUSTER {
  value: ">0"
  export: override_optional
}
constant: NUMBER_OF_CLUSTERS {
  ### This is where you can decide number of clusters for BQML. Default is 3
  value: "3"
  export: override_optional
}
constant: HISTORICAL_DATA_DV360 {
  ### This is where you can decide how much data to feed into the dashboards. By default, it is 60 days
  value: "60"
  export: override_optional
}
constant: MINIMUM_CONVERSIONS_CLUSTER {
  ### This is where you can decide minimum number of conversions (exclusive) for campaigns to include in clustering model. Default is 0, so all campaigns with conversions >0
  ## To include all, make value: ""
  value: ">0"
}
