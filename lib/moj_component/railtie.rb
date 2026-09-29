# frozen_string_literal: true

require "rails/railtie"
require "pathname"
require "moj_component/form_builder"
require "govuk_design_system_formbuilder"

module MojComponent
  class Railtie < ::Rails::Railtie
    GEM_ROOT = Pathname(__dir__).join("..", "..").expand_path

    initializer "moj_component.autoload", before: "action_view.set_configs" do
      loader = Rails.autoloaders.main
      %w[app/components app/helpers].each do |rel|
        dir = GEM_ROOT.join(rel)
        loader.push_dir(dir.to_s) if dir.directory?
      end
    end

    initializer "moj_component.assets", before: "propshaft.assets_middleware" do |app|
      node_modules = Rails.root.join("node_modules")

      asset_paths = [
        node_modules.join("govuk-frontend", "dist", "govuk", "assets"),
        node_modules.join("@ministryofjustice", "frontend", "moj", "assets"),
      ]

      asset_paths.each do |path|
        app.config.assets.paths << path if path.directory?
      end
    end

    # Make helpers available in views (require file to avoid timing issues)
    initializer "moj_component.view_helpers" do
      helpers_file = GEM_ROOT.join("app/helpers/moj_component/helpers.rb")
      require helpers_file.to_s if helpers_file.file?

      ActiveSupport.on_load(:action_view) do
        include ::MojComponent::Helpers
      end
    end

    initializer "moj_component.form_builder" do
      ActiveSupport.on_load(:action_view) do
        if defined?(GOVUKDesignSystemFormBuilder::FormBuilder)
          GOVUKDesignSystemFormBuilder::FormBuilder.include(MojComponent::FormBuilder)
        end
      end
    end
  end
end
