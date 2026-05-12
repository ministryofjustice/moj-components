class HeaderComponentPreview < ViewComponent::Preview
  # @!group Types
  #
  # More information about how and when to use the [MoJ Header is available in the MoJ
  # Design System documentation](https://design-patterns.service.justice.gov.uk/components/moj-header/)
  #
  # @param organisation_name text
  # @param url text
  def default(organisation_name: "Organisation Name", url: "#")
    render_with_template(locals: { organisation_name: organisation_name, url: url })
  end

  # @param organisation_name text
  # @param url text
  # @param nav_item_1 text
  # @param nav_item_2 text
  def with_navigation_items(organisation_name: "Organisation Name", url: "#", nav_item_1: "Nav item 1", nav_item_2: "Nav item 2")
    render_with_template(locals: { organisation_name:, url:, nav_item_1:, nav_item_2: })
  end

  # @!endgroup
end
