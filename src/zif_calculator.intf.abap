"! This interface provides a sophisticated calculator that offers the following operations:
"! <ul>
"! <li>
"!   Add
"! </li>
"! <li>
"!   Subtract
"! </li>
"! <li>
"!   Multiply
"! </li>
"! <li>
"!   Divide
"! </li>
"! </ul>
"! The implementation of the calculator is provided by the class {@link zcl_calculator}
interface ZIF_CALCULATOR
  public .

    "! Add Operation of the calculator
    constants co_operation_add      type zcalculator_operation value 'A'.
    "! subtract Operation of the calculator
    constants co_operation_subtract type zcalculator_operation value 'S'.
    "! Multiply Operation of the calculator
    constants co_operation_multiply type zcalculator_operation value 'M'.
    "! Divide Operation of the calculator
    constants co_operation_divide   type zcalculator_operation value 'D'.
    "! This method adds two values and returns the sum
    "! @parameter value_1 | first operand
    "! @parameter value_2 | second operand
    "! @parameter sum | Sum of both operands
    "! @raising zcx_calculator_aborted | Something went wrong
    methods add
      importing
        value_1    type i
        value_2    type i
      returning
        value(sum) type i
      raising
        zcx_calculator_aborted.
    "! This method subtracts two values and returns the difference
    "! @parameter value_1 | first operand
    "! @parameter value_2 | second operand
    "! @parameter difference | Difference of both operands
    "! @raising zcx_calculator_aborted | Something went wrong
    methods subtract
      importing
        value_1           type i
        value_2           type i
      returning
        value(difference) type i
      raising
        zcx_calculator_aborted.
    "! This method multiplies two values and returns the product
    "! @parameter value_1 | first operand
    "! @parameter value_2 | second operand
    "! @parameter product | Product of both operands
    "! @raising zcx_calculator_aborted | Something went wrong
    methods multiply
      importing
        value_1        type i
        value_2        type i
      returning
        value(product) type i
      raising
        zcx_calculator_aborted.
    "! This method divides two values and returns the quotient
    "! @parameter value_1 | first operand
    "! @parameter value_2 | second operand
    "! @parameter quotient | Quotient of both operands
    "! @raising zcx_calculator_aborted | Something went wrong
    methods divide
      importing
        value_1         type i
        value_2         type i
      returning
        value(quotient) type decfloat16
      raising
        zcx_calculator_aborted.

endinterface.
