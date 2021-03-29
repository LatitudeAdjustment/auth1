defmodule Auth.Utils.DateTimeUtils do

  # Defaults to America/New_York, EDT/EST but should come from client.
  @time_zone_default "America/New_York"
  @time_zone_utc "Etc/UTC"

  def time_zone_default() do
    @time_zone_default
  end

  def time_zone_utc() do
    @time_zone_utc
  end

  def time_zone_now(time_zone \\ @time_zone_default) do
    DateTime.now(time_zone)
  end

  def time_zone_now!(time_zone \\ @time_zone_default) do
    DateTime.now!(time_zone)
  end

  def utc_now() do
    DateTime.utc_now()
  end

  def to_time_zone(%DateTime{} = dt, time_zone \\ @time_zone_default) do
    DateTime.shift_zone!(dt, time_zone)
  end

  def to_utc(%DateTime{} = dt) do
    DateTime.shift_zone!(dt, @time_zone_utc)
  end

  def display_in_time_zone(dt, time_zone \\ @time_zone_default, _format \\ :standard)
  def display_in_time_zone(%DateTime{} = dt, time_zone, :extended) do
    to_time_zone(dt, time_zone)
    |> DateTime.to_string()
  end
  def display_in_time_zone(%DateTime{} = dt, time_zone, :standard) do
    to_time_zone(dt, time_zone)
    |> DateTime.to_string()
    |> String.slice(0..18)
  end

  def end_of_day(%DateTime{} = dt) do
    %DateTime{dt | hour: 23, minute: 59, second: 59, microsecond: {999999, 6}}
  end

  def start_of_day(%DateTime{} = dt) do
    %DateTime{dt | hour: 0, minute: 0, second: 0, microsecond: {000000, 6}}
  end
end
