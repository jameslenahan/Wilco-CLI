
class Wilco::Item
  attr_accessor :name, :date, :product_URL

  @@all = []

  def initialize(name, date, product_URL)
    @name = name
    @date = date
    @product_URL = product_URL
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_index(index)
    @@all[index]
  end
end