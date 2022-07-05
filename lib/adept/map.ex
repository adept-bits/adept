defmodule Adept.Map do

  #--------------------------------------------------------
  @doc """
  Stringify the keys in a map

  ## Example
      iex> Adept.Map.stringify_keys( %{:a => 1 , "b" => 2, 3 => 3 } )
      %{"a" => 1 , "b" => 2, "3" => 3 }
  """
  @spec stringify_keys( map :: map ) :: map
  def stringify_keys( %{} = map ) do
    Enum.reduce(map, %{}, fn({k,v}, acc) ->
      Map.put( acc, to_string(k), v)
    end)
  end


  #--------------------------------------------------------
  @doc """
  Put a value into a map, but only if that value is not nil

  This useful when building a new map from a list of attributes where you are not sure
  if they are set in the source and want to skip them if they are not
      attr = %{ abc: 123, ghi: 789 }
      new_map =
        %{}
        |> Adept.Map.put_set( :abc, Map.get(attr, :abc) )
        |> Adept.Map.put_set( :def, Map.get(attr, :def) )
        |> Adept.Map.put_set( :ghi, Map.get(attr, :ghi) )

  ## Examples

      iex> Adept.Map.put_set( %{}, :abc, "a string" )
      %{ abc: => "a string" }

      iex> Adept.Map.put_set( %{}, :abc, nil )
      %{}
  """
  @spec put_set( map :: map, key :: any, value :: any ) :: map
  def put_set( map, key, value )
  def put_set( map, _key, nil ), do: map
  def put_set( map, key, value ), do: Map.put( map, key, value )

end