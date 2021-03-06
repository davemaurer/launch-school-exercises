=begin
Write a program that uses the Sieve of Eratosthenes to find all the primes from 2 up to a given number.

The Sieve of Eratosthenes is a simple, ancient algorithm for finding all prime numbers up to any given limit. It does so by iteratively marking as composite (i.e. not prime) the multiples of each prime, starting with the multiples of 2.

Create your range, starting at two and continuing up to and including the given limit. (i.e. [2, limit]).

The algorithm consists of repeating the following over and over:

take the next available unmarked number in your list (it is prime)
mark all the multiples of that number (they are not prime)
Repeat until you have processed each number in your range. When the algorithm terminates, all the numbers in the list that have not been marked are prime. The wikipedia article has a useful graphic that explains the algorithm.
=end

class Sieve
  attr_reader :number

  def initialize(number)
    @number = number
    @range  = (2..number).to_a
  end

  def primes
    loop_over_range(@range, @range.first)
  end

  def loop_over_range(range, current_number)
    if current_number > range.last
      range
    else
      remove_multiples(range, current_number)
    end
  end

  def remove_multiples(range, current_number)
    start = current_number
    current_number += start
    until current_number > range.last
      range.delete current_number if range.include?(current_number)
      current_number = current_number + start
    end
    loop_over_range(range, start.next)
  end
end
