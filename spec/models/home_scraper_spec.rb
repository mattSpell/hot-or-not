RSpec.describe HomeScraper, :type => :model do
  describe 'scrape the interwebs', vcr: true do
    it 'should return all the homes on the page', :vcr, record: :new_episodes do
      VCR.use_cassette('should_return_all_the_homes_on_the_page') do
        response = Net::HTTP.get_response(URI('http://www.homefinder.com/TN/Nashville/'))
        expect(response.body).to include("homefinder.com")
      end
    end
  end
end
