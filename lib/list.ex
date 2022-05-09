defmodule Adept.List do

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