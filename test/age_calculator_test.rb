require 'test_helper'

describe AgeCalculator do
  it 'calculates age from birthday' do
    travel_to Date.new(2018,1,2) do
      ac = AgeCalculator.new Date.new(2000,1,1)
      ac.age.must_equal 18

      ac = AgeCalculator.new Date.new(2000,1,2)
      ac.age.must_equal 18

      ac = AgeCalculator.new Date.new(2000,1,3)
      ac.age.must_equal 17
    end
  end

  it 'calculates age based on a given date' do
    ac = AgeCalculator.new Date.new(2000,1,2)

    ac.age(asof: Date.new(2018,1,1)).must_equal 17
    ac.age(asof: Date.new(2018,1,2)).must_equal 18
    ac.age(asof: Date.new(2018,1,3)).must_equal 18
  end

  it 'raises an error with an invalid date' do
    error = -> { AgeCalculator.new nil }.must_raise ArgumentError
    error.message.must_match(/nil is not a date/)
  end
end
