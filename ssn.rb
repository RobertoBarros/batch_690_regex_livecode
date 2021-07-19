require 'date'

PATTERN = //

DEPARTMENTS = {
  '75' => "Paris",
  '76' => "Seine-Maritime",
  '37' => "Indre-et-Loire"
}

def ssn_info(ssn)
  return '????'

  # return => "a man, born in December, 1984 in Seine-Maritime."
end

def ssn_valid?(ssn)
  return false
end


numbers = [
  "1 84 12 76 451 089 46", #valid
  "194073765893575",
  "2 19 10 75 114 511 60", #valid
  "123",
  "6 86 10 75 114 511 75"
]
numbers.each do |number|
  if ssn_valid?(number)
    puts "#{number} => #{ssn_info(number)}"
  else
    puts "#{number} is invalid"
  end
end