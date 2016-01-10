defmodule Triangle do

  import Enum
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }  
  def kind(a, b, c) do

  	[a,b,c] = sides = sort [a,b,c]

  	cond do
	  a <= 0 ->
  	  	{:error, "all side lengths must be positive"}

	  a + b <= c ->	  	
  	  	{:error, "side lengths violate triangle inequality"}

	  true ->
	  	case sides |> uniq |> count do
	  	   1 -> {:ok, :equilateral}
	  	   2 -> {:ok, :isosceles}
	  	   3 -> {:ok, :scalene}
	  	end  	    
  	end
  end
end
