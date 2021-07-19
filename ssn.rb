require 'date'

PATTERN = /^(?<gender>[1-2])\s?(?<year>\d{2})\s?(?<month>[01][0-9])\s?(?<department>\d{2})/

DEPARTMENTS = {
  '75' => "Paris",
  '76' => "Seine-Maritime",
  '37' => "Indre-et-Loire"
}

def ssn_info(ssn)
  match = ssn.match(PATTERN)

  gender = match[:gender] == '1' ? 'A man' : 'A woman'
  year = match[:year]
  month = Date::MONTHNAMES[match[:month].to_i]
  department = DEPARTMENTS[match[:department]]

  return "#{gender}, born in #{month}, #{year} in #{department}"
  # return => "a man, born in December, 1984 in Seine-Maritime."
end

def ssn_valid?(ssn)
  ssn_without_key = ssn.gsub(/\s/, '')[0..-3].to_i
  key = ssn.gsub(/\s/, '')[13..14].to_i
  
  #  remainder of the division of (97 - ssn_without_key) by 97.)
  
  return (97 - ssn_without_key) % 97 == key
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