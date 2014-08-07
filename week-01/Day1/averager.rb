# Define an Averager class that can compute the average of two numbers. Bonus: any number of numbers.

class Averager

  def self.average(*args)
    args.reduce(:+).to_f / args.length
  end

end
