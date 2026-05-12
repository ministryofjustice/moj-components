class AlertComponentPreview < ViewComponent::Preview
  # @!group Types

  # More information about how and when to use the [Alert component is available in the MoJ
  # Design System documentation](https://design-patterns.service.justice.gov.uk/components/alert/)
  #
  # @param heading text
  # @param body text
  def information(heading: "Information", body: "This is an informational message.")
    render_with_template(template: "alert_component_preview/default", locals: { type: :information, heading: heading, body: body, dismiss_href: "#" })
  end

  # @param heading text
  # @param body text
  def success(heading: "Operation successful", body: "Your changes have been saved.")
    render_with_template(template: "alert_component_preview/default", locals: { type: :success, heading: heading, body: body, dismiss_href: "#" })
  end

  # @param heading text
  # @param body text
  def warning(heading: "Warning", body: "Please check your input.")
    render_with_template(template: "alert_component_preview/default", locals: { type: :warning, heading: heading, body: body, dismiss_href: "#" })
  end

  # @param heading text
  # @param body text
  def error(heading: "Error", body: "There was a problem with your request.")
    render_with_template(template: "alert_component_preview/default", locals: { type: :error, heading: heading, body: body, dismiss_href: "#" })
  end

  # @!endgroup
end
