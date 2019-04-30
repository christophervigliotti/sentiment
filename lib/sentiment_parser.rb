
class SentimentParser

  def self.positive_words
    File.readlines('data/positive_words.txt')
    #File.readlines('data/positive_words_vigliotti.txt')
  end

  def self.negative_words
    File.readlines('data/negative_words.txt')
    #File.readlines('data/negative_words_vigliotti.txt')
  end

  # this returns incorrect count
  def self.analyze(words)
    positive_words_array = positive_words
    negative_words_array = negative_words
    positive_counter = 0
    negative_counter = 0
    results = {:positive => 0, :negative => 0}
    words.downcase.split(' ').each do |word|

      # returns zero
      # positive_counter +=1 if positive_words_array.include?(word)

      # returns incorrect counts
      positive_words_array.each do |positive_word|
        positive_counter += 1 if positive_word.strip == word.strip
      end

      # returns zero
      # negative_counter +=1 if negative_words_array.include?(word)

      # returns incorrect counts
      negative_words_array.each do |negative_word|
        negative_counter += 1 if negative_word.strip == word.strip
      end
    end
    results[:positive] = positive_counter
    results[:negative] = negative_counter
    return results
  end
end
