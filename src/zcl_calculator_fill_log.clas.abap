class zcl_calculator_fill_log definition
  public
  final
  create public .

  public section.

    interfaces if_oo_adt_classrun .
  protected section.
  private section.
endclass.



class zcl_calculator_fill_log implementation.
  method if_oo_adt_classrun~main.
    data calculator type ref to zcl_calculator.
    data val_tmp type int4.
    calculator = new zcl_calculator( abap_true ).

    do 2000 times.
      val_tmp = val_tmp + 1.
      try.
          data(val) = calculator->add( value_1 = val_tmp value_2 = val_tmp ).
          out->write( conv string( val ) ).
        catch zcx_calculator_aborted.
          out->write( 'Calculation aborted' ).
      endtry.

      try.
          val = calculator->subtract( value_1 = 2000 value_2 = val_tmp ).
          out->write( conv string( val ) ).
        catch zcx_calculator_aborted.
          out->write( 'Calculation aborted' ).
      endtry.

*      try.
*          val = calculator->multiply( value_1 = 20 value_2 = val_tmp ).
*          out->write( conv string( val ) ).
*        catch zcx_calculator_aborted.
*          out->write( 'Calculation aborted' ).
*      endtry.
*
*      try.
*          val = calculator->divide( value_1 = val_tmp value_2 = 2 ).
*          out->write( conv string( val ) ).
*        catch zcx_calculator_aborted.
*          out->write( 'Calculation aborted' ).
*      endtry.
    enddo.
  endmethod.

endclass.
