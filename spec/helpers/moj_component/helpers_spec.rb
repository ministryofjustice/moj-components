require "spec_helper"
require "rspec/rails"

RSpec.shared_examples "a rendered component" do |selector|
  it "renders the component" do
    expect(rendered_component).to have_css(selector)
  end
end

RSpec.describe MojComponent::Helpers, type: :helper do
  describe "#moj_alert" do
    subject(:rendered_component) do
      helper.moj_alert(type: :information,
                       heading: "Heading",
                       body: "Body",
                       dismiss_href: "#",
                       dismiss_text: "Dismiss")
    end

    it_behaves_like "a rendered component", "div.moj-alert"
  end

  describe "#moj_header" do
    subject(:rendered_component) do
      helper.moj_header(organisation_name: "Organisation Name",
                        url: "#")
    end

    it_behaves_like "a rendered component", "header.moj-header"
  end

  describe "#moj_interruption_card" do
    subject(:rendered_component) do
      helper.moj_interruption_card(heading: "Heading")
    end

    it_behaves_like "a rendered component", "div.moj-interruption-card"
  end

  describe "#moj_sub_navigation" do
    subject(:rendered_component) do
      helper.moj_sub_navigation do |component|
        component.with_navigation_item(text: "Nav item 1")
      end
    end

    it_behaves_like "a rendered component", "nav.moj-sub-navigation"
  end
end
