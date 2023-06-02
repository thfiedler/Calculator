"! This class implements the calculator
"! It offers enhancement options to add custom specific logic via the BADI:
"! {@link zcalculator_badi}
"! and it provides a log which is stored in DB table: {@link zcalculator_log}
class zcl_calculator definition
  public

  create public .

  public section.

    interfaces zif_calculator.

    aliases: add for zif_calculator~add,
             subtract for zif_calculator~subtract,
             multiply for zif_calculator~multiply,
             divide for zif_calculator~divide,
             square_root for zif_calculator~square_root.

    class-methods create
      importing
        logging_is_active type abap_boolean
      returning
        value(r_result)   type ref to zcl_calculator.
    methods constructor
      importing
        logging_is_active type abap_boolean optional.


  protected section.
  private section.
    data calculator_log type ref to zcl_calculator_log.
    data calculator_badi type ref to zcalculator_badi.

endclass.



class zcl_calculator implementation.

  method create.

    r_result = new #(
      logging_is_active = logging_is_active
    ).

  endmethod.


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


  method zif_calculator~square_root.
    result = sqrt( value ).
  endmethod.
endclass.
