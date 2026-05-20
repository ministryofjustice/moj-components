class SubNavigationComponentPreview < ViewComponent::Preview
  # More information about how and when to use the [Sub navigation component is available in the MoJ
  # Design System documentation](https://design-patterns.service.justice.gov.uk/components/sub-navigation/)
  #
  # @param nav_item_1 text
  # @param nav_item_2 text
  # @param nav_item_3 text
  def default(nav_item_1: "Nav item 1", nav_item_2: "Nav item 2", nav_item_3: "Nav item 3")
    render_with_template(locals: { nav_item_1:, nav_item_2:, nav_item_3: })
  end
end
