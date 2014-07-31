# Will & Robert's attempt at survey questionaire
require "minitest/autorun"
require "./survey.rb"

describe(Survey) do

  it "asks questions" do
    survey = Survey.new
    assert_equal "I would jump out of a plane.", survey.ask_question
  end

  it "isn't finished when it starts" do
    survey = Survey.new
    assert_equal survey.finished?, false
  end

  it "calculates average correctly" do
    survey = Survey.new
    5.times { survey.response("3") }
    assert_equal 3, survey.calc_average
  end
end
