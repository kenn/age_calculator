class AgeCalculator
  class Railtie < Rails::Railtie
    initializer 'age_calculator.active_model' do |app|
      require 'age_calculator/validator'

      locale_path = Dir.glob(File.expand_path('../../../config/locales/*.yml', __FILE__))
      I18n.load_path += locale_path unless I18n.load_path.include?(locale_path)
    end
  end
end
