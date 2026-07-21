# frozen_string_literal: true

module MojComponent
  class DatePickerComponent < ApplicationComponent
    attr_reader :heading, :hint, :min_date, :max_date, :excluded_dates, :excluded_days

    def initialize(heading:, hint: nil, min_date: nil, max_date: nil, excluded_dates: [], excluded_days: [])
      @heading = heading
      @hint = hint
      @min_date = min_date
      @max_date = max_date
      @excluded_dates = excluded_dates
      @excluded_days = excluded_days
      super()
    end
  end
end
