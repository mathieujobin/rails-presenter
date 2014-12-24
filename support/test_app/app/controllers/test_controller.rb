class FooBarPresenter < RailsPresenter::Base
  def initialize
    super
  end

  def display_image
    image_tag('image.png')
  end

  def render_partial(view)
    view.render('partial/part', title: 'text')
  end

  def capture_block(&block)
    # ActionView::Template::Error:
    # undefined method `output_buffer=' for #<FooBarPresenter:0x007ff06d1210c8>
    capture(&block).to_s
  end

  def yield_block
    yield
  end

  def create_custom_tag
    content_tag(:article, 'foo'.html_safe, class: 'foo', id: 'bar')
  end

end

class TestController < ApplicationController
  def index
    @data = FooBarPresenter.new
  end
end
