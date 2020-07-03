class ltcl_calculator_test definition final for testing
  duration short
  risk level harmless.

  private section.
    methods:
      test_add_1_1 for testing raising cx_static_check.
endclass.


class ltcl_calculator_test implementation.

  method test_add_1_1.
    data(calc) = new zcl_calculator( ).
    data(sum) = calc->add( value_1 = 1  value_2 = 1 ).

    cl_abap_unit_assert=>assert_equals(
      exporting
        act                  = sum
        exp                  = 2
        msg                  = 'Add not working'
    ).
  endmethod.

endclass.
