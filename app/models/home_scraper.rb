require 'nokogiri'
require 'open-uri'
class HomeScraper
  attr_reader :url, :data

  def initialize(url)
    @url = url
  end

  def find_homes
    @data ||= Nokogiri::HTML(open(url))
    content_box = @data.
    xpath('//body/div[@id="searchResults"]/section/div[@id="leftColumn"]/div[@class="resultsBands last"]')
    content_box.each do |node|
      img = node.css(".propertyPhoto")[0]["src"]
      price = node.css(".price")[0].children[0].text
      address = node.css(".address").children[1].children[1].children[0].text
      desc = node.css(".propertyType").children.text
      Home.create(photo_url: img, list_price: price, address: address, description: desc)
    end
  end
end
