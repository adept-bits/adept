defmodule Adept.StringTest do
  use ExUnit.Case, async: true

  @big_string "  This  needs      to get   squashed.      "
  @squashed_string "This needs to get squashed."

  @ascii " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
  @len 1000

  # --------------------------------------------------------
  test "squash squashes strings" do
    assert Adept.String.squash(@big_string) == @squashed_string
  end

  test "squash leaves already squashed strings alone" do
    assert Adept.String.squash(@squashed_string) == @squashed_string
  end

  # --------------------------------------------------------
  test "ascii generates a string containing all the ascii characters" do
    assert Adept.String.ascii() == @ascii
  end

  # --------------------------------------------------------
  test "random generates a fixed length random string - in ascii set by default" do
    str = Adept.String.random(@len)
    assert is_bitstring(str)
    assert String.length(str) == @len

    str = String.to_charlist(str)
    ascii = String.to_charlist(@ascii)
    assert Enum.all?(str, &Enum.member?(ascii, &1))
  end

  test "random generates a fixed length random string into ascii set" do
    str = Adept.String.random(@len, :ascii)
    assert is_bitstring(str)
    assert String.length(str) == @len

    str = String.to_charlist(str)
    ascii = String.to_charlist(@ascii)
    assert Enum.all?(str, &Enum.member?(ascii, &1))
  end

  test "random accepts :base_16" do
    str = Adept.String.random(@len, :base_16)
    assert is_bitstring(str)
    assert String.length(str) == @len

    str = String.to_charlist(str)
    set = '0123456789ABCDEF'
    assert Enum.all?(str, &Enum.member?(set, &1))
  end

  test "random accepts base: :encode32" do
    str = Adept.String.random(@len, :base_32)
    assert is_bitstring(str)
    assert String.length(str) == @len

    str = String.to_charlist(str)
    set = '234567ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    assert Enum.all?(str, &Enum.member?(set, &1))
  end

  test "random accepts base: :encode64" do
    str = Adept.String.random(@len, :base_64)
    assert is_bitstring(str)
    assert String.length(str) == @len

    str = String.to_charlist(str)
    set = '+/0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
    assert Enum.all?(str, &Enum.member?(set, &1))
  end

  test "random accepts base: :url_encode64" do
    str = Adept.String.random(@len, :url)
    assert is_bitstring(str)
    assert String.length(str) == @len

    str = String.to_charlist(str)
    set = '-0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz'
    assert Enum.all?(str, &Enum.member?(set, &1))
  end
end
