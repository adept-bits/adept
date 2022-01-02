defmodule Adept.MapTest do
  use ExUnit.Case, async: true
  
  #--------------------------------------------------------
  test "stringify_keys transforms all the keys into strings" do
    assert Adept.Map.stringify_keys(%{
      :one    => 1,
      2       => 2,
      "three" => 3
    }) == %{
      "one"   => 1,
      "2"     => 2,
      "three" => 3
    }
  end

end