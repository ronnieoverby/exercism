defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    days = for day <- days_of_month(year, month),
           weekday_of(year, month, day) === weekday,
           do: day

    day =
      case schedule do
        :first -> Enum.at(days, 0)
        :second -> Enum.at(days, 1)
        :third -> Enum.at(days, 2)
        :fourth -> Enum.at(days, 3)
        :last -> List.last(days)
        :teenth -> Enum.find(days, &is_teenth/1)
      end

    {year, month, day}
  end

  defp weekday_of(year, month, day) do
    i = :calendar.day_of_the_week(year, month, day) - 1
    [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
    |> Enum.at(i)
  end

  defp days_of_month(year, month) do
    last_day = :calendar.last_day_of_the_month(year, month)
    for d <- 1..last_day, do: d
  end

  defp is_teenth(day), do: day > 12 and day < 20
end