class zcl_calculator definition
  public
  final
  create public .

  public section.
    methods add
      importing
        value_1    type i
        value_2    type i
      returning
        value(sum) type i
      raising
        zcx_calculator_aborted.
    methods subtract
      importing
        value_1     type i
        value_2     type i
      returning
        value(diff) type i.
    methods multiply
      importing
        value_1        type i
        value_2        type i
      returning
        value(product) type i.
    methods constructor
      importing
        logging_is_active type boolean optional.
    methods divide
      importing
        value_1         type i
        value_2         type i
      returning
        value(quotient) type decfloat16.
  protected section.
  private section.
    data calculator_log type ref to zcl_calculator_log.
endclass.



class zcl_calculator implementation.

  method constructor.
    if logging_is_active = abap_true.
      me->calculator_log = new zcl_calculator_log( ).
    endif.
  endmethod.

  method add.
    data calculator_badi type ref to zcalculator_badi.
    get badi calculator_badi.
    try.
        call badi calculator_badi->check_before_add exporting value_1 = value_1 value_2 = value_2 .
      catch zcx_check_failed.
        raise exception type zcx_calculator_aborted.
    endtry.
    sum = value_1 + value_2.
    if me->calculator_log is bound.
      me->calculator_log->add_log_entry(
        exporting
          operation = zif_calculator=>co_operation_add
          value_1   = value_1
          value_2   = value_2
      ).
    endif.
  endmethod.

  method subtract.
    diff = value_1 - value_2.
    if me->calculator_log is bound.
      me->calculator_log->add_log_entry(
        exporting
          operation = zif_calculator=>co_operation_subtract
          value_1   = value_1
          value_2   = value_2
      ).
    endif.
  endmethod.

  method multiply.
    product = value_1 * value_2.
    if me->calculator_log is bound.
      me->calculator_log->add_log_entry(
        exporting
          operation = zif_calculator=>co_operation_multiply
          value_1   = value_1
          value_2   = value_2
      ).
    endif.
  endmethod.

  method divide.
    quotient = value_1 / value_2.
    if me->calculator_log is bound.
      me->calculator_log->add_log_entry(
        exporting
          operation = zif_calculator=>co_operation_divide
          value_1   = value_1
          value_2   = value_2
      ).
    endif.
  endmethod.

endclass.
