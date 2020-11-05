class zcl_calculator_log definition
  public
  final
  create public .

  public section.
  protected section.
  private section.
    "! Log entry will be added to log db table
    methods add_log_entry
      importing
        operation type zcalculator_operation
        value_1   type i
        value_2   type i.
endclass.



class zcl_calculator_log implementation.
  method add_log_entry.
    data log_entry type zcalculator_log.

    log_entry-uuid = cl_system_uuid=>create_uuid_x16_static(  ).

    log_entry-operation = operation.
    log_entry-value_1 = value_1.
    log_entry-value_2 = value_2.

    insert zcalculator_log from log_entry.

  endmethod.
endclass.
