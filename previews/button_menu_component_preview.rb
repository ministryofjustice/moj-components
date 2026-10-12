class ButtonMenuComponentPreview < ViewComponent::Preview
  # @!group Types

  # More information about how and when to use the [Button menu component is available in the MoJ
  # Design System documentation](https://design-patterns.service.justice.gov.uk/components/button-menu/)
  #
  def default
    render_with_template
  end

  # @after_render :wrap_output
  def right_aligned
    render_with_template
  end

  def grouped
    render_with_template
  end

  # @!endgroup

private

  def wrap_output(html, _context)
    %(<div style="display: flex; flex-direction: row-reverse">#{html}</div>)
  end
end
