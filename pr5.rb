class Converter
  def initialize
    @roman_to_int = {
      'I' => 1,
      'IV' => 4,
      'V' => 5,
      'IX' => 9,
      'X' => 10,
      'XL' => 40,
      'L' => 50,
      'XC' => 90,
      'C' => 100,
      'CD' => 400,
      'D' => 500,
      'CM' => 900,
      'M' => 1000
    }
    @int_to_roman = @roman_to_int.invert
  end

  def to_roman(num)
    result = ''
    @int_to_roman.keys.sort.reverse.each do |value|
      while num >= value
        num -= value
        result += @int_to_roman[value]
      end
    end
    result
  end

  def to_int(roman)
    result = 0
    i = 0
    while i < roman.length
      if i + 1 < roman.length && @roman_to_int[roman[i]] < @roman_to_int[roman[i + 1]]
        result += @roman_to_int[roman[i + 1]] - @roman_to_int[roman[i]]
        i += 2
      else
        result += @roman_to_int[roman[i]]
        i += 1
      end
    end
    result
  end
end

loop do
  converter = Converter.new

  puts "Select an operation:"
  puts "( 1 ) - Convert a Roman numeral to an integer"
  puts "( 2 ) - Convert an integer to a Roman numeral"
  vibor = gets.chomp.to_i

  case vibor
  when 1
    puts "Enter a Roman numeral (eg 'MCMXC'): "
    roman_input = gets.chomp.upcase
    puts "The result of conversion to an integer: #{converter.to_int(roman_input)}"
  when 2
    puts "Enter an integer (between 1 and 3999): "
    int_input = gets.chomp.to_i
    if int_input >= 1 && int_input < 4000
      puts "The result of conversion to Roman numerals: #{converter.to_roman(int_input)}"
    else
      puts "Error! The number entered is not in the range 1 to 3999."
    end
  else
    puts "Incorrect choice of operation."
  end
end