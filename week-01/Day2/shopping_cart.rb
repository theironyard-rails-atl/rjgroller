class ShoppingCart

@@products = {
  tv: 300,
  router: 50,
  cable: 10
}

  def initialize
    @contents = Array.new
    @prices = Array.new
    @discount = 0.9
    @tax_rate = 0.92
  end

  def add_to_cart(item)
    if @@products.has_key?(item.to_sym)
      @contents << item
    else
      puts "We don't carry #{item} just tv, router, and cable" #{@@products.each_key {|key| puts key}}"
    end
  end

  def remove_from_cart(item)
    if @contents.include?(item)
      @contents.delete_at(@contents.index(item))
    else
      puts "#{item.capitalize} is not in your cart."
    end
  end

def calc_prices
  @contents.each do |item|
    @prices << @@products[item.to_sym]
  end
end

  def checkout
    calc_prices
    total = @prices.reduce(:+)
    if total >= 100
      total *= @discount
    end
    total *= @tax_rate
    puts = "Your total is #{total}"
  end

end
