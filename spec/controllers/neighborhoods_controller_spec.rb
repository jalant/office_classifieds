require 'spec_helper'

describe NeighborhoodsController do
    describe 'GET #index' do
      it 'gets all of the neighborhoods' do
        neighborhood = create(:neighborhood)
        neighborhood_2 = create(:neighborhood_2)
        neighborhood_3 = create(:neighborhood_3)
        city = create(:city)
        get :index, :city_id => city.id
        assigns(:neighborhoods).should include(neighborhood, neighborhood_2, neighborhood_3)
      end

      it 'renders the index view' do
        city = create(:city)
        get :index, :city_id => city.id
        response.should render_template :index
      end
    describe 'GET #add_listing' do
      it 'assigns all neighborhoods to instance variable' do
        neighborhood = create(:neighborhood)
        neighborhood_2 = create(:neighborhood_2)
        get :add_listing
        assigns(:neighborhoods).should eq([neighborhood, neighborhood_2])
      end

      it 'assigns the current city to an instance variable' do
        city = create(:city2)
        get :add_listing
        assigns(:city).should eq(city)
      end
    end
  end
end
