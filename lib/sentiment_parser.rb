
class SentimentParser

  def self.positive_words
    File.readlines('data/positive_words.txt')
    #File.readlines('data/positive_words_vigliotti.txt')
  end

  def self.negative_words
    File.readlines('data/negative_words.txt')
    #File.readlines('data/negative_words_vigliotti.txt')
  end

  def self.analyze(words)
    results = {:positive => 0, :negative => 0}
    words.downcase.split(' ').each do |word|
      results[:positive] +=1 if positive_words.include?(word)
      results[:negative] +=1 if negative_words.include?(word)
    end
    return results
  end

  # this works
  def self.analyze_version_02(words)
    positive_words_array = positive_words
    negative_words_array = negative_words
    positive_counter = 0
    negative_counter = 0
    results = {:positive => 0, :negative => 0}
    words.downcase.split(' ').each do |word|
      positive_counter +=1 if positive_words_array.include?(word)
      negative_counter +=1 if negative_words_array.include?(word)
      positive_counter +=1 if positive_words_array.include?(word)
      negative_counter +=1 if negative_words_array.include?(word)
    end

    results[:positive] = positive_counter
    results[:negative] = negative_counter
    return results
  end

  # this works
  def self.analyze_version_01(words)
    positive_words_array = positive_words
    negative_words_array = negative_words
    positive_counter = 0
    negative_counter = 0
    results = {:positive => 0, :negative => 0}
    words.downcase.split(' ').each do |word|
      positive_words_array.each do |positive_word|
        positive_counter += 1 if positive_word.strip == word.strip
      end
      negative_words_array.each do |negative_word|
        negative_counter += 1 if negative_word.strip == word.strip
      end
    end

    results[:positive] = positive_counter
    results[:negative] = negative_counter
    return results
  end
end
