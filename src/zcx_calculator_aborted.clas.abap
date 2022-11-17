class zcx_calculator_aborted definition
  public
  inheriting from cx_static_check
  final
  create public .

  public section.

    interfaces if_t100_message .

    methods constructor
      importing
        !textid   like if_t100_message=>t100key optional
        !previous like previous optional .
  protected section.
  private section.
ENDCLASS.



CLASS ZCX_CALCULATOR_ABORTED IMPLEMENTATION.


  method constructor ##ADT_SUPPRESS_GENERATION.
    call method super->constructor
      exporting
        previous = previous.
    clear me->textid.
    if textid is initial.
      if_t100_message~t100key = if_t100_message=>default_textid.
    else.
      if_t100_message~t100key = textid.
    endif.
  endmethod.
ENDCLASS.
