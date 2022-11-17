"! This class implements the calculator
"! It offers enhancement options to add custom specific logic via the BADI:
"! {@link zcalculator_badi}
"! and it provides a log which is stored in DB table: {@link zcalculator_log}
class zcl_calculator definition
  public
  final
  create public .

  public section.

    interfaces zif_calculator.

    aliases: add for zif_calculator~add,
             subtract for zif_calculator~subtract,
             multiply for zif_calculator~multiply,
             divide for zif_calculator~divide.
    methods constructor
      importing
        logging_is_active type abap_boolean optional.
    methods square_root
      importing
        value         type i
      returning
        value(result) type decfloat34
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


  method zif_calculator~subtract.
    try.
        call badi calculator_badi->check_before_subtract exporting value_1 = value_1 value_2 = value_2.
      catch zcx_check_failed.
        raise exception type zcx_calculator_aborted.
    endtry.
    difference = value_1 - value_2.
    if me->calculator_log is bound.
      me->calculator_log->add_log_entry(
        exporting
          operation = zif_calculator=>co_operation_subtract
          value_1   = value_1
          value_2   = value_2
      ).
    endif.
  endmethod.


  method zif_calculator~multiply.
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


  method zif_calculator~add.
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


  method zif_calculator~divide.
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


  method square_root.
    if value > 0.
      result = sqrt( value ).
    else.
      raise exception type zcx_calculator_aborted.
    endif.
  endmethod.



endclass.
