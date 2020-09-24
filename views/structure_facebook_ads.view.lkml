view: structure_facebook_ads {
  extension: required

 dimension: ad_name {
  type: string
  sql: ${TABLE}.ad_name ;;
}

dimension: adset_name {
  type: string
  sql: ${TABLE}.adset_name ;;
}

dimension: campaign_id {
  type: string
  sql: ${TABLE}.campaign_id ;;
  link: {
    url: "https://www.facebook.com/My-Page/posts/{{value}}"
    icon_url: "https://upload.wikimedia.org/wikipedia/commons/c/c2/F_icon.svg"
    label: "Open Campaign on FB"

  }
}

dimension: campaign_category {
  type:  string
  sql:  SPLIT(${campaign_name}, '_')[SAFE_OFFSET(3)] ;;
  drill_fields: [campaign_name]
}

dimension: campaign_name {
  type: string
  sql: ${TABLE}.campaign_name ;;
}

dimension: clicks {
  type: string
#     hidden: yes
  sql: CAST(${TABLE}.clicks AS NUMERIC) ;;
}

measure: total_clicks {
  type: sum
  sql: ${clicks} ;;
}

dimension: cpc {
  type: string
#     hidden: yes
  sql: CAST(${TABLE}.cpc AS NUMERIC) ;;
}

measure: cpc_agg {
  type: sum
  sql: ${cpc} ;;
}

dimension: cpm {
  type: string
  sql: CAST(${TABLE}.cpm AS NUMERIC) ;;
}
measure: cpm_agg {
  type: sum
  sql: ${cpm} ;;
  drill_fields: [campaign_name, campaign_id, adset_name, ad_name, cost_per_click, click_thru_rate,total_spend,total_impressions, total_reach]

}

dimension_group: date_start {
  type: time
  timeframes: [date,week,month,year]
  sql: TIMESTAMP(${TABLE}.date_start) ;;
}

dimension: date_stop {
  type: string
  sql: ${TABLE}.date_stop ;;
}

dimension: frequency {
  type: string
  sql: ${TABLE}.frequency ;;
}

dimension: impressions {
  type: string
  sql: CAST(${TABLE}.impressions AS NUMERIC) ;;
}

measure: total_impressions {
  type: sum
  sql: ${impressions} ;;
  drill_fields: [campaign_name, campaign_id, adset_name, ad_name, cost_per_click, click_thru_rate,total_spend,total_impressions, total_reach]

}

measure: click_thru_rate {
  type: number
  sql: 1.0 * ${total_clicks}/NULLIF(${total_impressions},0) ;;
  value_format_name: percent_2
  drill_fields: [campaign_name, campaign_id, adset_name, ad_name, cost_per_click, click_thru_rate,total_spend,total_impressions, total_reach]

}

dimension: objective {
  type: string
  sql: ${TABLE}.objective ;;
}

dimension: offsite_conv_fb_pixel_purchase {
  type: string
  sql: ${TABLE}.offsite_conv_fb_pixel_purchase ;;
}

dimension: reach {
  type: string
  sql: CAST(${TABLE}.reach AS NUMERIC) ;;
}

measure: total_reach {
  type: sum
  sql: ${reach} ;;
  drill_fields: [campaign_name, campaign_id, adset_name, ad_name, cost_per_click, click_thru_rate,total_spend,total_impressions, total_reach]

}

dimension: spend {
  type: number
  sql: CAST(${TABLE}.spend AS NUMERIC);;
}

measure: total_spend {
  type: sum
  sql: ${spend} ;;
  value_format_name: usd
  drill_fields: [campaign_name, campaign_id, adset_name, ad_name, cost_per_click, click_thru_rate,total_spend,total_impressions, total_reach]

}

measure: cost_per_click {
  type: number
  sql: ${total_spend}/NULLIF(${total_clicks},0) ;;
  value_format_name: usd
}

dimension: unique_link_clicks_ctr {
  type: string
  sql: ${TABLE}.unique_link_clicks_ctr ;;
}

dimension: unique_outbound_clicks {
  type: string
  sql: CAST(${TABLE}.unique_outbound_clicks AS NUMERIC) ;;
}

measure: total_unique_outbound_clicks {
  type: sum
  sql: ${unique_outbound_clicks} ;;
}

dimension: unique_outbound_clicks_ctr {
  type: string
  sql: ${TABLE}.unique_outbound_clicks_ctr ;;
}

dimension: video_p25_watched_actions {
  type: string
  sql: ${TABLE}.video_p25_watched_actions ;;
}

dimension: website_purchase_roas {
  type: string
  sql: ${TABLE}.website_purchase_roas ;;
}


### AGGREGATIONS - Measures ###
measure: count {
  type: count
  drill_fields: [campaign_name, campaign_id, adset_name, ad_name]
}

measure: campaign_count {
  view_label: "Campaigns"
  type: count_distinct
  sql: ${campaign_id} ;;
  drill_fields: [campaigns.name]
}
}
