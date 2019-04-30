
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
    puts '- - - positive_words_array - - -'
    puts positive_words_array
    puts '- - - negative_words_array - - -'
    puts negative_words_array

    puts '- - - - -loop- - - - -'
    words.downcase.split(/[\s,',-]/).each do |word|
      puts ''
      puts "word is *#{word}*"
      puts "positve words match?"
      puts positive_words_array.include?(word)
      puts "negative words match?"
      puts negative_words_array.include?(word)
    end

    return results
  end
end
