class RailsPresenter::Base
  include Sprockets::Rails::Helper
  # this could eventually work but would be against the presenter pattern.
  #def render(*args)
  #  ActionView::Base.new.render(*args)
  #end
end
