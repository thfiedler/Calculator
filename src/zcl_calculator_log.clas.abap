class zcl_calculator_log definition
  public
  final
  create public .

  public section.
    methods add_log_entry
      importing
        operation type zcalculator_operation
        value_1   type i
        value_2   type i.
  protected section.
  private section.
    methods get_log_by_timestamp.

ENDCLASS.



CLASS ZCL_CALCULATOR_LOG IMPLEMENTATION.


  method add_log_entry.
    data log_entry type zcalculator_log.

    log_entry-uuid = cl_system_uuid=>create_uuid_x16_static(  ).
    log_entry-operation = operation.
    log_entry-value_1 = value_1.
    log_entry-value_2 = value_2.
    get time stamp field log_entry-timestamp.

    insert zcalculator_log from @log_entry.
  endmethod.


  method get_log_by_timestamp.
    "select from zcalculator_log_view fields * where Timestamp = @i_timestamp into table @log_view_entries.
  endmethod.
ENDCLASS.
