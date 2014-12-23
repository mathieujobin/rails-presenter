This will become the home of my Rails Presenter

it should ease the pain of creating a presenter that requires to access Rails helper methods

* it should be able to call rails render method for partials 
* it should be able to use capture(&block).to_s 
* it should be able to use helper methods such as content_tag 
* when using image_tag, it should be able to find content in app/assets 

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

