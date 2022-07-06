defmodule Adept.MapTest do
  use ExUnit.Case, async: true

  # --------------------------------------------------------
  test "stringify_keys transforms all the keys into strings" do
    assert Adept.Map.stringify_keys(%{
             :one => 1,
             2 => 2,
             "three" => 3
           }) == %{
             "one" => 1,
             "2" => 2,
             "three" => 3
           }
  end

  # --------------------------------------------------------
  test "put_set puts non-nil values into the map" do
    map =
      %{}
      |> Adept.Map.put_set(:abc, 123)
      |> Adept.Map.put_set(:def, 456)

    assert map == %{abc: 123, def: 456}
  end

  test "put_set does not put nil values into the map" do
    map =
      %{}
      |> Adept.Map.put_set(:abc, nil)
      |> Adept.Map.put_set(:def, nil)

    assert map == %{}
  end
end
