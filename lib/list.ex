defmodule Adept.List do

  # generate a list of arbirary length randomly chosen from source
  def random( source, 0 ) when is_list(source), do: []
  def random( source, len ) when len > 0 and is_list(source) do
    do_random( len, source, [] )
  end
  defp do_random( 0, _source, out ), do: out
  defp do_random( len, source, out ) do
    do_random( len - 1, source, [ Enum.random(source) | out] )
  end

end
