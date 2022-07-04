defmodule Adept.EnumTest do
  use ExUnit.Case, async: true
  
  #--------------------------------------------------------
  test "split_columns splits evenly" do
    assert Adept.Enum.split_columns([1,2,3,4,5,6,7,8,9], 3) == [
      [1,4,7],
      [2,5,8],
      [3,6,9],
    ]
  end

  test "split_columns splits with leftovers" do
    assert Adept.Enum.split_columns([1,2,3,4,5,6,7,8,], 3) == [
      [1,4,7],
      [2,5,8],
      [3,6],
    ]
  end

  test "split_columns makes empty columns where there aren't enough items" do
    assert Adept.Enum.split_columns([1,2], 3) == [
      [1],
      [2],
      []
    ]
  end

end