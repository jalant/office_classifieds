require 'open-uri'
require 'nokogiri'
require 'watir'

def populate_data
  pages = generate_pages
  office_data_file = File.open('office_data.txt', 'w')
  office_images_file = File.open('office_image_data.txt', 'w')
  office_data_file.write('address*unit*neighborhood*space_type*rent_type*size*price\n')
  generate_pages.each do |page|
    site = open(page)
    doc = Nokogiri::HTML(site)
    p img_list = get_imgs(doc)
    p address = "#{get_address(doc)}, #{get_address_2(doc)}"
    p unit = get_unit(doc)
    p neighborhood = get_neighborhood(doc)
    p space_type = get_space_type(doc)
    p rent_type = get_rent_type(doc)
    p size = get_size(doc)
    p price = get_price(doc)
    office_data_file.write address + "*" + unit + "*" + neighborhood + "*" + space_type + "*" + rent_type + "*" + size + "*" + price + "\n"
    office_images_file.write img_list.join('*') + "\n"
  end
  office_data_file.close
  office_images_file.close
end

def generate_pages
  neighborhood_pages = ['http://42floors.com/ny/new-york/manhattan/flatiron', 'http://42floors.com/ny/new-york/manhattan/midtown-east', 'http://42floors.com/ny/new-york/manhattan/financial-district', 'http://42floors.com/ny/new-york/manhattan/gramercy', 'http://42floors.com/ny/new-york/manhattan/upper-west-side', 'http://42floors.com/ny/new-york/manhattan/harlem']
  all_links = []
  neighborhood_pages.each do |page|
    browser = Watir::Browser.new
    browser.goto page
    doc = Nokogiri::HTML(browser.html)
    browser.close
    links = get_links(doc)
    all_links += links
  end
  all_links
end

def get_links(doc)
  links_list = []
  doc.css('a.list-item').each do |item|
    links_list << 'http://42floors.com' + item['href']
  end
  links_list
end

def get_imgs(doc)
  img_list = []
  doc.css('.slide img').each do |img|
    img_list << img['src']
  end
  img_list.reject { |img| img.include? "google" }[0..-2]
end

def get_address(doc)
  begin
    doc.css('.title-address').first.content
  rescue
    ''
  end
end

def get_address_2(doc)
  begin
    doc.css('.address').first.content.gsub(/\s{2,}/, ' ')
  rescue
    ''
  end
end

def get_unit(doc)
  begin
    doc.css('.title-unit').first.content.gsub(', ', '')
  rescue
    ''
  end
end

def get_neighborhood(doc)
  doc.css('.address').first.content.split(',')[0].match(/\w+/).to_s
end

def get_space_type(doc)
  doc.css('.space-type').first.content
end

def get_rent_type(doc)
  begin
    doc.css('.listing-type').first.content
  rescue
    ''
  end
end

def get_size(doc)
  begin
    doc.css('.size .value').first.content
  rescue
    ''
  end
end

def get_price(doc)
  begin
    doc.css('.dropdown-rate span').first.content
  rescue
    ''
  end
end

populate_data
