# Define Musher class such that Musher.new("+").mush(["array", "of", "strings"]) == "array + of + strings"

class Musher
  def initialize(sep)
    @sep = sep
  end

  def mush(arr)
    arr.join(" #{@sep} ")
  end
end
