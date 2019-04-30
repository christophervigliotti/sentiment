require 'spec_helper'
require 'sentiment_parser'

describe SentimentParser do

  before do
    #@results = File.read('spec/fixtures/twitter.txt')
    #@analysis = {positive: 183, negative: 266}
    @results = File.read('spec/fixtures/vigliotti.txt')
    @analysis = {positive: 1, negative: 1}
  end

  xit 'returns results' do
    expect(@results.length).to_not eq(0)
  end

  xit 'returns positive words' do
    results = SentimentParser.positive_words
    expect(results.length).to_not eql 0
  end

  xit 'returns negative words' do
    results = SentimentParser.negative_words
    expect(results.length).to_not eql 0
  end

  it 'analyzes' do
    analyze = SentimentParser.analyze(@results)
    expect(analyze).to eq @analysis
  end

#   Extra credit
#   Write a test that calls a method "top_words" that returns
#   a hash that has an array of hashes with the top three positive and negative words
#   and counts
#   top_words = { positive: [ {word1: 10}, {word2: 7}, {word3: 5} ], negative: [ {word1: 7},
#       {word2: 5}, {word3: 2} ] }
end
