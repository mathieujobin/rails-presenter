class FooBarPresenter
  def initialize
  end

  def display_image
    image_tag('image.png')
  end

  def render_partial
    render('partial/part', title: 'text')
  end

  def capture_block(&block)
    capture(&block).to_s
    yield
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
