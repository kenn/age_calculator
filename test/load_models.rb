require 'active_model'
require 'age_calculator/validator'

# Set timezone
require 'active_support/time' # For testing Date and TimeWithZone objects
Time.zone = 'Hawaii'

# Enable travel_to
require 'active_support/testing/time_helpers'
include ActiveSupport::Testing::TimeHelpers

# Locale
I18n.enforce_available_locales = true
I18n.load_path += Pathname.new(__FILE__).dirname.parent.glob('config/locales/*.yml')

class Adult
  include ActiveModel::Validations
  attr_accessor :birthday
  validates :birthday, age: { over: 18 }

  def age(asof: nil)
    AgeCalculator.new(birthday).age(asof: asof)
  end
end

class AdultAllowBlank
  include ActiveModel::Validations
  attr_accessor :birthday
  validates :birthday, age: { over: 18 }, allow_blank: true
end

class AdultAsOf
  include ActiveModel::Validations
  attr_accessor :birthday
  validates :birthday, age: { over: 18, asof: Date.new(2018,1,2) }
end
