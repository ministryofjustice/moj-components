# frozen_string_literal: true

require "moj_component/version"
require "moj_component/railtie" if defined?(Rails::Railtie)

MojComponents = MojComponent unless defined?(MojComponents)
