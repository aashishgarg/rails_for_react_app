require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Labs
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:3000'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end

    if Rails.env.production? || Rails.env.staging?
      config.middleware.use ExceptionNotification::Rack,
                            email: {
                              email_prefix: "[MyLocalLabs][#{Rails.env}] ",
                              sender_address: %('Exception Notifier' <no-reply@mylocallabs.com>),
                              exception_recipients: %w[01ashishgarg@gmail.com],
                              delivery_method: :smtp,
                              deliver_with: :deliver,
                              smtp_settings: {
                                address: 'smtp.gmail.com',
                                port: 587,
                                domain: 'gmail.com',
                                user_name: Rails.application.credentials.exception_username,
                                password: Rails.application.credentials.exception_password,
                                authentication: :plain,
                                enable_starttls_auto: true
                              }
                            }
    end
  end
end
