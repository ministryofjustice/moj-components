class InterruptionCardComponentPreview < ViewComponent::Preview
  # More information about how and when to use the [Interruption Card is available in the MoJ
  # Design System documentation](https://design-patterns.service.justice.gov.uk/components/interruption-card/)
  #
  # @param heading_text text
  def default(heading_text: "Are you sure you want to change this?")
    render_with_template(locals: { heading_text: heading_text })
  end
end
