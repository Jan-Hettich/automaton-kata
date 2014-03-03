#!/usr/bin/env ruby
require_relative "../div3"

RSpec::Matchers.define :accept do |input|
  match do |dfa|
    dfa.accept?(input)
  end
end

describe DivisibleBy3 do

  let (:div3) {DivisibleBy3.new}

  it "has an 'accept?' method" do
    expect(div3).to respond_to :accept?
  end

  it "scans strings consisting of 0's and 1's" do
    ["0", "1", "01", "1001001", "00001010"].each { |s| div3.accept?(s) }
  end

  it "accepts the empty string" do
    expect(div3). to accept("")
  end

  it "raises error if input string contains characters outside the input alphabet" do
    expect {div3.accept?("12345")}.to raise_error ArgumentError
  end

  it "accepts '0'" do
    expect(div3).to accept("0")
  end

  it "rejects '1'" do
    expect(div3).not_to accept("1")
  end

  it "accepts '00'" do
    expect(div3).to accept("00")
  end

  it "rejects '01'" do
    expect(div3).not_to accept("01")
  end

  it "rejects '10'" do
    expect(div3).not_to accept("10")
  end

  it "accepts '11'" do
    expect(div3).to accept("11")
  end

  it "rejects '100'" do
    expect(div3).not_to accept("100")
  end

end
