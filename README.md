RailsPresenter::Base
===============================================

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
  def to_html(&block)

    out = ''
    out << render('layouts/partial', title: 'text')
    out << content_tag(:article, capture(&block).to_s, class: 'content-wrapper')
    out << image_tag('test.png')

    content_tag(:div, out.html_safe, class: options[:class], id: options[:id])
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
