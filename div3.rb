#!/usr/bin/env ruby

class DivisibleBy3

  STATES = [0,1,2]
  START = 0
  ACCEPT = [0]

  INPUT_ALPHABET = "01"

  def accept?(input)
    puts "checking input:  #{input}"
    raise ArgumentError if (input.chars - INPUT_ALPHABET.chars).count > 0 
    final_state = input.chars.reduce(START){ |q,c| self.next2(q,c) }
    p ACCEPT.include?(final_state)
    ACCEPT.include? final_state
  end

  def next0(q,c)
    0
  end

  def next1(q,c)
    d = c.to_i
    case q
      when 0 then d
      when 1 then d^1
    end
  end

  def next2(q,c)
    d = c.to_i
    new_state = case q 
      when 0 then d
      when 1 then (d^1)*2
      when 2 then 2
    end
    puts new_state
    new_state
  end

end