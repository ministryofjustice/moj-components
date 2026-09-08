require "spec_helper"
require "govuk_design_system_formbuilder"

RSpec.describe MojComponent::SearchComponent, type: :component do
  let(:object) { Struct.new(:query, :persisted?).new("test query", false) }

  let(:form) do
    GOVUKDesignSystemFormBuilder::FormBuilder.new(
      :search,
      object,
      vc_test_view_context,
      {},
    )
  end

  let(:component_options) { {} }

  let(:content) do
    render_inline(
      described_class.new(
        form:,
        attribute: :query,
        label: "Find a person",
        **component_options,
      ),
    )
  end

  it "renders an inline search field" do
    expect(content).to have_css("search.moj-search")
    expect(content).to have_css("label.moj-search__label", text: "Find a person")
    expect(content).to have_field("search[query]", type: "search", class: "moj-search__input")
    expect(content).to have_button("Search")
  end

  it "renders the existing value" do
    expect(content).to have_field("search[query]", with: "test query")
  end

  context "when custom button text is supplied" do
    let(:component_options) { { button_text: "Find" } }

    it "renders the custom button text" do
      expect(content).to have_button("Find")
    end
  end

  context "when a hint is supplied" do
    let(:component_options) { { hint: "Search by name" } }

    it "associates the hint with the input" do
      expect(content).to have_css(".moj-search__hint", text: "Search by name")
      expect(content).to have_css("input[aria-describedby='search-hint']")
    end
  end

  context "when the button style is icon" do
    let(:component_options) { { button_style: :icon, button_text: "Find" } }

    it "renders an icon submit button with visually hidden text" do
      expect(content).to have_button(type: "submit", class: "moj-search__button moj-search__button--icon")
      expect(content).to have_css(".moj-search__icon")
      expect(content).to have_css(".govuk-visually-hidden", text: "Find")
    end
  end

  context "when the style is stacked" do
    let(:component_options) { { style: :stacked } }

    it "renders the stacked layout" do
      expect(content).to have_css("search.moj-search.moj-search--stacked")
      expect(content).to have_css(".moj-search__input")
      expect(content).to have_button("Search")
      expect(content).to have_no_css(".moj-search__input-wrapper")
    end
  end

  context "when the submit button is secondary" do
    let(:component_options) { { button_secondary: true } }

    it "renders a secondary submit button" do
      expect(content).to have_button("Search", class: "govuk-button--secondary")
    end
  end
end
