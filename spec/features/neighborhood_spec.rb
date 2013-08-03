require 'spec_helper'

describe 'Neighborhoods' do
  let(:neighborhood) { create(:neighborhood) } 
  let(:neighborhood_2) { create(:neighborhood_2) } 
  let(:neighborhood_3) { create(:neighborhood_3) } 
  let(:city) { create(:city) }

  describe 'GET cities/:city_id/neighborhoods' do
    it 'displays all of the neighborhoods' do
      neighborhood.reload
      neighborhood_2.reload
      neighborhood_3.reload
      city.reload
      p "NEIGHBORHOODS PATH"
      p city_neighborhoods_path(city_id: city.id)
      visit city_neighborhoods_path(city_id: city.id)
      page.should have_selector('div', text: neighborhood.name)
      page.should have_selector('div', text: neighborhood_2.name)
      page.should have_selector('div', text: neighborhood_3.name)
    end

    it 'links to the show page of a neighborhood a user clicks on' do
      neighborhood.reload
      neighborhood_2.reload
      neighborhood_3.reload
      city.reload
      visit city_neighborhoods_path(city_id: city.id)
      click_link(neighborhood.name)
      current_path.should eq(neighborhood_office_listings_path(neighborhood_id: neighborhood.id))
      visit city_neighborhoods_path(city_id: city.id)
      click_link(neighborhood_2.name)
      current_path.should eq(neighborhood_office_listings_path(neighborhood_id: neighborhood_2.id))
      visit city_neighborhoods_path(city_id: city.id)
      click_link(neighborhood_3.name)
      current_path.should eq(neighborhood_office_listings_path(neighborhood_id: neighborhood_3.id))
    end
  end
end
