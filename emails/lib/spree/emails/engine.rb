require 'rails/engine'

module Spree
  module Emails
    class Engine < Rails::Engine
      isolate_namespace Spree
      engine_name 'spree_emails'

      def self.activate
        Dir.glob(File.join(File.dirname(__FILE__), '../../../app/**/*_decorator*.rb')).sort.each do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end
      end

      initializer 'spree.emails.environment', before: :load_config_initializers do |_app|
        Spree::Emails::Config = Spree::Emails::Configuration.new
      end

      config.to_prepare &method(:activate).to_proc
    end
  end
end
