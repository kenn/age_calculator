require 'test_helper'

describe AgeCalculator do
  it 'calculates age from birthday' do
    travel_to Date.new(2014,1,2) do
      ac = AgeCalculator.new Date.new(1996,1,1)
      ac.age.must_equal 18

      ac = AgeCalculator.new Date.new(1996,1,2)
      ac.age.must_equal 18

      ac = AgeCalculator.new Date.new(1996,1,3)
      ac.age.must_equal 17
    end
  end
end
