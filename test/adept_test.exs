defmodule AdeptTest do
  use ExUnit.Case
  doctest Adept

  test "greets the world" do
    assert Adept.hello() == :world
  end
end
