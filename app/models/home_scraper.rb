require 'nokogiri'
require 'open-uri'

class HomeScraper
  attr_reader :url, :data

  def initialize(url)
    @url = url
  end

  def get_items(klass)
    data.css(klass)
  end

  def data
    @data ||= Nokogiri::HTML(open(url))
  end


end
