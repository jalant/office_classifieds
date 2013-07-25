require 'spec_helper'

describe 'Cities ' do
  before do
    @city = create(:city)
  end

  describe 'GET /cities/:id' do
    it "shows each city"  do
      visit city_path(@city)
      page.should have_content(@city.name)
    end
  end
end
