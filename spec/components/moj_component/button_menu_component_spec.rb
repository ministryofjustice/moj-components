require "spec_helper"

RSpec.describe MojComponent::ButtonMenuComponent, type: :component do
  context "when button menu component is called" do
    let(:content) do
      render_inline described_class.new(menu_title: "Menu title") do |component|
        component.with_menu_item(text: "Menu item 1", href: "test-url-1")
      end
    end

    it "renders the menu title for the JavaScript toggle" do
      expect(content).to have_css(
        ".moj-button-menu[data-button-text='Menu title']",
      )
    end

    context "with one menu item" do
      it "renders only one" do
        expect(content).to have_link("Menu item 1", href: "test-url-1", class: %w[govuk-button moj-button-menu__item govuk-button--secondary])
      end
    end

    context "with multiple menu items" do
      let(:content) do
        render_inline described_class.new(menu_title: "Menu title") do |component|
          component.with_menu_item(text: "Menu item 1", href: "test-url-1")
          component.with_menu_item(text: "Menu item 2", href: "test-url-2")
        end
      end

      it "renders each one in order" do
        expect(content).to have_link("Menu item 1", href: "test-url-1", class: ["govuk-button", "moj-button-menu__item", "govuk-button--secondary"])
        expect(content).to have_link("Menu item 2", href: "test-url-2", class: ["govuk-button", "moj-button-menu__item", "govuk-button--secondary"])
      end
    end

    context "without href" do
      let(:content) do
        render_inline described_class.new(menu_title: "Menu title") do |component|
          component.with_menu_item(text: "Menu item 1")
        end
      end

      it "defaults to #" do
        expect(content).to have_link("Menu item 1", href: "#", class: ["govuk-button", "moj-button-menu__item", "govuk-button--secondary"])
      end
    end
  end
end
