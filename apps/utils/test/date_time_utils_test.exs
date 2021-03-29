defmodule DateTimeUtilsTest do
  use ExUnit.Case

  alias Auth.Utils.DateTimeUtils

  describe "UTC is four hours ahead of default tz during daylight savings time (EDT)" do
    dtl = DateTime.from_naive!(~N[2021-03-17 12:00:00],
      DateTimeUtils.time_zone_default())
    dtu = DateTime.from_naive!(~N[2021-03-17 12:00:00],
      DateTimeUtils.time_zone_utc())
    assert DateTime.diff(dtl, dtu) == (60 * 60) * 4
  end

  describe "UTC is 5 hours ahead of default tz during standard time (EST)" do
    dtl = DateTime.from_naive!(~N[2021-01-01 12:00:00],
      DateTimeUtils.time_zone_default())
    dtu = DateTime.from_naive!(~N[2021-01-01 12:00:00],
      DateTimeUtils.time_zone_utc())
    assert DateTime.diff(dtl, dtu) == (60 * 60) * 5
  end

  describe "UTC dt displays correctly in default tz" do
    dtu = DateTime.from_naive!(~N[2021-03-17 12:00:00],
      DateTimeUtils.time_zone_utc())
    assert DateTimeUtils.display_in_time_zone(dtu) == "2021-03-17 08:00:00"
  end

  describe "UTC dt start of day, first microsecond is all zeros" do
    dtu = DateTime.from_naive!(~N[2021-03-17 12:00:00],
      DateTimeUtils.time_zone_utc())
    assert DateTimeUtils.start_of_day(dtu) == ~U[2021-03-17 00:00:00.000000Z]
  end

  describe "UTC dt end of day, last microsecond" do
    dtu = DateTime.from_naive!(~N[2021-03-17 12:00:00],
      DateTimeUtils.time_zone_utc())
    assert DateTimeUtils.end_of_day(dtu) == ~U[2021-03-17 23:59:59.999999Z]
  end

  describe "UTC dt end of day plus 1 microsecond is the next day" do
    dtu = DateTime.from_naive!(~U[2021-03-17 23:59:59.999999Z],
      DateTimeUtils.time_zone_utc())
    assert DateTime.add(dtu, 1, :microsecond, Tzdata.TimeZoneDatabase) ==
      ~U[2021-03-18 00:00:00.000000Z]

    dtu2 = DateTime.from_naive!(~N[2021-03-18 12:00:00],
      DateTimeUtils.time_zone_utc())
    assert DateTime.add(dtu, 1, :microsecond, Tzdata.TimeZoneDatabase) ==
      DateTimeUtils.start_of_day(dtu2)
  end
end
