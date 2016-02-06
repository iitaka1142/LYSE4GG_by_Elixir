# 5 Recursive
defmodule Recursive do
## 5.1
  # export -> def, private -> defp
  def fac(0), do: 1
  def fac(n) when n > 0, do: n * fac(n-1) # arguments should not start Upper Char
  def fac(_), do: "error"

  def len([]), do: 0
  def len([_|tail]), do: 1 + len(tail)

  def tail_fac(n), do: tail_fac(n, 1)
  defp tail_fac(0, ans), do: ans
  defp tail_fac(n, ans), do: tail_fac(n-1, ans*n)

  def tail_len(l), do: tail_len(l, 0)
  defp tail_len([], len), do: len
  defp tail_len([_|tail], len), do: tail_len(tail, len + 1)

## 5.2
  ## pass

end

## 5.3
defmodule Tree do
  def empty(), do: {:node, :nil}

  def insert(key, val, {:node, :nil}) do
    {:node, {key, val, {:node, :nil}, {:node, :nil}}}
  end
  def insert(key, val, {:node, {key, _, smaller, larger}}) do
    {:node, {key, val, smaller, larger}}
  end
  def insert(key, val, {:node, {current_key, current_val, smaller, larger}}) do
    cond do
      key < current_key ->
        {:node, {current_key, current_val, insert(key, val, smaller), larger}}
      key > current_key ->
        {:node, {current_key, current_val, smaller, insert(key, val, larger)}}
    end
  end

  def lookup(_, {:node, :nil}), do: {:undefined}
  def lookup(key, {:node, {key, val, _, _}}), do: {:ok, val}
  def lookup(key, {:node, {current_key, _, smaller, larger}}) do
    cond do
      key < current_key -> lookup(key, smaller)
      key > current_key -> lookup(key, larger)
    end
  end

end
