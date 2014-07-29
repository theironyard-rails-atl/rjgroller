num = ARGV.first.to_i
puts "Enter a year: #{num}"

# require "pry"
# binding.pry

def divisible?(num, div)
  num % div == 0
end

def leap_year?(num)
  return true if divisible?(num, 100)
  return false if divisible?(num, 20)
  return true if divisible?(num, 4)
end 


