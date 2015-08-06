require 'byebug'

class Fixnum

ONES = %w(one  two  three
          four  five  six
          seven  eight  nine)

TEENS = %w(eleven  twelve  thirteen
           fourteen  fifteen  sixteen
           seventeen  eighteen  nineteen)

TENS = %w(ten  twenty  thirty
          forty  fifty  sixty
          seventy  eighty  ninety)

MAGNITUDE = %w(hundred thousand million
               billion trillion)

  def in_words
    return 'zero' if self == 0

    num_in_words = ''

    remaining = self

    current = remaining / 1000000000000
    remaining -= current * 1000000000000
    if current > 0
      num_trillions = current.in_words
      num_in_words << "#{num_trillions} trillion"
      num_in_words << " " if remaining > 0
    end

    current = remaining / 1000000000
    remaining -= current * 1000000000
    if current > 0
      num_billions = current.in_words
      num_in_words << "#{num_billions} billion"
      num_in_words << " " if remaining > 0
    end

    current = remaining / 1000000
    remaining -= current * 1000000
    if current > 0
      num_millions = current.in_words
      num_in_words << "#{num_millions} million"
      num_in_words << " " if remaining > 0
    end

    current = remaining / 1000
    remaining -= current * 1000
    if current > 0
      num_thousands = current.in_words
      num_in_words << "#{num_thousands} thousand"
      num_in_words << " " if remaining > 0
    end

    current = remaining / 100
    remaining -= current * 100
    if current > 0
      num_hundreds = current.in_words
      num_in_words << "#{num_hundreds} hundred"
      num_in_words << " " if remaining > 0
    end

    current = remaining / 10
    remaining -= current * 10
    if current == 1 && remaining > 0
      num_in_words << TEENS[remaining - 1]
      current = 0
      remaining = 0
    elsif current > 0
      num_in_words << TENS[current - 1]
      num_in_words << " " if remaining > 0
    end

    num_in_words << ONES[remaining - 1] if remaining > 0

    num_in_words
  end

  # def mag_in_words(current)
  #   exponents = [2,3,6,9,12]
  #   exponents.each_with_index {
  #     |exp, i| idx = i if current / (10 ** exp) > 0 }
  #   MAGNITUDE[idx] if current >= 100
  # end

  #   current = current / (10 ** exponents[idx])
  #   if current > 0
  #     num = current.in_words
  #     num_in_words << "#{num} #{mag_in_words}"
  #     num_in_words << " " if remaining > 0
  #   end
  #   num_in_words
  # end
end

# debugger
# 1000000000000.in_words
