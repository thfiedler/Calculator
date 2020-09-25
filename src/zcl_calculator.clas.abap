CLASS zcl_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS add
      IMPORTING
        value_1    TYPE i
        value_2    TYPE i
      RETURNING
        VALUE(sum) TYPE i.
    METHODS subtract
      IMPORTING
        value_1     TYPE i OPTIONAL
        value_2     TYPE i OPTIONAL
      RETURNING
        VALUE(diff) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_calculator IMPLEMENTATION.

  METHOD add.
    sum = value_1 + value_2.
  ENDMETHOD.

  METHOD subtract.
    diff = value_1 - value_2.
  ENDMETHOD.

ENDCLASS.
