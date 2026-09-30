# frozen_string_literal: true

module MojComponent
  class HeaderComponent < ApplicationComponent
    renders_many :navigation_items, "NavigationItem"

    attr_reader :organisation_name,
                :url,
                :service_name,
                :service_url,
                :new_tab

    def initialize(organisation_name:, url:, service_name: nil, service_url: nil, new_tab: false)
      @organisation_name = organisation_name
      @url = url
      @service_name = service_name
      @service_url = service_url
      @new_tab = new_tab
      super()
    end

    class NavigationItem < ApplicationComponent
      attr_reader :text, :href, :current, :options

      def initialize(text:, href: nil, current: nil, options: {})
        @text = text
        @href = href
        @current = current
        @options = options
        super()
      end

      def call
        tag.li class: "moj-header__navigation-item" do
          link_to(text, href, class: "moj-header__navigation-link", aria: current_override, **options)
        end
      end

    private

      def current_override
        return unless current

        { current: "page" }
      end
    end
  end
end
