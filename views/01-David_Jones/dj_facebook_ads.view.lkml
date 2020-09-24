include: "/views/structure_facebook_ads.view.lkml"

view: dj_facebook_ads {
  extends: [structure_facebook_ads]
  sql_table_name: `@{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.facebook_ads`
    ;;

}
