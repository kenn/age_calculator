class AgeCalculator
  class Railtie < Rails::Railtie
    initializer 'age_calculator.active_model' do |app|
      require 'age_calculator/validator'

      I18n.load_path += AgeValidator.locales
    end
  end
end
