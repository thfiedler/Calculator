"! This class provides a very sophisticated calculator that provides the following operations:
"! <ul>
"! <li>
"!   Add
"! </li>
"! <li>
"!   Subtract
"! </li>
"! <li>
"!   Multiply
"! </li>
"! <li>
"!   Divide
"! </li>
"! </ul>
"! It offers enhancement opptions to add custom specific logic via the BADI:
"! {@link zcalculator_badi}
"! and it provides a log which is stored in DB table: {@link zcalculator_log}
class zcl_calculator definition
  public
  final
  create public .

  public section.
    "! This method adds two values and returns the sum
    "! @parameter value_1 | first operand
    "! @parameter value_2 | second operand
    "! @parameter sum | Sum of both operands
    "! @raising zcx_calculator_aborted | Something went wrong
    methods add
      importing
        value_1    type i
        value_2    type i
      returning
        value(sum) type i
      raising
        zcx_calculator_aborted.

    "! This method subtracts value_2 from value_1 and and returns the difference
    methods subtract
      importing
        value_1     type i
        value_2     type i
      returning
        value(diff) type i
      raising
        zcx_calculator_aborted.
    methods multiply
      importing
        value_1        type i
        value_2        type i
      returning
        value(product) type i
      raising
        zcx_calculator_aborted.
    methods constructor
      importing
        logging_is_active type abap_boolean optional.
    methods divide
      importing
        value_1         type i
        value_2         type i
      returning
        value(quotient) type decfloat16
      raising
        zcx_calculator_aborted.
  protected section.
  private section.
    data calculator_log type ref to zcl_calculator_log.
    data calculator_badi type ref to zcalculator_badi.
endclass.



class zcl_calculator implementation.

  method constructor.
    if logging_is_active = abap_true.
      me->calculator_log = new zcl_calculator_log( ).
    endif.
    get badi calculator_badi.
  endmethod.



  method subtract.
    try.
        call badi calculator_badi->check_before_subtract exporting value_1 = value_1 value_2 = value_2.
      catch zcx_check_failed.
        raise exception type zcx_calculator_aborted.
    endtry.
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
    try.
        call badi calculator_badi->check_before_multiply exporting value_1 = value_1 value_2 = value_2.
      catch zcx_check_failed.
        raise exception type zcx_calculator_aborted.
    endtry.
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

  method add.
    try.
        call badi calculator_badi->check_before_add exporting value_1 = value_1 value_2 = value_2.
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
  method divide.
    try.
        call badi calculator_badi->check_before_divide exporting value_1 = value_1 value_2 = value_2.
      catch zcx_check_failed.
        raise exception type zcx_calculator_aborted.
    endtry.
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
