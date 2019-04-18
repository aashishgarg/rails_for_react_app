# Instance Details
set :host_ip, '18.222.194.56'
set :domain, fetch(:host_ip)

# Rails Environment
set :rails_env, 'production'
set :ssl_enabled, false