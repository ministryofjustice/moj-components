# Rails.application.configure do
#   # Previews live in the gem root at ./previews
#   config.lookbook.preview_paths = [Rails.root.join("..", "..", "previews")]

#   # Wrap preview renders in a GOV.UK/MoJ-styled layout
#   config.lookbook.preview_layout = "application"

#   config.lookbook.project_name = "moj-components"
# end

container_previews_path = Rails.root.join("previews").to_s
repo_previews_path = Rails.root.join("..", "..", "previews").to_s

previews_path = File.exist?(container_previews_path) ? container_previews_path : repo_previews_path

Rails.application.config.lookbook.preview_paths = [previews_path]
Rails.application.config.view_component.previews.paths = [previews_path]
Rails.application.config.lookbook.preview_layout = "application"
Rails.application.config.lookbook.project_name = "moj-components"

Rails.application.config.lookbook.ui_theme_overrides = {
  header_bg: "#0b0c0c",
}

if Rails.env.production?
  Dir.glob(File.join(previews_path, "**/*_preview.rb")).each do |file|
    require file
  end
end
