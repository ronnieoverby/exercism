defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l), do: _count(l, 0)
  defp _count([], acc), do: acc
  defp _count([_|t], acc), do: _count t, acc + 1

  @spec reverse(list) :: list
  def reverse(l) do
    _reverse(l,[])
  end

  defp _reverse([], acc), do: acc
  defp _reverse([h|t], acc) do
    _reverse(t, [h | acc])
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
      _map(l,f,[])
  end

  defp _map([], _f, acc), do: reverse acc
  defp _map([h|t], f, acc) do
    _map(t, f, [f.(h) | acc])
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    _filter(l,f,[])
  end

  defp _filter([], _f, acc), do: reverse acc
  defp _filter([h|t], f, acc) do
    if f.(h), do: acc = [h | acc]
    _filter(t,f,acc)
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    _reduce(l,acc,f)
  end

  def _reduce([], acc, _f), do: acc
  def _reduce([h|t], acc, f) do
    reduce(t, f.(h, acc), f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
     a = reverse a
     _append(a, b)
  end

  defp _append([], l2), do: l2
  defp _append([h | t], l2) do
    _append t, [ h | l2 ] 
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    _concat(reverse(ll), [])
  end

  defp _concat([], acc), do: acc
  defp _concat([hl|tl], acc) do
    _concat(tl, append(hl, acc))
  end
end
