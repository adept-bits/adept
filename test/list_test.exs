defmodule Adept.ListTest do
  use ExUnit.Case, async: true
    
  @len 1000

  #--------------------------------------------------------
  test "random generates a fixed length random list, built from a source list" do
    source = [ 1, "abc", :some_atom, %{}, 'ABC', 2.1 ]
    out = Adept.List.random( source, @len )
    assert is_list(out)
    assert Enum.count(out) == @len
    assert Enum.all?( out, &Enum.member?(source, &1) )
  end

end