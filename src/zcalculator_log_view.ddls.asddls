@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '.'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zcalculator_log_view
  as select from zcalculator_log
{
  key uuid      as Uuid,
      operation as Operation,
      value_1   as Value1,
      value_2   as Value2,
      timestamp as Timestamp
}
