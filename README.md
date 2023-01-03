# UnitConverter

Этот гем для перевода из метрической системы в имерскую и обратно. Его можно использовать для перевода целого текста сразу.

Пример:

Из метрической в имерскую:

5 liters = 5 quarts (куарты)

12 liters = 3.0 gallons (галлоны)

850 milliliters = 28.33 fl ounces (жидкая унция)

71 kilograms = 157.78 pounds (фунты)

310 grams = 10.33 ounces (унция)

532 centimeters = 212.8 inches (дюймы)

4 meters = 13.11 feet (футы)

Из имерской в метрическую:

7 pounds = 3.15 kilograms

12 ounces = 360.0 grams

2 pints = 1120.0 milliliters

3 quarts = 3.0 liters

50 inches = 125.0 centimeters

20 fl ounces = 600.0 grams

6 feet = 1.83 meters

3 pounds = 1.35 kilograms

# Примеры программ:

Пример 1:
```ruby
tt3="Информация 53 milliliters  была метрическая система 12 крокодилов 21 kilograms"

  puts tt3
  
  puts '>>>'
  
  metric=Converter.new(tt3)
  
  tt4=metric.find_and_replace_metric_units()
  
  puts tt4 #metric.print_text
  ```
  
  Результат программы: 
  
  Информация 53 milliliters  была метрическая система 12 крокодилов 21 kilograms >>> Информация 1.77 fl ounces была метрическая система 12 крокодилов 46.67 pounds

  Пример 2:
  ```ruby
  tt5="7 слонов 1 floz 210 feet 23 pounds вес и 10 ounce была имперская система"
  
  puts tt5
  
  puts '>>>'
  
  imperial=Converter.new(tt5)
  
  tt6=imperial.find_and_replace_imperial_units()
  
  puts tt6
  ```
  Результат программы: 
  
  7 слонов 1 floz 210 feet 23 pounds вес и 10 ounce была имперская система >>> 7 слонов 30.0 milliliters 64.22 meters 10.35 kilograms вес и 300.0 grams была имперская систем

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'UnitConverter'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install UnitConverter

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
