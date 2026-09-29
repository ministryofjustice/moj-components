# frozen_string_literal: true

module MojComponent
  class SearchComponent < ApplicationComponent
    attr_reader :form, :attribute, :style, :label, :hint, :value, :button_style, :button_text, :button_secondary, :attributes

    def initialize(form:, attribute:, label:, style: :inline, hint: {}, value: nil, button_style: :text, button_text: "Search", button_secondary: false, **attributes)
      @form = form
      @attribute = attribute
      @style = style
      @label = label
      @hint = hint
      @value = value
      @button_style = button_style
      @button_text = button_text
      @button_secondary = button_secondary
      @attributes = attributes
      super()
    end

  private

    def stacked?
      style.eql?(:stacked)
    end

    def inline?
      style.eql?(:inline)
    end

    def icon?
      button_style.eql?(:icon)
    end

    def render_submit
      if icon?
        form.button type: "submit", class: "govuk-button moj-search__button moj-search__button--icon", data: { module: "govuk-button" } do
          safe_join([icon_svg, tag.span(button_text, class: "govuk-visually-hidden")])
        end
      else
        form.govuk_submit(button_text, class: "moj-search__button", secondary: button_secondary)
      end
    end

    def icon_svg
      tag.svg(
        width: 20,
        height: 20,
        viewBox: "0 0 20 20",
        fill: "none",
        aria: { hidden: true },
        class: "moj-search__icon",
        xmlns: "http://www.w3.org/2000/svg",
      ) do
        safe_join([
          tag.path(
            d: "M8.90102 14.4683C12.385 14.4683 15.2093 11.644 15.2093 8.16005C15.2093 4.6761 12.385 1.85181 8.90102 1.85181C5.41707 1.85181 2.59277 4.6761 2.59277 8.16005C2.59277 11.644 5.41707 14.4683 8.90102 14.4683Z",
            stroke: "currentColor",
            "stroke-width": "2.22222",
          ),
          tag.path(
            d: "M13.2349 12.8584L19.5909 19.2144",
            stroke: "currentColor",
            "stroke-width": "2.22222",
          ),
        ])
      end
    end

    def render_input
      form.govuk_text_field attribute,
                            label: nil,
                            hint: nil,
                            class: "govuk-input moj-search__input",
                            type: "search",
                            "aria-describedby": ("search-hint" if hint.present?),
                            value:,
                            **attributes
    end
  end
end
