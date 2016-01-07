defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer  
  def count(strand, nucleotide) when nucleotide in @nucleotides do 
    strand |> histogram |> Map.get(nucleotide)
  end

  def count(_strand, nucleotide) do
    raise ArgumentError, message: "invalid nucleotide: #{nucleotide}"
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: Dict.t
  def histogram(strand) do
    map = Map.new(@nucleotides, fn k -> {k, 0} end)
    Enum.reduce(strand, map, &increment_histogram/2)
  end

  defp increment_histogram(key, map) when key in @nucleotides do
    Map.update(map, key, 0, &(&1 + 1))
  end

  defp increment_histogram(key, _map) do
    raise ArgumentError, message: "invalid nucleotide found in dna strand: #{key}"
  end
end
