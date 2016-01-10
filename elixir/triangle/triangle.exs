defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }  
  def kind(a, b, c) do

  	cond do
  	  Enum.any?([a,b,c], &(&1 <= 0)) ->
  	  	{:error, "all side lengths must be positive"}

	  not triangle_inequality(a,b,c) ->	  	
  	  	{:error, "side lengths violate triangle inequality"}

	  true ->
	  	case [a,b,c] |> Enum.uniq |> Enum.count do
	  	   1 -> {:ok, :equilateral}
	  	   2 -> {:ok, :isosceles }
	  	   3 -> {:ok, :scalene}  	    
	  	end
  	    
  	end

  end

  defp triangle_inequality(a, b, c) do
  	[a,b,c] = Enum.sort [a,b,c]
  	a + b > c
  end
end
