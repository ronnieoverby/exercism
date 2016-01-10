defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from(:calendar.datetime) :: :calendar.datetime
  def from(datetime) do
    :calendar.datetime_to_gregorian_seconds(datetime) + 1_000_000_000
    |> :calendar.gregorian_seconds_to_datetime
  end
end
