# AgeCalculator

A simple age calculator for Ruby. Comes with age validator for ActiveModel.

# Background

You might think calculating age from a birthday is easy, but you'd be wrong - there is [so](https://www.ruby-forum.com/topic/49265) [much](http://stackoverflow.com/questions/10463400/age-calculation-in-ruby) [confusion](http://stackoverflow.com/questions/819263/get-persons-age-in-ruby) on the topic, and sadly, many people are doing it wrong. Even right ways can look really complicated.

Here's the simplest, cleanest way:

```ruby
(today.to_s(:number).to_i - birthday.to_s(:number).to_i) / 10000
```

Suppose today is May 16, 2014 and calculate the age of people whose birthdays are May 15, 1996 (should be 18 years old) and May 17, 1996 (should be 17 years old) respectively.

```ruby
> 20140516 - 19960517
 => 179999
> 179999 / 10000
 => 17
> 20140516 - 19960515
 => 180001
> 180001 / 10000
 => 18
```

Couldn't be simpler. Note that Ruby truncates the decimal fraction.

## Installation

Add this line to your application's Gemfile:

```
gem 'age_calculator'
```

Or install it yourself as:

```
$ gem install age_calculator
```

## Usage

For a basic usage:

```ruby
birthday = Date.new(1987,12,31)

AgeCalculator.new(birthday).age
 => 26
```

For a model with a validation on the age:

```ruby
class Adult < ActiveRecord::Base
  validates :birthday, age: { over: 18 }

end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/age_calculator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
