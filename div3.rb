class Div3

  INPUT_ALPHABET = "01"
  STATES = [0,1,2]
  START = 0
  ACCEPT = [0]

  def accept?(s)	
  	raise ArgumentError unless (s.chars - INPUT_ALPHABET.chars).empty?
  	final_state = s.chars.reduce(START){|q, c| next_state(q,c)}
  	ACCEPT.include? final_state
  end

  def next_state(q, c)
  	d = c.to_i
  	case q 
  	when 0 then d
    when 1 then (d^1)*2
    when 2 then d + 1
    end
  end

end