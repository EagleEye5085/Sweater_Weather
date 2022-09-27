require 'rails_helper'

   RSpec.describe OpenlibraryFacade do
     it 'returns an array books and current weather' do
       VCR.use_cassette('books an current weather') do
         bookweather = OpenlibraryFacade.search_by_location("denver,co", "5")
# binding.pry
         expect(bookweather).to be_a(BookWeather)
         expect(bookweather.id).to eq(nil)
         expect(bookweather.books[0]).to be_a(Book)
         expect(bookweather.books.count).to eq(5)
         expect(bookweather.total_books).to eq(47113)
         expect(bookweather.forcast).to eq({:summary=>"clear sky", :temperature=>"296.9"})
         expect(bookweather.destination).to eq("denver,co")
       end
     end
   end
