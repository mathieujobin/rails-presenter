require "spec_helper"

RSpec.describe TestController, :type => :controller do
  render_views

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response.class).to eq ActionController::TestResponse
      expect(response).to be_success
      expect(response.status).to eq 200
      expect(response.body).to match 'something'
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    context 'the controller uses the RailsPresenter gem' do
      context 'when using render for partials' do
        it 'should call render on the view object for the partial' do
          #TODO: check also .with('partial/part', title: 'text')
          expect_any_instance_of(ActionView::Renderer).to receive(:render).at_least(:once)
          get :index
        end
        it 'should render the partial, along with the view and the layout' do
          get :index
          expect(response).to render_template("partial/_part")
          expect(response).to render_template("test/index")
          expect(response).to render_template("layouts/application")
        end
        it 'should return the content of the partial' do
          get :index
          expect(response.body).to match %r{This is the partial part}
        end
      end
      context 'when using capture(&block).to_s' do
        it 'should return the content of the captured content' do
          get :index
          expect(response.body).to match /captured content/
        end
      end
      context 'when using yield' do
        it 'should return the content of the yielded content' do
          get :index
          expect(response.body).to match /yielded content/
        end
      end
      context 'when using rails helper methods such as content_tag' do
        it 'should generate the tag properly' do
          get :index
          expect(response.body).to match %r{article class=["']foo["'] id=["']bar["']}
        end
      end
      context 'when using rails asset helpers such as image_tag' do
        it 'should find the image within the app/assets sub directory' do
          get :index
          expect(response.body).to match '<img alt="Image" src="/assets/image.png" />'
        end
      end
    end
  end
end
