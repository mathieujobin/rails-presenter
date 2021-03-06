RailsPresenter::Base
===============================================

  - [![Gem Version](https://badge.fury.io/rb/rails-presenter.svg)](http://badge.fury.io/rb/rails-presenter)
  - [![Quality](http://img.shields.io/codeclimate/github/mathieujobin/rails-presenter.svg?style=flat-square)](https://codeclimate.com/github/mathieujobin/rails-presenter)
  - [![Coverage](http://img.shields.io/codeclimate/coverage/github/mathieujobin/rails-presenter.svg?style=flat-square)](https://codeclimate.com/github/mathieujobin/rails-presenter)
  - [![Build](http://img.shields.io/travis-ci/mathieujobin/rails-presenter.svg?style=flat-square)](https://travis-ci.org/mathieujobin/rails-presenter)
  - [![Build Status](https://travis-ci.org/mathieujobin/rails-presenter.svg)](https://travis-ci.org/mathieujobin/rails-presenter)
  - [![Dependencies](http://img.shields.io/gemnasium/mathieujobin/rails-presenter.svg?style=flat-square)](https://gemnasium.com/mathieujobin/rails-presenter)
  - [![Downloads](http://img.shields.io/gem/dtv/rails-presenter.svg?style=flat-square)](https://rubygems.org/gems/rails-presenter)
  - [![Tags](http://img.shields.io/github/tag/mathieujobin/rails-presenter.svg?style=flat-square)](http://github.com/mathieujobin/rails-presenter/tags)
  - [![Releases](http://img.shields.io/github/release/mathieujobin/rails-presenter.svg?style=flat-square)](http://github.com/mathieujobin/rails-presenter/releases)
  - [![Issues](http://img.shields.io/github/issues/mathieujobin/rails-presenter.svg?style=flat-square)](http://github.com/mathieujobin/rails-presenter/issues)
  - [![Version](http://img.shields.io/gem/r/rails-presenter.svg?style=flat-square)](https://rubygems.org/gems/rails-presenter)

it should ease the pain of creating a presenter that requires to access Rails helper methods

* it should be able to call rails render method for partials
* it should be able to use capture(&block).to_s
* it should be able to use helper methods such as content_tag
* when using image_tag, it should be able to find content in app/assets

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails-presenter'
```

And then execute:

    $ bundle

## Usage

```ruby
class ExamplePresenter < RailsPresenter::Base

  # This is important, you need to call super, for the asset pipeline to work.
  def initialize
    super()
  end

  def example_image_from_the_pipeline
    image_tag('image.png')
  end

  def example_render_partial(view)
    view.render('partial/part', title: 'text')
  end

  def example_yield_content
    yield
  end

  def example_content_tag
    content_tag(:article, 'foo'.html_safe, class: 'foo', id: 'bar')
  end

end
```

## Contributing

1. Fork it ( https://github.com/somekool/rails-presenter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Carefully look at your changes (`git diff`)
4. Individually stage files (`git add`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
