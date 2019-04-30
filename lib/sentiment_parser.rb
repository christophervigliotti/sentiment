
class SentimentParser
  def self.positive_words
    #File.readlines('data/positive_words.txt')
    File.readlines('data/positive_words_vigliotti.txt')
  end
  def self.negative_words
    #File.readlines('data/negative_words.txt')
    File.readlines('data/negative_words_vigliotti.txt')
  end
  def self.analyze(words)
    positive_words_array = positive_words
    negative_words_array = negative_words
    results = {:positive => 0, :negative => 0}
    words.downcase.split(/[\s,',-]/).each do |word|
      positive_words_array.each do |positive_word|
        puts "does #{word} equal #{positive_word}"

        # this is returning false even when the words match
        puts positive_word == word

      end
    end

    return results
  end
end
