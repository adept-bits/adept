defmodule Adept.Enum do

  #--------------------------------------------------------
  @doc """
  Splits the list into n new lists organized into columns

  ## Example
      iex> Adept.Map.split_columns( [1,2,3,4,5,6,7,8,9], 3 )
      [[1,4,7], [2,5,8], [3,6,9]]
  """
  @spec split_columns( items :: list, count :: pos_integer ) :: list
  def split_columns( items, count ) when is_list(items) do
    Enum.reduce(1..count, [], fn(c, acc) ->
      [ Enum.take_every(Enum.drop(items, c - 1), count) | acc ]
    end)
    |> Enum.reverse()
  end

end