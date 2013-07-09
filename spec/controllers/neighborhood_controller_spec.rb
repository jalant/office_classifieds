require 'spec_helper'

describe NeighborhoodsController do
  describe 'GET #index' do
    it 'gets all of the neighborhoods' do
      neighborhood = create(:neighborhood)
      neighborhood_2 = create(:neighborhood_2)
      neighborhood_3 = create(:neighborhood_3)
      get :index
      assigns(:neighborhoods).should include(neighborhood, neighborhood_2, neighborhood_3)
    end

    it 'renders the index view' do
      get :index
      response.should render_template :index
    end
  end
end
