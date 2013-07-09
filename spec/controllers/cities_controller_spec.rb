require 'spec_helper'

describe CitiesController do

  describe 'member' do
    let(:city) {create(:city)}
   
    describe 'GET #show' do
      before do
        get :show, id: city
      end
      it 'shows a particular city' do
        city.reload
        assigns(:city).should eq city
      end
      it 'renders the :show view' do
        response.should render_template :show
      end
    end
  end

end
