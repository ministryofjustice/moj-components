class DatePickerComponentPreview < ViewComponent::Preview
  # @!group Types
  #
  # More information about how and when to use the [Date Picker is available in the MoJ
  # Design System documentation](https://design-patterns.service.justice.gov.uk/components/date-picker/)
  #
  def default
    render_with_template
  end

  def with_excluded_dates
    render_with_template
  end

  # @!endgroup
end
