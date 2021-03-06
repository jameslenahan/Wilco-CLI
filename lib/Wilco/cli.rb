
class Wilco::CLI

  def call
    Wilco::Scraper.scrape
    openingmsg
    list_items
    menu
  end

  def openingmsg
    puts "Welcome to the Wilco concert scraper! To see a list of upcoming Wilco shows please type in 'list'"
    puts "To exit, type exit."
  end

  def list_items
    input = gets.strip
    if input == "list"
      puts ""
      items = Wilco::Concerts.all
      items.each.with_index(1) {|item, index| puts "#{index}. #{item.name}"}
    elsif input == "exit"
      system "clear"
      exit
    else
      puts ""
      puts "Try another number listed above!"
      list_items
    end
  end

  def menu
    puts ""
    puts "Please select the concert number you wish to see."
    input = gets.strip

    if Wilco::Concerts.valid_number?(input)
      items_choice = Wilco::Concerts.find_by_index(input.to_i - 1)
      puts ""
      puts "The greatest band in the world will be gracing the following stages:"
      puts ""
      puts "#{items_choice.name}"
      puts "#{items_choice.date}"
      puts "For tickets and more information, please visit:"
      puts "#{items_choice.concert_URL}"
      puts ""
      menu

    elsif
      input == "exit"
      puts ""
      puts "Thanks for checking out this awesome scraper!"
      puts ""
      system "clear"
    else
      puts "Unfortunately, Wilco does not have that many upcoming shows. Please try again!"
      puts "Enter either 'exit' to exit, or the corresponding number to a show above."
      menu
    end
  end
end