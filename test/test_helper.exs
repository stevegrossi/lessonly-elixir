ExUnit.start()

defmodule Lessonly.ApiTest do
  defmacro __using__(_opts) do
    quote do
      use ExUnit.Case, async: false
      use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

      defp client do
        Lessonly.Client.new(
          "test",
          "t5tNqaykVwN3Hk1VXXNLOKG6snTMnU8U",
          "http://api.lvh.me:3000/api/v1"
        )
      end
    end
  end
end
