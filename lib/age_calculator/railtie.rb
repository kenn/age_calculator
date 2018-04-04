class AgeCalculator
  class Railtie < Rails::Railtie
    initializer 'age_calculator.active_model' do |app|
      require 'age_calculator/validator'

      I18n.load_path += Pathname.new(__FILE__).dirname.parent.parent.glob('config/locales/*.yml')
    end
  end
end
