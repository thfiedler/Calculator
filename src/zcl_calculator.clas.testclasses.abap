class ltcl_calculator_test definition final for testing
  duration short
  risk level harmless.

  private section.
    methods:
      test_add_1_to_1 for testing raising cx_static_check,
      test_subtract_1_from_2 for testing raising cx_static_check,
      test_multiply_2_and_2 for testing raising cx_static_check,
      test_devide_8_and_2 for testing raising cx_static_check.
endclass.


class ltcl_calculator_test implementation.

  method test_add_1_to_1.
    data(calc) = new zcl_calculator( ).
    data(sum) = calc->add( value_1 = 1  value_2 = 1 ).

    cl_abap_unit_assert=>assert_equals(
      exporting
        act                  = sum
        exp                  = 2
        msg                  = 'Add not working'
    ).
  endmethod.

  method test_subtract_1_from_2.
    data(calc) = new zcl_calculator( ).
    data(diff) = calc->subtract( value_1 = 2 value_2 = 1 ).

    cl_abap_unit_assert=>assert_equals(
      exporting
        act                  = diff
        exp                  = 1
        msg                  = 'Subtract not working'
    ).
  endmethod.

  method test_multiply_2_and_2.
    data(calc) = new zcl_calculator(  ).
    data(diff) = calc->multiply( value_1 = 2 value_2 = 2 ).

    cl_abap_unit_assert=>assert_equals(
      exporting
        act                  = diff
        exp                  = 4
        msg                  = 'Multiply not working'
    ).
  endmethod.

  method test_devide_8_and_2.
    data(calc) = new zcl_calculator(  ).
    data(diff) = calc->divide( value_1 = 8 value_2 = 2 ).

    cl_abap_unit_assert=>assert_equals(
      exporting
        act                  = diff
        exp                  = 4
        msg                  = 'Divide not working'
    ).
  endmethod.

endclass.
