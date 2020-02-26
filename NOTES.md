
  def self.company2_details
    page = Nokogiri::HTML(open("https://seekingalpha.com"))
    symbol = page.search("//*[@id='page_content_wrapper']/div[2]/div[2]/section[4]/div[3]/span[1]/a").text
    doc = Nokogiri::HTML(open("https://seekingalpha.com/symbol/#{symbol}"))
    company = self.new
    company.name = doc.search("//*[@id='main_content']/div[1]/div[1]/h1").text
    company.dividend = doc.search("//*[@id='quotes-chart-data']/div[5]/span[2]").text
    company.yield = doc.search("//*[@id='quotes-chart-data']/div[6]/span[2]").text
    company.market_cap = doc.search("//*[@id='quotes-chart-data']/div[7]/span[2]").text
    company
  end  def self.company2_details
    page = Nokogiri::HTML(open("https://seekingalpha.com"))
    symbol = page.search("//*[@id='page_content_wrapper']/div[2]/div[2]/section[4]/div[3]/span[1]/a").text
    doc = Nokogiri::HTML(open("https://seekingalpha.com/symbol/#{symbol}"))
    company = self.new
    company.name = doc.search("//*[@id='main_content']/div[1]/div[1]/h1").text
    company.dividend = doc.search("//*[@id='quotes-chart-data']/div[5]/span[2]").text
    company.yield = doc.search("//*[@id='quotes-chart-data']/div[6]/span[2]").text
    company.market_cap = doc.search("//*[@id='quotes-chart-data']/div[7]/span[2]").text
    company
  end

  def self.company3_details
    page = Nokogiri::HTML(open("https://seekingalpha.com"))
    symbol = page.search("//*[@id='page_content_wrapper']/div[2]/div[2]/section[4]/div[4]/span[1]/a").text
    doc = Nokogiri::HTML(open("https://seekingalpha.com/symbol/#{symbol}"))
    company = self.new
    company.name = doc.search("//*[@id='main_content']/div[1]/div[1]/h1").text
    company.dividend = doc.search("//*[@id='quotes-chart-data']/div[5]/span[2]").text
    company.yield = doc.search("//*[@id='quotes-chart-data']/div[6]/span[2]").text
    company.market_cap = doc.search("//*[@id='quotes-chart-data']/div[7]/span[2]").text
    company
  end
  def self.company4_details
    page = Nokogiri::HTML(open("https://seekingalpha.com"))
    symbol = page.search("//*[@id='page_content_wrapper']/div[2]/div[2]/section[4]/div[5]/span[1]/a").text
    doc = Nokogiri::HTML(open("https://seekingalpha.com/symbol/#{symbol}"))
    company = self.new
    company.name = doc.search("//*[@id='main_content']/div[1]/div[1]/h1").text
    company.dividend = doc.search("//*[@id='quotes-chart-data']/div[5]/span[2]").text
    company.yield = doc.search("//*[@id='quotes-chart-data']/div[6]/span[2]").text
    company.market_cap = doc.search("//*[@id='quotes-chart-data']/div[7]/span[2]").text
    company
  end
end



  def self.company_scraper
    page = Nokogiri::HTML(open("https://seekingalpha.com"))
    number = ("2")
    page.each do |number|
      symbol = page.search("//*[@id='page_content_wrapper']/div[2]/div[2]/section[4]/div#{[number]}/span[1]/a")
      doc = Nokogiri::HTML(open("https://seekingalpha.com/symbol/#{symbol}"))
      company = self.new
      doc.each do |company|
        company.name = doc.search("//*[@id='main_content']/div[1]/div[1]/h1").text
        company.dividend = doc.search("//*[@id='quotes-chart-data']/div[5]/span[2]").text
        company.divyield = doc.search("//*[@id='quotes-chart-data']/div[6]/span[2]").text
        company.market_cap = doc.search("//*[@id='quotes-chart-data']/div[7]/span[2]").text
        company
      end
    end
  end
end


    def self.company_scraper
      page = Nokogiri::HTML(open("https://seekingalpha.com"))
            page.take(5).each do |num|
              num = [2, 3, 4, 5, 6]
              symbol = page.search("//*[@id='page_content_wrapper']/div[2]/div[2]/section[4]/div[#{num}]/span[1]/a]")
              symbol.take(5).each do |company|
                company_name = company.search("//*[@id='main_content']/div[1]/div[1]/meta[1]").text
                company_name
          end
        end
    end
    
    class SA_Stocks::Scraper
    
    
      def self.company_scraper
        page = Nokogiri::HTML(open("https://seekingalpha.com"))
        symbol = page.search("//*[@id='page_content_wrapper']/div[2]/div[2]/section[4]/div[3]/span[1]/a").text
        doc = Nokogiri::HTML(open("https://seekingalpha.com/symbol/#{symbol}"))
        company = self.new
        company.name = doc.search("//*[@id='main_content']/div[1]/div[1]/h1").text
        company.dividend = doc.search("//*[@id='quotes-chart-data']/div[5]/span[2]").text
        company.yield = doc.search("//*[@id='quotes-chart-data']/div[6]/span[2]").text
        company.market_cap = doc.search("//*[@id='quotes-chart-data']/div[7]/span[2]").text
        company
      end
    
    
    
        def self.scrape_companies
    
          companies = []
    
          companies << company_scraper
    
          companies
        end
    
        def self.trending
          scrape_companies
        end
    end
    
def self.company_pages
    page = Nokogiri::HTML(open("https://seekingalpha.com/"))
    page.css("symbol_name").each do |doc|
      url = doc.css("a").attribute("href").text
      Nokogiri::HTML(open(url)).each do |link| 
        company = self.new
        company.name = doc.xpath("//*[@id='main_content']/div[1]/div[1]/h1").text
        company.dividend = link.search("//*[@id='quotes-chart-data']/div[5]/span[2]").text
        company.divyield = link.search("//*[@id='quotes-chart-data']/div[6]/span[2]").text
        company.market_cap = link.search("//*[@id='quotes-chart-data']/div[7]/span[2]").text
      end