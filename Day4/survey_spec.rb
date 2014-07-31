require "minitest/autorun"
require "./survey.rb"

describe(Survey) do

  before do
    current_survey = Survey.new
  end

  after do
    current_survey.destroy!
  end

  it "asks questions"

  it "displays a list of possible choices"

  it "collects answers"

  it "correctly calculates average"

  it "displays statitics upon completion"

end
