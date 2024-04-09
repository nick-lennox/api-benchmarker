defmodule Ingest do
  require OddsJam

  @moduledoc """
  Documentation for `Ingest`.
  """
  def ingest_driver do
    client = OddsJam.client()
    # client |> OddsJam.get("api/v2/leagues?sport=basketball")
    client |> OddsJam.game_odds([game_id: "40503-38015-2024-05-11", sportsbook: "BetMGM"])
  end
end
