interface zif_calculator_badi
  public .


  interfaces if_badi_interface .

  methods check_before_add
    importing
      !value_1 type i
      !value_2 type i
    raising
      zcx_check_failed .

  methods check_before_subtract
    importing
      !value_1 type i
      !value_2 type i
    raising
      zcx_check_failed .

  methods check_before_multiply
    importing
      !value_1 type i
      !value_2 type i
    raising
      zcx_check_failed .

  methods check_before_divide
    importing
      !value_1 type i
      !value_2 type i
    raising
      zcx_check_failed .

endinterface.
