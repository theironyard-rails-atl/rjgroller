class Widget
  attr_reader :name, :color, :department, :price, :cost_to_make, :sold

  def initialize(hash)
    @name = hash[:name]
    @color = hash[:color]
    @department = hash[:department]
    @price = hash[:price]
    @cost_to_make = hash[:cost_to_make]
    @sold = hash[:sold]
  end

  def to_s
    @name
  end

  def to_s_long
    "Name: #{@name}, Color: #{@color}, Department: #{@department}, Price: #{@price}, Cost To Make: #{@cost_to_make}, Sold: #{@sold}"
  end
end
