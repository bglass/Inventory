require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "57fb86b55eadc8a8dbde84d47c485152cdf655254f05f5064996a602d57cf7b6"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')

    fetch_file_whitelist [              # List of allowed file paths when using fetch_file (strings or regexps)
      /^\/home\/boris\/Nextcloud\/Inventory\//
    ]

end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
ActiveSupport.on_load(:active_record) do
  extend Dragonfly::Model
  extend Dragonfly::Model::Validations
end
