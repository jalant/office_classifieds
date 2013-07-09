require 'spec_helper'

describe 'Neighborhood' do
  let(:neighborhood) { create(:neighborhood) } 
  let(:neighborhood_2) { create(:neighborhood_2) } 
  let(:neighborhood_3) { create(:neighborhood_3) } 

  describe 'GET /neighborhoods' do
    it 'displays all of the neighborhoods' do
      neighborhood.reload
      neighborhood_2.reload
      neighborhood_3.reload
      visit neighborhoods_path
      page.should have_selector('div', text: neighborhood.name)
      page.should have_selector('div', text: neighborhood_2.name)
      page.should have_selector('div', text: neighborhood_3.name)
    end

    it 'links to the show page of a neighborhood a user clicks on' do
      neighborhood.reload
      neighborhood_2.reload
      neighborhood_3.reload
      visit neighborhoods_path
      click_link(neighborhood.name)
      current_path.should eq(neighborhood_path(neighborhood))
      visit neighborhoods_path
      click_link(neighborhood_2.name)
      current_path.should eq(neighborhood_path(neighborhood_2))
      visit neighborhoods_path
      click_link(neighborhood_3.name)
      current_path.should eq(neighborhood_path(neighborhood_3))
    end
  end
end
