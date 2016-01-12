defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest. 
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(1), do: []
  def factors_for(number) do
      fs = factors(number)

      if Enum.any? fs do
        f1 = Enum.at(fs, 0)       
        f2 = div(number, f1)
        factors_for(f1) ++ factors_for(f2)
      else
        [number]
      end

  end 

  defp factors(n) do
    sqrt = n |> :math.sqrt |> trunc    
    factors(n, sqrt)
  end

  defp factors(n, sqrt) when sqrt < 2, do: MapSet.new
  defp factors(n, sqrt) do
    Enum.reduce(2..sqrt, MapSet.new, fn (i, set) -> 
      case rem(n,i) do
        0 -> set |> MapSet.put(i) |> MapSet.put(div(n,i))
        _ -> set  
      end      
    end)
  end


end
