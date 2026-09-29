module MojComponent
  module FormBuilder
    def moj_search_component(attribute, **, &)
      @template.render(MojComponent::SearchComponent.new(form: self, attribute: attribute, **), &)
    end
  end
end
