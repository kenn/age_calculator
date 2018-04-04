require 'date'
require 'age_calculator/version'
require 'age_calculator/railtie' if defined?(Rails)

class AgeCalculator
  def initialize(birthday)
    @birthday = birthday

    unless @birthday.is_a?(Date)
      fail ArgumentError, "#{@birthday.inspect} is not a date"
    end
  end

  def age(asof: nil)
    ((asof || today).strftime('%Y%m%d').to_i - @birthday.strftime('%Y%m%d').to_i) / 10000
  end

  def today
    Time.respond_to?(:zone) ? Time.zone.today : Date.today
  end
end
