defmodule Roman do

  @steps [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t  
  def numerals(number) do
    numerals(@steps, number, "")
  end

  defp numerals(_, 0, acc), do: acc  
  defp numerals([{n,r}|_] = steps, number, acc) when number >= n do
    numerals(steps, number - n, acc <> r)
  end
  defp numerals([_|t], number, acc) do
    numerals(t, number, acc)
  end
end
