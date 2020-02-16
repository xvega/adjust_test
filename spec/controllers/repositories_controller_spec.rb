require 'rails_helper'

RSpec.describe RepositoriesController, type: :controller do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it 'renders the js' do
      get :index, xhr: true, params: { search: 'xvega' }
      expect(response).to render_template("index")
    end
  end
end
