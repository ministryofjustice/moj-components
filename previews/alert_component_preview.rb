class AlertComponentPreview < ViewComponent::Preview
  # @!group Types

  # More information about how and when to use the [Alert component is available in the MoJ
  # Design System documentation](https://design-patterns.service.justice.gov.uk/components/alert/)
  #
  def information
    render_with_template
  end

  def success
    render_with_template
  end

  def warning
    render_with_template
  end

  def error
    render_with_template
  end

  # @!endgroup
end
