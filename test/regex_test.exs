defmodule Adept.RegexTest do
  use ExUnit.Case, async: true
    
  #--------------------------------------------------------
  test "regex_email passes valid emails" do
    assert Regex.match?(Adept.Regex.email, "user@example.com")
    assert Regex.match?(Adept.Regex.email, "user@example.co.uk")
    assert Regex.match?(Adept.Regex.email, "user.name@example.co.nz")
  end

  test "regex_email fails invalid emails" do
    refute Regex.match?(Adept.Regex.email, "not an email address")
    refute Regex.match?(Adept.Regex.email, "almost@butnotreally ok")
  end

  #--------------------------------------------------------
  test "regex_not_email fails valid emails" do
    refute Regex.match?(Adept.Regex.not_email, "user@eXample.com")
    refute Regex.match?(Adept.Regex.not_email, "user@example.co.uk")
    refute Regex.match?(Adept.Regex.not_email, "uSer.name@example.co.nz")
  end

  test "regex_not_email passes invalid emails" do
    assert Regex.match?(Adept.Regex.not_email, "not an email address")
    assert Regex.match?(Adept.Regex.not_email, "alMost@butnotreally ok")
  end

  #--------------------------------------------------------
  test "multiple_spaces matches strings with multiple consective spaces" do
    assert Regex.match?(Adept.Regex.multiple_spaces, "Test  String")
    assert Regex.match?(Adept.Regex.multiple_spaces, " This is a  test ")
  end

  test "multiple_spaces fails strings with no or single spaces" do
    refute Regex.match?(Adept.Regex.multiple_spaces, "TestString")
    refute Regex.match?(Adept.Regex.multiple_spaces, "Test String test")
    refute Regex.match?(Adept.Regex.multiple_spaces, " TestString ")
  end

  #--------------------------------------------------------
  test "punctuation matches strings with punctuation" do
    assert Regex.match?(Adept.Regex.punctuation, "Test string.")
    assert Regex.match?(Adept.Regex.punctuation, "Test string?")
  end

  test "punctuation fails strings with no punctuation" do
    refute Regex.match?(Adept.Regex.punctuation, "TestString")
    refute Regex.match?(Adept.Regex.punctuation, "Test String")
  end

  #--------------------------------------------------------
  test "uri matches valid uri strings" do
    assert Regex.match?(Adept.Regex.uri_web, "http://www.example.com")
    assert Regex.match?(Adept.Regex.uri_web, "https://www.example.com")
    assert Regex.match?(Adept.Regex.uri_web, "http://www.example.com?a=1")
    assert Regex.match?(Adept.Regex.uri_web, "https://www.example.com?b=abc&c=2")

    assert Regex.match?(Adept.Regex.uri_web, "ws://www.example.com")
    assert Regex.match?(Adept.Regex.uri_web, "wss://www.example.com")
  end

  test "punctuation fails invalid uri strings" do
    refute Regex.match?(Adept.Regex.uri, "TestString")
    refute Regex.match?(Adept.Regex.uri, "Test String")
  end

  #--------------------------------------------------------
  test "uri matches valid web strings" do
    assert Regex.match?(Adept.Regex.uri_web, "http://www.example.com")
    assert Regex.match?(Adept.Regex.uri_web, "https://www.example.com")
    assert Regex.match?(Adept.Regex.uri_web, "http://www.example.com?a=1")
    assert Regex.match?(Adept.Regex.uri_web, "https://www.example.com?b=abc&c=2")
  end

  test "punctuation fails invalid web strings" do
    refute Regex.match?(Adept.Regex.uri_web, "TestString")
    refute Regex.match?(Adept.Regex.uri_web, "Test String")

    assert Regex.match?(Adept.Regex.uri_web, "ws://www.example.com")
    assert Regex.match?(Adept.Regex.uri_web, "wss://www.example.com")
  end

end