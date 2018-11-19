class Item
  attr_accessor :name, :price

  # @@all = []
  #
  # def self.all
  #   @@all
  # end

  def initialize(name,price)
    @name = name
    @price = price
    # @@all << self
  end
end
