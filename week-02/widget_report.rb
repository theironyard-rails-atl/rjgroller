require 'yaml'
require './widgets.rb'

class WidgetReport
  include Enumerable

  attr_reader :raw_data, :widget, :grouped_by_dept

  def initialize(fname)
    @raw_data = YAML.load_file(fname)
    @widgets = @raw_data.map { |widget| Widget.new(widget) }
    @grouped_by_dept = @widgets.group_by { |widget| widget.department } 
    # @raw_data = YAML.load_file('widgets.yml')
  end

  def units_sold_per_dept
    @grouped_by_dept.each do |dept, widget|  
      @widgets.reduce(0) do |sum, widget|
        sum + widget.sold
      end
    end
  end

  def each
    @raw_data.each { |widget| yield widget }
  end

  def max_price
    @raw_data.max_by { |widget| widget[:price] }
  end

  def min_price
    @raw_data.min_by { |widget| widget[:price] }
  end

  def max_revenue
    @raw_data.collect { |widget| widget[:price] * widget[:sold] }.reduce(:+)
  end

  def max_profit
    @raw_data.collect { |widget| (widget[:price] - widget[:cost_to_make]) * widget[:sold] }.reduce(:+)
  end

  def top10
    @raw_data.sort_by { |widget| widget[:sold] }.reverse.first(10)
  end

end

# for each deptartment key in department get the units sold for each widget and sum them to get the total.
