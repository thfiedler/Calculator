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

endclass.



class zcl_calculator_log implementation.
  method add_log_entry.
    data log_entry type zcalculator_log.
    try.
        log_entry-uuid = cl_system_uuid=>create_uuid_x16_static(  ).
      catch cx_uuid_error.
        return.
    endtry.
    log_entry-operation = operation.
    log_entry-value_1 = value_1.
    log_entry-value_2 = value_2.
    get time stamp field log_entry-timestamp.

    insert zcalculator_log from @log_entry.
  endmethod.
endclass.
