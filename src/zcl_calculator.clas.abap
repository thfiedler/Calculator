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
      RAISING
        zcx_calculator_aborted.
    methods subtract
      importing
        value_1     type i optional
        value_2     type i optional
      returning
        value(diff) type i.
  protected section.
  private section.

endclass.



class zcl_calculator implementation.

  method add.
    data calculator_badi type ref to zcalculator_badi.
    get badi calculator_badi.
    try.
        call badi calculator_badi->check_before_add exporting value_1 = value_1 value_2 = value_2 .
      catch zcx_check_failed.
        raise exception type zcx_calculator_aborted.
    endtry.

    sum = value_1 + value_2.
  endmethod.

  method subtract.
    diff = value_1 - value_2.
  endmethod.

endclass.
