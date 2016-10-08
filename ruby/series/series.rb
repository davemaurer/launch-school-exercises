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
    number_collection
  end
end
