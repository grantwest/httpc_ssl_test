defmodule HttpcTestTest do
  use ExUnit.Case
  doctest HttpcTest

  test "check ssl" do
    [
      "https://expired.badssl.com/",
      "https://wrong.host.badssl.com/",
      "https://self-signed.badssl.com/",
      "https://untrusted-root.badssl.com/",
      "https://revoked.badssl.com/",
      "https://no-common-name.badssl.com/",
      "https://no-subject.badssl.com/",
      "https://incomplete-chain.badssl.com/",
      "https://dh480.badssl.com/"
    ]
    |> Enum.each(fn url ->
      IO.puts(url)

      assert_raise Tesla.Error, fn ->
        Tesla.get!(url)
      end
    end)
  end
end
