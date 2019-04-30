class SentimentParser

  # properties
  @positive_words = File.readlines('data/positive_words.txt').map!{|line|line.rstrip().downcase}
  @negative_words = File.readlines('data/negative_words.txt').map!{|line|line.rstrip().downcase}
  @count = {positive: 0, negative: 0}
  @positive_word_count = Hash[@positive_words.collect { |item| [item, 0] } ]
  @negative_word_count = Hash[@negative_words.collect { |item| [item, 0] } ]

  def self.positive_words
    return @positive_words
  end

  def self.negative_words
    return @negative_words
  end

  def self.analyze(file)
    words = file.split(Regexp.union(["\n", " "])) # multiple delimiters (new line, space)
    words.each do |word|
      @count[:positive] = @count[:positive] + 1 if positive_words.include?(word.strip)
      @count[:negative] = @count[:negative] + 1 if negative_words.include?(word.strip)
    end
    return @count
  end

  def self.top_three(file)
    top_three = {positive: {}, negative: {}}
    words = file.split(Regexp.union(["\n", " "])) # multiple delimiters (new line, space)
    words.each do |word|
      @positive_word_count[word] = @positive_word_count[word] + 1 if positive_words.include?(word.strip)
      @negative_word_count[word] = @negative_word_count[word] + 1 if negative_words.include?(word.strip)
    end
    top_three[:positive] = @positive_word_count.sort_by {|_key, value| value}.reverse.first(3).to_h
    top_three[:negative] = @negative_word_count.sort_by {|_key, value| value}.reverse.first(3).to_h
    puts top_three
    return top_three
  end

  # OLDER VERSIONS OF METHODS

  # works
  def self.analyze_v2(file)
    delimiters = ["\n", " "]
    words = file.split(Regexp.union(delimiters))
    words.each do |word|
    if positive_words.include?(word.strip)
      @count[:positive] = @count[:positive] + 1
    elsif negative_words.include?(word.strip)
      @count[:negative] = @count[:negative] + 1
    end
    end
    return @count
  end

  # works
  def self.analyze_v1(file)
    lines = file.split("\n")
    lines.each do |line|
      words = line.split(" ")
      words.each do |word|
        if positive_words.include?(word.strip)
          @count[:positive] = @count[:positive] + 1
        elsif negative_words.include?(word.strip)
          @count[:negative] = @count[:negative] + 1
        end
      end
    end
    return @count
  end
end
