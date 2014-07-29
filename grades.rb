# * Write a method `grade` that takes in a numerical grade 1-100 and
#    prints out the letter version of it.
# * Write a function that produces an array of random scores:
#    `students(5) = [88, 93, 91, 73, 97]`
# * Compute the grades for a class of 25 students. Write a function to
#   determine how many A's there were.

$student_scores = []
$student_grades = []

def grade(num)
  case num
  when 90..100
    puts "A"
    return "A"
  when 80..89
    puts "B"
    return "B"
  when 70..79
    puts "C"
    return "C"
  when 60..69
    puts "D"
    return "D"
  else
    puts "F"
    return "F"
  end
end

def create_scores(num)
  $student_scores = num.times.map { Random.rand(100) }
end

def compute_grades
  $student_grades.clear
  $student_scores.each { |score| $student_grades << grade(score) }
end

def count_letter_grade(letter)
  $student_grades.count(letter.capitalize)
end
