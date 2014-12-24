class RailsPresenter::Base
  include ActionView::Context
  include Sprockets::Rails::Helper
  def initialize
    self.debug_assets  = Rails.application.config.assets.debug
    self.digest_assets = Rails.application.config.assets.digest
    self.assets_prefix = Rails.application.config.assets.prefix
    self.assets_environment = Rails.application.assets if Rails.application.config.assets.compile
    self.assets_manifest = Rails.application.assets_manifest
  end
end
