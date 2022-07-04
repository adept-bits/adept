defmodule Adept.List do


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


  #--------------------------------------------------------
  @doc """
  Randomize the order of a list.
  """
  @spec randomize( list :: list ) :: list
  def randomize( list ) when is_list(list) do
    Enum.sort_by( list, fn(_) -> :rand.uniform() end)
  end


  #--------------------------------------------------------
  @doc """
  Generate a list of arbirary length randomly sampled from a source list.

  Items in the source list can be repeated in the final list, since they are randomly sampled.

  Unlike Enum.take, take_random can generate a new list that is longer than the source list. 
  """
  @spec take_random( list :: list, length :: pos_integer ) :: list
  def take_random( source, 0 ) when is_list(source), do: []
  def take_random( source, len ) when len > 0 and is_list(source) do
    do_take_random( len, source, [] )
  end
  defp do_take_random( 0, _source, out ), do: out
  defp do_take_random( len, source, out ) do
    do_take_random( len - 1, source, [ Enum.random(source) | out] )
  end

end