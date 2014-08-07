class PopQuiz
  attr_accessor :score

  @@questions =
  [
    {
      question: "What is the air speed velocity of an unladen sparrow?",
      choices: [
        "African?",
        "European?",
        "I don't know?",
        "30 km/hr"
      ],
      answer: 2
    },
    {
      question: "Where is Atlanta?",
      choices: [
        "Africa",
        "New York",
        "Canada",
        "Georgia"
      ],
      answer: 3
    },
    {
      question: "Who invented the internet?",
      choices: [
        "Al Gore",
        "DARPA",
        "Martians",
        "The Illuminati"
      ],
      answer: 1
    },
    {
      question: "What is the best movie ever?",
      choices: [
        "Fight Club",
        "Snatch",
        "Inception",
        "Frozen"
      ],
      answer: 0
    },
    {
      question: "Do you really want to hurt me?",
      choices: [
        "yes",
        "no",
        "maybe",
        "I don't know"
      ],
      answer: 1
    }
  ]

  def initialize(score=0)
     @score = score
     @shuffle = @@questions.shuffle
     @ask = Hash.new
  end

  def finished?
    @shuffle.empty?
  end

  def ask_question
    @ask = @shuffle.pop
    @ask[:question]
  end

  def show_choices
    @ask[:choices].each_with_index { |choice, idx| puts "#{idx+1}. #{choice}" }
    puts "Please make a selection: "
  end

  def calculate(input)
    if @ask[:answer] == input
      @score += 1
    end
  end

end
