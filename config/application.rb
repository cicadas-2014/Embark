require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Embark
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end

  def flickr
    flickr = Flickr.new('5bf65fbfe5472d9e1a65a83d3aee25c2')    # create a flickr client (get an API key from http://api.flickr.com/services/api/)
    user = flickr.users('hellojasonmatney7@yahoo.com')   # lookup a user
    user.name                                     # get the user's name
    user.location                                 # and location
    user.photos                                   # grab their collection of Photo objects...
    user.groups                                   # ...the groups they're in...
    user.contacts                                 # ...their contacts...
    user.favorites                                # ...favorite photos...
    user.photosets                                # ...their photo sets...
    user.tags                                     # ...their tags...
    user.popular_tags                                                       # ...and their popular tags
  end
end
