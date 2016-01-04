defmodule Bob do
  def hey(input) do

  	input = String.strip input

  	cond do
  	  silence? input  -> "Fine. Be that way!"
  	  yelling? input  -> "Whoa, chill out!"
  	  question? input -> "Sure."
	  true            -> "Whatever."
  	end

  end

  defp question?(input), do: String.ends_with? input, "?"

  defp silence?(input), do: input === ""

  defp yelling?(input), do:
  	String.upcase(input) === input and String.downcase(input) !== input

end