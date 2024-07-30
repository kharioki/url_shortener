class ShortCode
  ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".freeze
  BASE = ALPHABET.length

  def self.encode(number)
    return ALPHABET.first if number.zero? || number.nil?

    result = ""

    while number > 0 do
      index = number % BASE
      char = ALPHABET[index]
      result.prepend char
      number = number / BASE
    end

    result
  end

  def self.decode(string)
    return 0 if string.nil? || string.empty?

    number = 0

    string.each_char do |char|
      index = ALPHABET.index(char)
      number = number * BASE + index
    end

    # string.reverse.each_char.with_index do |char, index| # slower
    #   power = BASE**index
    #   index = ALPHABET.index(char)
    #   number += index * power
    # end

    number
  end
end