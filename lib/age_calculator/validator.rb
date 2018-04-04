class AgeValidator < ActiveModel::EachValidator
  COMPARATORS = { :over => :>=, :under => :<= }.freeze

  def validate_each(record, attribute, value)
    return record.errors.add(attribute, :blank, options) if value.blank?
    return record.errors.add(attribute, :not_date, options) unless value.is_a?(Date)

    age = AgeCalculator.new(value).age(asof: options[:asof])

    options.slice(*COMPARATORS.keys).each do |option_key, option_value|
      unless age.send(COMPARATORS[option_key], option_value.to_i)
        record.errors.add(attribute, :"age_#{option_key}", options.merge(age: option_value))
      end
    end
  end
end
