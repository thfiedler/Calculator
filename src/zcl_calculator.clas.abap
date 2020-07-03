class zcl_calculator definition
  public
  final
  create public .

  public section.
    methods add
      importing
        value_1            type i
        value_2            type i
      returning
        value(r_result) type i.
  protected section.
  private section.
endclass.



class zcl_calculator implementation.

  method add.
    r_result = value_1 + value_2.
  endmethod.

endclass.
