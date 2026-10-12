# frozen_string_literal: true

module MojComponent
  class ButtonMenuComponent < ApplicationComponent
    attr_reader :menu_title

    renders_many :menu_items, "MenuItem"

    def initialize(menu_title:, secondary: false, alignment: "left")
      @menu_title = menu_title
      @secondary = secondary
      @alignment = alignment
      super()
    end

    class MenuItem < ApplicationComponent
      attr_reader :text, :href

      def initialize(text:, href: "#")
        @text = text
        @href = href
        super()
      end

      def call
        govuk_button_link_to(text, href, class: "moj-button-menu__item", secondary: true)
      end
    end
  end
end
