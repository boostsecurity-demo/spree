module Spree
  module Emails
    class Configuration < Preferences::Configuration
      preference :logo, :string, default: 'logo/spree_50.png'
    end
  end
end
