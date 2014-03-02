#!/usr/bin/env ruby
require_relative "../dfa"

describe DivisibleBy3 do

  let (:div3) {DivisibleBy3.new}

  it "has an 'accept?' method" do
    expect(div3).to respond_to :accept?
  end

  it "scans strings consisting of 0's and 1's" do
    ["0", "1", "01", "1001001", "00001010"].each { |s| div3.accept?(s) }
  end

  it "accepts the empty string" do
    expect(div3.accept?("")).to be_true
  end

  it "raises error if input string contains characters outside the input alphabet" do
    expect {div3.accept?("12345")}.to raise_error ArgumentError
  end

end
