# frozen_string_literal: true

module MojComponent
  class DatePickerComponent < ApplicationComponent
    attr_reader :heading, :name, :id, :hint, :min_date, :max_date, :excluded_dates, :excluded_days

    def initialize(
      heading:,
      name:,
      id: nil,
      hint: nil,
      min_date: nil,
      max_date: nil,
      excluded_dates: [],
      excluded_days: []
    )
      @heading = heading
      @name = name
      @id = id || name.to_s.tr("[]", "_").gsub(/_+$/, "")
      @hint = hint
      @min_date = min_date
      @max_date = max_date
      @excluded_dates = excluded_dates
      @excluded_days = excluded_days
      super()
    end

    def hint_id
      "#{id}-hint"
    end

    def described_by
      hint.present? ? hint_id : nil
    end
  end
end
