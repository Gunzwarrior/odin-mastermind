module Display

  def greeting
    <<~GREETING
      Let's play a game of Mastermind.
      You'll have to guess the 6 numbers [1-6]
      chosen by the computer in 12 guesses or less.
    GREETING
  end

end
