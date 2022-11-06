This is my attempt at the Mastermind Project frome The Odin Project Ruby Course.

I have to build a working Mastermind game playable from the command line.

0. I must read-up on how to build an organized code-project

1. I must conceptualize the project, and read the rules of the original mastermind

2. I have to build the game assuming the computer randomly selects the secret colors and the human player must guess them. Feedback must be given after each guess.

3. Then, I'll refactor the code to allow the human player to choose whether he wants to be the creator of the code or the guesser.

4. I'll research the strategies involved

5. I'll build it so the computer will guess if the player choose to create the secret code. The computer will follow the rules.

6. Then I'll build it so the computer act more "human-like" with it first guessing randomly and keeping the exact matches. Then keeping the right colors used in the wrong position.

--- Project planning ---

1. Rules of mastermind : 12 rows of 4 holes and 4 little holes for feedback
6 colors : white, black, yellow, green, red, blue
No empty spots, multiple uses of a color authorized, 1 feedback (the best) for 1 color-guess
White or black pins for feedback (black = right color right spot / white = good color but wrong spot)
No fixed place for feedback pins
- Maybe use 1 to 6 to avoid repetition in initials with black and blue
- Maybe use a 2x2 grid for feedback to better see that feedback order isn't correlated with guessing spots and fill them left to right, top to bottom
- No score count needed

- /+ instead of black and - instead of white for feedback
Object oriented : multiple classes and modules
lib architecture : main / player / computer / display / board / game

playable in the command line
input from player, 4 numbers between 1 & 6
desired output : feedback on the guess with boxes containing [  ] [ + ] [ - ]
a main file which will require the different class and module files
