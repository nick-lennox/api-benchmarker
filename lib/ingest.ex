defmodule Ingest do
    import OddsJam, only: [fetch_data: 2]
    @moduledoc """
    Documentation for `Ingest`.
    """
    def ingest_driver do
        Stream.repeatedly(fn -> :ok end) 
        |> Enum.each(fn _ -> fetch_data("todos/1", %{}) end)
    end
end