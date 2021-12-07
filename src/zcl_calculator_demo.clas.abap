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
    data calculator type ref to zif_calculator.
    calculator = new zcl_calculator( abap_true ).

    try.
        data(val) = calculator->add( value_1 = 20 value_2 = 20 ).
        out->write( conv string( val ) ).
      catch zcx_calculator_aborted.
        out->write( 'Calculation aborted' ).
    endtry.

    try.
        val = calculator->subtract( value_1 = 20 value_2 = 2 ).
        out->write( conv string( val ) ).
      catch zcx_calculator_aborted.
        out->write( 'Calculation aborted' ).
    endtry.

    try.
        val = calculator->multiply( value_1 = 20 value_2 = 2 ).
        out->write( conv string( val ) ).
      catch zcx_calculator_aborted.
        out->write( 'Calculation aborted' ).
    endtry.

    try.
        val = calculator->divide( value_1 = 20 value_2 = 0 ).
        out->write( conv string( val ) ).
      catch zcx_calculator_aborted.
        out->write( 'Calculation aborted' ).
    endtry.

  endmethod.

endclass.
