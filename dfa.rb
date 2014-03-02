#!/usr/bin/env ruby

class DivisibleBy3

  STATES = ['0']
  START = '0'
  ACCEPT = ['0']

  INPUT_ALPHABET = "01"

  def accept?(input)
    raise ArgumentError if (input.chars - INPUT_ALPHABET.chars).count > 0 
    p = input.chars.reduce(START){ |q,c| self.next(q,c) }
    ACCEPT.include? p
  end

  def next(q,c)
    '0'
  end

end
