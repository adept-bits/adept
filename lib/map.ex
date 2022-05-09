defmodule Adept.Map do

  #--------------------------------------------------------
  @spec stringify_keys( map :: map ) :: map
  def stringify_keys( %{} = map ) do
    Enum.reduce(map, %{}, fn({k,v}, acc) ->
      Map.put( acc, to_string(k), v)
    end)
  end


  #--------------------------------------------------------
  @spec put_set( map :: map, key :: any, value :: any ) :: map
  def put_set( map, key, value )
  def put_set( map, key, nil ), do: map
  def put_set( map, key, value ), do: Map.put( map, key, value )

end