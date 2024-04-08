defmodule OddsJam do
    @moduledoc """
    Documentation for `Ingest`.
    """
  
    @base_url "https://jsonplaceholder.typicode.com"
    @oddsjam_data_dir "#{File.cwd!}/data/oddsjam"

    File.mkdir_p!(@oddsjam_data_dir)

    def fetch_data(endpoint, params \\ %{}) do
        IO.puts @oddsjam_data_dir
        url = build_url(endpoint)
        headers = build_headers()
        case HTTPoison.get(url, headers) do
            {:ok, %HTTPoison.Response{body: body}} -> 
                IO.puts body
                save_to = "#{@oddsjam_data_dir}/response)_#{:os.system_time(:millisecond)}.json"
                File.write(save_to, body)
            {:error, %HTTPoison.Error{reason: reason}} -> IO.inspect reason
        end
    end
  
    defp build_url(endpoint) do
        "#{@base_url}/#{endpoint}"
    end

    defp build_headers do
        %{
            "Content-Type" => "application/json",
            "X-Api-Key" => "#{System.get_env("ODDSJAM_API_KEY")}"
        }
    end
  end
