defmodule Adept.ListTest do
  use ExUnit.Case, async: true
    
  @len 1000


  #--------------------------------------------------------
  test "randomize randomizes a list" do
    original_list = Enum.to_list(1..10_000)
    random_list = Adept.List.randomize( original_list )

    refute original_list == random_list
    assert Enum.count(original_list) == Enum.count(random_list)
  end


  #--------------------------------------------------------
  test "take_random generates a new list of defined length, randomly built from a source list" do
    source = [ 1, "abc", :some_atom, %{}, 'ABC', 2.1 ]
    out = Adept.List.take_random( source, @len )
    assert is_list(out)
    assert Enum.count(out) == @len
    assert Enum.all?( out, &Enum.member?(source, &1) )
  end

end