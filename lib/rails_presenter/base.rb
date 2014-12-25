class RailsPresenter::Base
  include ActionView::Context       # fix output_buffer to be able to capture yielded block
  include Haml::Helpers             # add capture_haml support
  include Sprockets::Rails::Helper  # add asset pipeline support
  def initialize
    self.debug_assets  = Rails.application.config.assets.debug
    self.digest_assets = Rails.application.config.assets.digest
    self.assets_prefix = Rails.application.config.assets.prefix
    self.assets_environment = Rails.application.assets if Rails.application.config.assets.compile
    self.assets_manifest = Rails.application.assets_manifest
  end

  def t(*args)
    I18n.t(*args)
  end

  def capture_haml(*args, &block)
    buffer = eval('if defined? _hamlout then _hamlout else nil end', block.binding) || haml_buffer
    with_haml_buffer(buffer) do
      position = haml_buffer.buffer.length

      haml_buffer.capture_position = position
      value = block.call(*args)

      captured = haml_buffer.buffer.slice!(position..-1)

      if captured == '' and value != haml_buffer.buffer
        captured = (value.is_a?(String) ? value : nil)
      end

      return nil if captured.nil?
      return (haml_buffer.options[:ugly] ? captured : prettify(captured))
    end
    # https://github.com/haml/haml/issues/822
    #ensure
    #haml_buffer.capture_position = nil
  end
end
