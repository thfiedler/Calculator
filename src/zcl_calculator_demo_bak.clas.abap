CLASS zcl_calculator_demo_bak DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CALCULATOR_DEMO_BAK IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA calculator TYPE REF TO zcl_calculator.
    calculator = NEW zcl_calculator( abap_true ).

    TRY.
        data(val) = calculator->add( value_1 = 20 value_2 = 20 ).
        out->write( CONV string( val ) ).
      CATCH zcx_calculator_aborted.
        out->write( 'Calculation aborted' ).
    ENDTRY.

    TRY.
        val = calculator->subtract( value_1 = 20 value_2 = 2 ).
        out->write( CONV string( val ) ).
      CATCH zcx_calculator_aborted.
        out->write( 'Calculation aborted' ).
    ENDTRY.

    TRY.
        val = calculator->multiply( value_1 = 20 value_2 = 2 ).
        out->write( CONV string( val ) ).
      CATCH zcx_calculator_aborted.
        out->write( 'Calculation aborted' ).
    ENDTRY.

    TRY.
        val = calculator->divide( value_1 = 20 value_2 = 5 ).
        out->write( CONV string( val ) ).
      CATCH zcx_calculator_aborted.
        out->write( 'Calculation aborted' ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
