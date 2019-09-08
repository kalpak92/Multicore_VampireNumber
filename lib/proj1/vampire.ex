defmodule Vampire do
  @moduledoc """
  This module calculates whether a number is a Vampire Number or not.
  If yes, it returns the number and the fangs of it.
  """
  def factor_pairs(n) do
    # factor_pairs generates set of factors for any number,probable fangs
    first = trunc(n / :math.pow(10, div(char_len(n), 2)))
    last  = :math.sqrt(n) |> round
    for i <- first .. last, rem(n, i) == 0, do: {i, div(n, i)}
  end

  def vampire_factors(n) do
    if rem(char_len(n), 2) == 1 do
      []
    else
      half = div(length(to_charlist(n)), 2)
      sorted = Enum.sort(String.codepoints("#{n}"))

      # Filter out the factors of the number with length half of that of the number
      enum_equal_length = Enum.filter(factor_pairs(n),
                          fn {a, b} ->
                            char_len(a) == half && char_len(b) == half
                          end)

      # Filter out the factor pairs that has a trailing zero in each of them
      pairs_with_no_trailing_zero = Enum.filter(enum_equal_length,
                                    fn {a,b} ->
                                      Enum.count([a,b],fn x-> rem(x,10) == 0 end) != 2
                                    end)

      # Filter out the factor pairs that dont multiply back to the original number
      Enum.filter(pairs_with_no_trailing_zero,
          fn {a,b} ->
            Enum.sort(String.codepoints("#{a}#{b}")) == sorted
          end)
    end
  end

  defp  char_len(n), do: length(to_charlist(n))

end
