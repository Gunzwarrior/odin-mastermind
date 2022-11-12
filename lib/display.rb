module Display

  def greeting
    <<~GREETING
      Let's play a game of Mastermind.
      You'll have to guess the 4 numbers [1-6]
      chosen by the computer in 12 guesses or less.
      You can enter 0 to leave a blank space.
      [+] means right number at the right place.
      [-] means right number at a wrong place.
      [ ] means wrong number.
      The feedback is not positional.

    GREETING
  end

  def error
    <<~ERROR
      Please enter 4 numbers between 1 and 6
      without spaces or other characters.
    ERROR
  end

  def prompt
    'Your guess > '
  end

end
