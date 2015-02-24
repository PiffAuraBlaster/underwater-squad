require 'gosu'

class RPS
  
  def initialize()
    @player_score = 0
    @opponent_score = 0
  end 
  
  def setup
    puts "ARE YOU READY TO PLAY?"
    puts "You will play best out of 5 games!"
    @game_number = 1
  end  
  
  def start
      puts "This is a 5 game tournament. This is game #{@game_number}"
      puts "Select your move: enter rock, paper or scissors"
  end
  
  def play
      @moves = ['rock', 'paper', 'scissors']
      @player_choice = $stdin.gets.chomp.downcase
      @opponent_choice = @moves.sample
  end

  
  def checkwinner  
   case [@player_choice, @opponent_choice ]
     when ['rock', 'scissors'], ['scissors', 'paper'], ['paper', 'rock'] 
       puts "You get a point!"
       @player_score += 1
       @game_number += 1
     when ['rock', 'rock'], ['scissors', 'scissors'], ['paper', 'paper']
       puts "Draw! Replay round."
     when ['rock', 'paper'], ['scissors', 'rock'], ['paper', 'scissors']
       puts "Your Opponent gets a point!"
       @opponent_score += 1
       @game_number += 1
     else
       puts "WRONG. THERE ARE ONLY 3 CHOICES. ROCK, PAPER, OR SCISSORS." 
  end
  
  puts "You chose: #{@player_choice.upcase}"
  puts "Your opponent: #{@opponent_choice.upcase}"
  puts "Score: You #{@player_score}; Computer #{@opponent_score}"
  
 

  case
    when @player_score == 3
      puts "Congrats, you beat a computer. Your parents must be so proud."
      exit
    when @opponent_score == 3
      puts "You lose. Wow. You must feel terrible."
      exit
  end
end 
   
   def run
       loop do
         start
         play
         checkwinner
       end
   end
   
end #end of RPS Class


class GameWindow < Gosu::Window
  def initialize
    super 1900, 1000, false
    self.caption = "SUPER ULTRA ARCADE ROCK PAPER SCISSORS ARENA ULTIMATE GAME OF THE YEAR EDITION"
    
    @background_image = Gosu::Image.new(self, "arena.jpg", true)
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
  end

  def update
    
  end

  def draw
    @background_image.draw(0,0,0)
  end
  def needs_cursor?
    true
  end
  
end #end of Gamewindow Class

window = GameWindow.new
window.show

game = RPS.new
game.setup
game.run

