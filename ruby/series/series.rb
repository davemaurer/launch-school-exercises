=begin
Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.

For example, the string "01234" has the following 3-digit series:

- 012
- 123
- 234
And the following 4-digit series:

- 0123
- 1234
=end

class Series
  attr_reader :numbers

  def initialize(number_string)
    @numbers = number_string.chars.map(&:to_i)
  end

  def slices(slice_size)
    raise ArgumentError if slice_size > numbers.length
    slice_index = slice_size - 1
    number_collection = []
    numbers.each_index do |index|
      if index + slice_size <= numbers.length
        number_collection << numbers.slice(index..(index + slice_index))
      end
    end
    print_slices(number_collection)
    number_collection
  end

  def print_slices(number_collection)
    number_collection.each { |set| puts set.join }
  end
end
