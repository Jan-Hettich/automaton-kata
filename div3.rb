#!/usr/bin/env ruby

class DivisibleBy3

  STATES = [0,1,2]
  START = 0
  ACCEPT = [0]

  INPUT_ALPHABET = "01"

  def accept?(input)
#    puts "checking input:  #{input}"
    raise ArgumentError if (input.chars - INPUT_ALPHABET.chars).count > 0 
    final_state = input.chars.reduce(START){ |q,c| self.next(q,c) }
    ACCEPT.include? final_state
  end

  def next(q,c)
    d = c.to_i
    new_state = case q 
      when 0 then d
      when 1 then (d^1)*2
      when 2 then d+1
    end
#    puts new_state
#    new_state
  end

end