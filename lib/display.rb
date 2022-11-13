module Display

  def choice
    <<~CHOICE
      Let's play agame of Mastermind :
      1. to guess the code.
      2. to make the computer guess.

    CHOICE
  end

  def greeting
    <<~GREETING
      You'll have to guess the 4 numbers [1-6]
      chosen by the computer in 12 guesses or less.
      You can enter 0 to leave a blank space.
      [+] means right number at the right place.
      [-] means right number at a wrong place.
      [ ] means wrong number.
      The feedback is not positional.

    GREETING
  end

  def solution_choice
    <<~SOLUTION_CHOICE
      Enter 4 numbers [1-6] you want the computer
      to guess.

    SOLUTION_CHOICE
  end

  def error
    <<~ERROR
      Please enter 4 numbers between 1 and 6
      without spaces or other characters.
    ERROR
  end

  def choice_error
    'Please enter 1 or 2'
  end

  def prompt
    'Your guess > '
  end

  def simple_prompt
    '> '
  end

  def win
    'Congratulation, you won !'
  end

  def lose
    'No more tries, you lose.'
  end
  
end
