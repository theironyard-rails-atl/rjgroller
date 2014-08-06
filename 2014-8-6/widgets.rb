
#Take a look at the included `widgets.yml` file. Write a Ruby
#script to find
#
#* The most and least expensive widget
#* The total revenue and profit from all widgets sold
#* The top 10 best selling widgets
#* The number of widgets sold in each department
#
#Read the list of widgets from the YAML file: http://ruby-doc.org/stdlib-1.9.3/libdoc/yaml/rdoc/YAML.html
#Use appropriate methods from Enumerable: http://ruby-doc.org/core-2.1.2/Enumerable.html (lists are Enumerable!)
#
require 'yaml'

class WidgetStats
  include Enumerable

  attr_reader :data

  def initialize
    @data = YAML.load_file('widgets.yml')
  end

  def each
    @data.each { |widget| yield widget }
  end

  def max_price
    @data.max_by { |widget| widget[:price] }
  end

  def min_price
    @data.min_by { |widget| widget[:price] }
  end

  def max_revenue
    @data.collect { |widget| widget[:price] * widget[:sold] }.reduce(:+)
  end

  def max_profit
    @data.collect { |widget| (widget[:price] - widget[:cost_to_make]) * widget[:sold] }.reduce(:+)
  end

  def top10
    @data.sort_by { |widget| widget[:sold] }.reverse.first(10)
  end

  def units_sold_per_dept
    @data.chunk { |widget| widget[:department] }.each { |widget| widget[:sold] }
  end

end

