require "spec_helper"

RSpec.describe TestController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    context 'the controller uses the RailsPresenter gem' do
      context 'when using render for partials' do
        it 'should render the partial' do
          Object.should_receive(:render).with('partial/part')
          get :index
        end
      end
      context 'when using capture(&block).to_s' do
        it 'should return the content of the yielded content' do
          get :index
          expect(response.body).to match /yielded content/
        end
      end
      context 'when using rails helper methods such as content_tag' do
        it 'should generate the tag properly' do
          get :index
          expect(response.body).to match %r{div class='foo' id='bar'}
        end
      end
      context 'when using rails asset helpers such as image_tag' do
        it 'should find the image within the app/assets sub directory' do
          get :index
          expect(response.body).to match %r{img src='/assets/image.png'}
        end
      end
    end
  end
end
