# Instance Details
set :host_ip, '13.59.8.126'
set :domain, fetch(:host_ip)

# Rails Environment
set :rails_env, 'production'
set :ssl_enabled, false