CLASS zcl_calculator_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_calculator_demo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA calculator TYPE REF TO zcl_calculator.
    calculator = NEW zcl_calculator( abap_true ).

    DATA(val) = calculator->add( value_1 = 20 value_2 = 20 ).
    out->write( CONV string( val ) ).

    val = calculator->subtract( value_1 = 20 value_2 = 2 ).
    out->write( CONV string( val ) ).

    val = calculator->multiply( value_1 = 20 value_2 = 2 ).
    out->write( CONV string( val ) ).

    val = calculator->divide( value_1 = 20 value_2 = 2 ).
    out->write( CONV string( val ) ).

  ENDMETHOD.

ENDCLASS.
