require 'spec_helper'
require 'sentiment_parser'

describe SentimentParser do

  before do
    @results = File.read('spec/fixtures/twitter.txt')
    @analysis = {positive: 183, negative: 266}
    #@results = File.read('spec/fixtures/vigliotti.txt')
    #@analysis = {positive: 1, negative: 1}
  end

  it 'returns results' do
    expect(@results.length).to_not eq(0)
  end

  it 'returns positive words' do
    results = SentimentParser.positive_words
    puts results
    expect(results.length).to_not eql 0
  end

  it 'returns negative words' do
    results = SentimentParser.negative_words
    puts results
    expect(results.length).to_not eql 0
  end

  it 'analyzes' do
    analyze = SentimentParser.analyze(@results)
    expect(analyze).to eq @analysis
  end

  it 'gets top 3 positive and negative words' do
    top_three = SentimentParser.top_three(@results)
    puts 'hi!'
    puts top_three
    expect(top_three).to have_key(:positive)
    expect(top_three).to have_key(:negative)
    expect(top_three[:positive].length).to eql 3
    expect(top_three[:negative].length).to eql 3
  end

#   Extra credit
#   Write a test that calls a method "top_words" that returns
#   a hash that has an array of hashes with the top three positive and negative words
#   and counts
#   top_words = { positive: [ {word1: 10}, {word2: 7}, {word3: 5} ], negative: [ {word1: 7},
#       {word2: 5}, {word3: 2} ] }
end
