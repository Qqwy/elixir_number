defimpl Numbers.ProtocolsAddition, for: Float do
  def add(a, b), do: a + b
  def add_id(), do: 0.0
end

defimpl Numbers.ProtocolsSubtraction, for: Float do
  def sub(a, b), do: a - b
end

defimpl Numbers.ProtocolsMultiplication, for: Float do
  def mult(a, b), do: a * b
  def mult_id(), do: 1.0
end

defimpl Numbers.ProtocolsDivision, for: Float do
  def div(a, b), do: a / b
end

defimpl Numbers.Protocols.Minus, for: Float do
  def minus(num), do: -num
end

defimpl Numbers.Protocols.Absolute, for: Float do
  def abs(num) when num < 0, do: -num
  def abs(num), do: num
end

defimpl Numbers.Protocols.Exponentiation, for: Float do
  def pow(x, n) do
    :math.pow(x, n)
  end
end

# Allow functions to be called with an int as other argument as well
require Coerce
Coerce.defcoercion(Integer, Float) do
  def coerce(int, float) do
    {int + 0.0, float}
  end
end
