module Display

  def greeting
    <<~GREETING
      Let's play a game of Mastermind.
      You'll have to guess the 6 numbers [1-6]
      chosen by the computer in 12 guesses or less. 
    GREETING
  end

  def error
    <<~ERROR
      Please enter 6 numbers between 1 and 6
      without spaces or other characters.
    ERROR
  end

  def prompt
    'Your guess > '
  end

end
