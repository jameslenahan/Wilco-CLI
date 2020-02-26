class Wilco::Scraper

  def self.scrape
    doc = Nokogiri::HTML(open("https://wilcoworld.net/shows/"))

    doc.css("div.show-item").each do |concert|
      name = concert.css("div.segment.name").text.gsub('request song', '').gsub('ALMOST SOLD OUT', '')
      date = concert.css("div.segment.date").text
      product_URL = concert.css("div.segment.info a").attr("href").text
      Wilco::Item.new(name, date, product_URL)
    end
  end
end


