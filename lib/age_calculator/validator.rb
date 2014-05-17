class AgeValidator < ActiveModel::EachValidator
  COMPARATORS = { :over => :>=, :under => :<= }.freeze

  def validate_each(record, attribute, value)
    unless value.is_a?(Date)
      return record.errors.add(attribute, :not_date, options)
    end

    age = AgeCalculator.new(value).age

    options.slice(*COMPARATORS.keys).each do |option_key, option_value|
      unless age.send(COMPARATORS[option_key], option_value.to_i)
        record.errors.add(attribute, :"age_#{option_key}", options.merge(age: option_value))
      end
    end
  end
end
