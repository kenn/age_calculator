require 'date'
require 'age_calculator/version'
require 'age_calculator/railtie' if defined?(Rails)

class AgeCalculator
  def initialize(birthday)
    @birthday = birthday
  end

  def age
    return unless @birthday
    (today.strftime('%Y%m%d').to_i - @birthday.strftime('%Y%m%d').to_i) / 10000
  end

  def today
    Time.respond_to?(:zone) ? Time.zone.today : Date.today
  end
end
