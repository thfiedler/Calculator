*&---------------------------------------------------------------------*
*& Report  zcalculator
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
report zcalculator.

parameters value_1 type i.

parameters: op_add radiobutton group ops default 'X',
            op_sub radiobutton group ops,
            op_mul radiobutton group ops,
            op_div radiobutton group ops.

parameters value_2 type i.

start-of-selection.

  data calculator type ref to zcl_calculator.

  calculator = new zcl_calculator( 'X' ).

  if op_add = abap_true.
    data(sum) = calculator->add( value_1 = value_1 value_2 = value_2 ).
    write: / value_1 , '+' , value_2 , '=' , sum.

  elseif op_sub = abap_true.
    data(diff) = calculator->subtract( value_1 = value_1 value_2 = value_2 ).
    write: / value_1 , '-' , value_2 , '=' , diff.

  elseif op_mul = abap_true.
    data(prod) = calculator->multiply( value_1 = value_1 value_2 = value_2 ).
    write: / value_1 , '*' , value_2 , '=' , prod.

  elseif op_div = abap_true.
    data(quot) = calculator->divide( value_1 = value_1 value_2 = value_2 ).
    write: / value_1 , '/' , value_2 , '=' , quot.

  endif.
