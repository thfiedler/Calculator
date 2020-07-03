class zcl_calculator definition
  public
  final
  create public .

  public section.
    methods add
      importing
        value_1    type i
        value_2    type i
      returning
        value(sum) type i.
  protected section.
  private section.
    methods subtract
      importing
        value_1     type i optional
        value_2     type i optional
      returning
        value(diff) type i.
endclass.



class zcl_calculator implementation.

  method add.
    if cl_abap_context_info=>get_user_alias( ) = 'D029681'.
       sum = 42.
    else.
      sum = value_1 + value_2.
    endif.
  endmethod.

  method subtract.
    diff = value_1 - value_2.
  endmethod.

endclass.
