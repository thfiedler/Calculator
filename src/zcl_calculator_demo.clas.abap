class zcl_calculator_demo definition
  public
  final
  create public .

  public section.

    interfaces if_oo_adt_classrun .
  protected section.
  private section.
endclass.



class zcl_calculator_demo implementation.
  method if_oo_adt_classrun~main.
    data calculator type ref to zcl_calculator.
    calculator = new zcl_calculator(  ).

    data(sum) = calculator->add( value_1 = 1 value_2 = 1 ).

    out->write( sum ).

  endmethod.

endclass.
