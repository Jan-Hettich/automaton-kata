class Div3

  INPUT_ALPHABET = ['0', '1']
  STATES = [0,1,2]
  START = 0
  ACCEPT = [0]

  # begin in start state
  # scan input string one symbol at a time and determine next state
  # accept (or reject) input string based on final state
  def accept?(s)	
  	raise ArgumentError unless (s.chars - INPUT_ALPHABET).empty?
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