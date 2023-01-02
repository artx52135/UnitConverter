# frozen_string_literal: true

require_relative "UnitConverter/version"

# frozen_string_literal: true
class Converter
  #attr_accessor text: String

  def initialize(ttt)
    @text = ttt.to_s
  end

  def print_text
    return @text
  end
  def self.format_decimal(number)
    num = number.round(2) #(number.to_f * 100).to_i / 100.0
    return num.to_s
  end



  def find_and_replace_imperial_units
    if(!@text)
      return ''
    end
    reg_imperial = /(\d*\s((lb|pound)(|s))|(\d*\s(oz|ounce(|s)))|(\d*\s(pint(|s)))|(\d*\s(quart(|s)))|(\d*\s(gallon(|s)))|(\d*\s(f(oo|ee)t))|(\d*\s(inch(|es))))(?=\b)/
    words_array=@text.scan(/[[:word:]]+/)
    size=words_array.size

    (0..size - 2).each { |i|
      if (/^[0-9]*[.,]?[0-9]+$/.match?(words_array[i]))
        pair = words_array[i] + ' ' + words_array[i + 1]
        if (pair.match(reg_imperial) != nil)
          words_array[i] = Converter.replace_imperial_units(pair)
          size -= 1
          words_array.delete_at(i + 1)
        end
      end
    }
    text_new=words_array.join(" ")
    text_new
  end

  def find_and_replace_metric_units
    if(!@text)
      return ''
    end
    reg_metric = /(\d*\s(milliliter(|s))|\d*\s(liter(|s))|\d*\s(kilogram(|s))|\d*\s(gram(|s))|\d*\s(centimeter(|s))|\d*\s(meter(|s)))(?=\b)/
    words_array=@text.scan(/[[:word:]]+/)
    size=words_array.size

    (0..size - 2).each { |i|
      if (/^[0-9]*[.,]?[0-9]+$/.match?(words_array[i]))
        pair = words_array[i] + ' ' + words_array[i + 1]
        if (pair.match(reg_metric) != nil)
          words_array[i] = Converter.replace_metric_units(pair)
          size -= 1
          words_array.delete_at(i + 1)
        end
      end
    }

    text_new=words_array.join(' ')
    text_new
  end





  def self.replace_metric_units(match_str)
    if(!match_str)
      return ""
    end
    rl =  /\d*\sliter(|s)/
    rml = /\d*\smilliliter(|s)/
    rk =  /\d*\skilogram(|s)/
    rgr = /\d*\sgram(|s)/
    rcm = /\d*\scentimeter(|s)/
    rm = /\d*\smeter(|s)/


    number =  (match_str.match(/[0-9]*[.,]?[0-9]+/)).to_s() #(match_str.match(/\d*/)).to_s
    rez=''
    case #match_str
    when match_str.match(rl)
      if (number.to_i % 4 == 0)
      then rez=  match_str.gsub(match_str, (number.to_f * 0.25).to_s + ' gallons')
      else
        rez= match_str.gsub(match_str, number + ' quarts')
      end

    when match_str.match(rml)
    then rez= match_str.gsub(match_str, format_decimal(number.to_f / 30.0) + ' fl ounces')  #жидкая унция
    when match_str.match(rk)
    then rez= match_str.gsub(match_str, format_decimal(number.to_f / 0.45) + ' pounds')
    when match_str.match(rgr)
    then rez= match_str.gsub(match_str, format_decimal(number.to_f / 30.0) + ' ounces')
    when match_str.match(rcm)
    then rez= match_str.gsub(match_str, format_decimal(number.to_f / 2.5) + ' inches')
    when match_str.match(rm)
    then rez= match_str.gsub(match_str, format_decimal(number.to_f * 100 / 30.5) + ' feet')
    end
    rez #match_str
  end


  def self.replace_imperial_units(match_str)
    if(!match_str)
      return ""
    end

    rlb = /\d*\s(lb|pound)(|s)/
    roz = /\d*\s(oz|ounce(|s))/
    rp =  /\d*\spint(|s)/
    rq =  /\d*\squart(|s)/
    rg =  /\d*\sgallon(|s)/
    ri =  /\d*\sinch(|es)/
    rflu =  /\d*\s(fl oz|fl ounce(|s))/
    rft=/\d*\s(f(oo|ee)t)/

    number = (match_str.match(/[0-9]*[.,]?[0-9]+/)).to_s() #/\d*/)).to_s()
    rez=''
    case #match_str
    when match_str.match(rlb)
    then if(number.to_f*450 > 1000)
           rez= match_str.gsub(match_str, format_decimal(number.to_f * 0.45) +' kilograms')
         else
           rez= match_str.gsub(match_str, format_decimal(number.to_f * 450) +' grams')
         end
    when match_str.match(roz)
    then rez= match_str.gsub(match_str, format_decimal(number.to_f * 30) + ' grams')
    when match_str.match(rp)
    then rez= match_str.gsub(match_str, format_decimal(number.to_f * 560)+' milliliters')
    when match_str.match(rq)
    then rez= match_str.gsub(match_str, format_decimal(number.to_f) +' liters')
    when match_str.match(rg)
    then rez= match_str.gsub(match_str, format_decimal(number.to_f * 4) +' liters')
    when match_str.match(ri)
    then rez= match_str.gsub(match_str, format_decimal(number.to_f * 2.5) +' centimeters')
    when match_str.match(rflu)
    then rez= match_str.gsub(match_str, format_decimal(number.to_f * 30.0) +' milliliters')
    #else rez= match_str
    when match_str.match(rft)
    then rez= match_str.gsub(match_str, format_decimal(number.to_f / 3.27) +' meters')
    end
    rez
  end





  pp = Converter.new("5 pounds")

  puts "5 liters" + ' >>> ' + replace_metric_units("5 liters")
  puts "12 liters" + ' >>> ' + replace_metric_units("12 liters")
  puts "100 milliliters" + ' >>> ' + replace_metric_units("100 milliliters")
  puts "18 kilograms" + ' >>> ' + replace_metric_units("18 kilograms")
  puts "500 grams" + ' >>> ' + replace_metric_units("500 grams")
  puts "98 centimeters" + ' >>> ' + replace_metric_units("98 centimeters")
  puts "2 meters" + ' >>> ' + replace_metric_units("2 meters")
  puts ""
  puts "5 pounds" + ' >>> ' + replace_imperial_units("5 pounds")
  puts "10 ounces" + ' >>> ' + replace_imperial_units("10 ounces")
  puts "0.5 pints" + ' >>> ' + replace_imperial_units("0.5 pints")
  puts "3 quarts" + ' >>> ' + replace_imperial_units("3 quarts")
  puts "50 inches" + ' >>> ' + replace_imperial_units("50 inches")
  puts "20 fl ounces" + ' >>> ' + replace_imperial_units("20 fl ounces")
  puts "6 feet" + ' >>> ' + replace_imperial_units("6 feet")

  tt0="3 pounds"
  tt=replace_imperial_units(tt0)
  puts tt0+' >>> '+tt


  tt3="5 milliliters 3 liters  была метрическая система 12 крокодилов 20 kilograms"
  puts tt3
  puts '>>>'
  metric=Converter.new(tt3)
  tt4=metric.find_and_replace_metric_units()
  puts tt4#metric.print_text

  tt5="5 веников 20 feet 5 pounds 1 ounce была имперская система"
  puts tt5
  puts '>>>'
  imperial=Converter.new(tt5)
  tt6=imperial.find_and_replace_imperial_units()
  puts tt6

  puts "end"
end