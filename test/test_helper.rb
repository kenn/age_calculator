require 'minitest/autorun'
require 'minitest/spec'
require 'active_model'
require 'age_calculator'
require 'age_calculator/validator'

# Set timezone
require 'active_support/time' # For testing Date and TimeWithZone objects
Time.zone = 'Hawaii'

# Enable travel_to
require 'active_support/testing/time_helpers'
include ActiveSupport::Testing::TimeHelpers

# Locale
I18n.enforce_available_locales = true
I18n.load_path += Dir.glob(File.expand_path('../../config/locales/*.yml', __FILE__))

class Adult
  include ActiveModel::Validations
  attr_accessor :birthday
  validates :birthday, age: { over: 18 }

  def age
    AgeCalculator.new(birthday).age
  end
end
