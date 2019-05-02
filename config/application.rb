require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RoverHouse
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Mon code
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', "**", '*.{rb,yml}').to_s]
    config.i18n.default_locale = :fr
    config.i18n.available_locales = [:fr, :en]

    config.generators do |g|
      g.assets false
      g.helper false
      g.test_framework nil
    end

# Pour compresser et minifier le code html final envoyé par le serveur au nagivateur
config.middleware.use Rack::Deflater
@options = {
 :enabled => true,
 :remove_multi_spaces => true,
 :remove_comments => true,
 :remove_intertag_spaces => true,
 :remove_quotes => false,
 :compress_css => true,
 :css_compressor => :yui,
 :compress_javascript => true,
 :javascript_compressor => :yui,
 :simple_doctype => true,
 :remove_script_attributes => false,
 :remove_style_attributes => false,
 :remove_link_attributes => false,
 :remove_form_attributes => false,
 :remove_input_attributes => false,
 :remove_javascript_protocol => false,
 :remove_http_protocol => false,
 :remove_https_protocol => false,
 :preserve_line_breaks => false,
 :simple_boolean_attributes => false,
 :compress_js_templates => false
 }
 config.middleware.use HtmlCompressor::Rack, @options
    # Mon code
    
  end
end
