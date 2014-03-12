require_relative "../div3"

RSpec::Matchers.define :accept do |input|
	match do |auto|
		auto.accept?(input)
	end
end

describe Div3 do

	it {should respond_to(:accept?)}
  # accept method exists
	
	it "scans input strings consisting of 1's and 0's" do
		['0', '1', '010100', '100'].each{|s| subject.accept?(s)}
	end
  # accept returns string length

	it "raises error if input string contains other symbols" do
    expect{subject.accept?("12345")}.to raise_error ArgumentError
	end

  it "ignores leading 0's" do
    expect(subject.accept?("0001011")).to eq(subject.accept?("1011"))
  end

	it {should accept ""}
  # accept returns true

	it {should accept "0"}
  # next returns 0

	it {should_not accept "1"}
  # add state 1, next returns d

	it {should accept "00"}
	it {should_not accept "01"}
  it {should_not accept "10"}
  # next returns d or d^1

  it {should accept "11"}
  it {should_not accept "100"}
  # still works

  it {should_not accept "101"}
  # add state 2, and when 1 then (d^1)*2
  # 2 => 2 for now

  it {should accept "110"}
  it {should_not accept "111"}
  it {should_not accept "1000"}
  it {should accept "1001"}
  # 2 => d + 1

  rng = Random.new
  puts "seed: #{rng.seed}"
  10.times do
    n = rng.rand(1000000)
    if n % 3 == 0 then
      it {should accept "%b" % n}
    else
      it {should_not accept "%b" % n}
    end
  end

end
