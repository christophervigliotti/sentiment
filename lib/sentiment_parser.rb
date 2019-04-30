
class SentimentParser
  def self.positive_words
    File.readlines('data/positive_words.txt')
  end
  def self.negative_words
    File.readlines('data/negative_words.txt')
  end
  def self.analyze(words)
    results = {:positive => 0, :negative => 0}
    words.downcase.split(' ').each do |word|
      results[:positive] +=1 if positive_words.include?(word)
      results[:negative] +=1 if negative_words.include?(word)
    end
    return results
  end
  def self.count_all_words(words)
    word_count = {}
    words.downcase.split(' ').each do |word|
      word_count.has_key?(word) ? word_count[word] +=1  : word_count[word] = 1
    end
    puts word_count
    return word_count
  end

end
