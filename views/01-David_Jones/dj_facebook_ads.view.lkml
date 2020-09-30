include: "/views/*"

view: dj_facebook_ads {
  extends: [structure_facebook_ads]
  sql_table_name: `@{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.facebook_ads`
    ;;

  dimension: campaign_category {
    type:  string
    sql: Case
    when ${campaign_name} like "%DR%" OR ${campaign_name} like "%remarketing%" then "Performance"
    when ${campaign_name} like "%Programs%" then "Tactical/Campaign"
    when ${campaign_name} like "%Boosting%" then "PR Content"
    when ${campaign_name} like "%Social%" then "PR Content"
    when SPLIT(${campaign_name}, '_')[SAFE_OFFSET(3)] = "Menswear" then "Men"
    when SPLIT(${campaign_name}, '_')[SAFE_OFFSET(3)] = "Womenswear" then "Women"
    else SPLIT(${campaign_name}, '_')[SAFE_OFFSET(3)] end ;;
    drill_fields: [campaign_name]
  }

  dimension: campaign_name_abr {
    type:  string
    sql: ifnull(SPLIT(${campaign_name}, '_')[SAFE_OFFSET(2)],"")
    ||" "||ifnull(SPLIT(${campaign_name}, '_')[SAFE_OFFSET(3)] ,"")
    ||" "||ifnull(SPLIT(${campaign_name}, '_')[SAFE_OFFSET(4)] ,"")
    ||" "||ifnull(SPLIT(${campaign_name}, '_')[SAFE_OFFSET(5)] ,"") ;;
  }
}
