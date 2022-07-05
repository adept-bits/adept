defmodule Adept.String do

  def squash(string) do
    string
    |> String.trim
    |> String.replace(~r/\s{2,}/, " ")
  end

  # generate a bitstring that contains all the ascii characters
  def ascii() do
    Enum.reduce(126..32, [], fn(char, acc) -> [char | acc] end)
    |> to_string()
  end

  # generate a random string
  def random( len, into \\ :ascii )

  def random( len, :ascii ), do: random( len, ascii() )
  def random( len, :base_16 ), do: random_into_base( len, :encode16 )
  def random( len, :base_32 ), do: random_into_base( len, :encode32 )
  def random( len, :base_64 ), do: random_into_base( len, :encode64 )
  def random( len, :url ), do: random_into_base( len, :url_encode64 )

  def random( len, into ) when len > 0 and is_binary(into) do
    into
    |> String.to_charlist()
    |> Adept.List.take_random( len ) 
    |> to_string()
  end

  defp random_into_base( len, base ) when len > 0 do
    bytes = :crypto.strong_rand_bytes(len)
    case base do
      :encode16 -> Base.encode16(bytes, padding: false)
      :encode32 -> Base.encode32(bytes, padding: false)
      :encode64 -> Base.encode64(bytes, padding: false)
      :url_encode64 -> Base.url_encode64(bytes, padding: false)
    end
    |> binary_part(0, len)
  end

end
