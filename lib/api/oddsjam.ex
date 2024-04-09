defmodule OddsJam do
  use Tesla

  @base_url "https://api-external.oddsjam.com"
  @api_version "v2"
  @api_key System.get_env("ODDSJAM_API_KEY")

  def game_odds(client, params) do
    get(client, "game-odds", query: params)
  end

  def client do
    url = build_base_url()

    middleware = [
      {Tesla.Middleware.BaseUrl, url},
      Tesla.Middleware.JSON,
      {Tesla.Middleware.Headers, [{"X-Api-Key", @api_key}]}
    ]

    Tesla.client(middleware)
  end

  defp build_base_url do
    "#{@base_url}/api/#{@api_version}"
  end
end
