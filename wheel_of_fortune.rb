class WheelOfFortune
  attr_reader :guesses, :theme

  def initialize(wheel_hash)
    @phrase = wheel_hash[:phrase]
    @theme = wheel_hash[:theme]
    @guesses = []

    if @phrase
      @array = @phrase.gsub(/\w/, '_').chars
      @guess_letter = @phrase.gsub(/\s/, '').length
    end
  end

  def to_s
    @array.join
  end

  def can_i_have?(input)
    updated_input = input.downcase
    @guesses.push updated_input
    alt_array = @phrase.downcase.chars

      if alt_array.include? updated_input
        index = alt_array.find_index updated_input
        @array[index] = @phrase[index]
        @guess_letter -= 1
        return true

      else
        return false
      end
  end

  def game_over?
    @guess_letter == 0
  end
end


# Checks to see if we executed this file from the command-line
# e.g. `ruby simple_jepordy.rb`
if __FILE__ == $0

  # DRIVER CODE
  j = WheelOfFortune.new( {theme: "card games", phrase: "Go fish"} )
  j.can_i_have?("g")
  j.can_i_have?("o")
  p j
  puts j # calls j.to_s

end
