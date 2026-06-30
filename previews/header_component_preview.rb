class HeaderComponentPreview < ViewComponent::Preview
  # @!group Types
  #
  # More information about how and when to use the [MoJ Header is available in the MoJ
  # Design System documentation](https://design-patterns.service.justice.gov.uk/components/moj-header/)
  #
  def default
    render_with_template
  end

  def with_navigation_items
    render_with_template
  end

  # @!endgroup
end
