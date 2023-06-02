*&---------------------------------------------------------------------*
*& Report  zcalculator
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
report zcalculator.

parameters:
  p_op1 type i default 1 obligatory.

selection-screen skip.

parameters:
  p_add  type abap_bool radiobutton group oprs,
  p_sub  type abap_bool radiobutton group oprs,
  p_mul  type abap_bool radiobutton group oprs,
  p_div  type abap_bool radiobutton group oprs,
  p_sqrt type abap_bool radiobutton group oprs.

selection-screen skip.

parameters p_op2 type i default 1 obligatory.


start-of-selection.

  data:
    calculator type ref to zif_calculator,
    result     type decfloat16.

  calculator = zcl_calculator=>create( abap_true ).

  try.
      case abap_true.
        when p_add.
          result = calculator->add( value_1 = p_op1 value_2 = p_op2 ).
        when p_sub.
          result = calculator->subtract( value_1 = p_op1 value_2 = p_op2 ).
        when p_mul.
          result = calculator->multiply( value_1 = p_op1 value_2 = p_op2 ).
        when p_div.
          result = calculator->divide( value_1 = p_op1 value_2 = p_op2 ).
        when p_sqrt.
          result = calculator->square_root( value = p_op1 ).
      endcase.
    catch zcx_calculator_aborted into data(cx1).
      message cx1->get_text( ) type 'I'.
  endtry.

  write: /, 'Result:', result.
