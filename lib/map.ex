defmodule Adept.Map do

  #--------------------------------------------------------
  def stringify_keys( %{} = map ) do
    Enum.reduce(map, %{}, fn({k,v}, acc) ->
      Map.put( acc, to_string(k), v)
    end)
  end

end