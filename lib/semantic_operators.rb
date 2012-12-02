module SemanticOperators
  def more_then(operand1, operand2)
    operand1 > operand2
  end

  def more_then_equal(operand1, operand2)
    operand1 >= operand2
  end

  def is(operand1, operand2)
    operand1 == operand2
  end

  def any_of(operand1, operand2)
    operand2.any? { |i| i == operand1 }
  end

end
