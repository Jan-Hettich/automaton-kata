require_relative "../div3"

RSpec::Matchers.define :accept do |input|
  match do |dfa|
    dfa.accept?(input)
  end
end

RSpec::Matchers.define :reject do |input|
  match do |dfa|
    !dfa.accept?(input)
  end
end

describe DivisibleBy3 do

  let (:div3) {DivisibleBy3.new}

  it {should respond_to(:accept?)}

  it "scans strings consisting of 0's and 1's" do
    ["0", "1", "01", "1001001", "00001010"].each { |s| div3.accept?(s) }
  end

  it "raises error if input string contains characters outside the input alphabet" do
    expect {div3.accept?("12345")}.to raise_error ArgumentError
  end

  it {should accept ""}
  # next returs 0

  it "ignores leading 0's" do
    (0..500).each do |n|
      expect(div3.accept?("%010b" % n)).to eq(div3.accept?("%b" % n))
    end
  end

  it {should accept "0"}

  it {should reject "1"}
  # add state 1, next returns d

  it {should accept "00"}

  it {should reject "01"}

  it {should reject "10"}
  # next returns d or d^1

  it {should accept "11"}

  it {should reject "100"}
  # still works

  it {should reject "101"}
  # add state 2, and when 1 then (d^1)*2
  # 2 => 2 for now

  it {should accept "110"}

  it {should reject "111"}

  it {should reject "1000"}

  it {should accept "1001"}
  # 2 => d + 1
  
  it "correctly interprets numbers up to (decimal) 500" do
    (0..500).each do |n|
      if (n % 3 == 0) 
        expect(div3).to accept("%b" % n)
      else 
        expect(div3).to reject("%b" % n)
      end 
    end
  end

  it "correctly interprets a random string" do
    prng = Random.new
    rand0 = prng.rand(8)
    rand1 = prng.rand(1000000)
    input = '0'*rand0 + "%b" % rand1
    if (rand1 % 3 == 0)
      expect(div3).to accept(input)
    else
      expect(div3).to reject(input)
    end
    puts "\nrandom input:  #{input}"
    puts "seed:  #{prng.seed}"
  end

end
