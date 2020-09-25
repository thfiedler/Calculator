interface ZIF_CALCULATOR_BADI
  public .


  interfaces IF_BADI_INTERFACE .

  methods CHECK_BEFORE_ADD
    importing
      !VALUE_1 type I
      !VALUE_2 type I
    raising
      ZCX_CHECK_FAILED .
  methods CHECK_BEFORE_SUBTRACT .
endinterface.
