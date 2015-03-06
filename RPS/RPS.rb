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
      @moves = ['rock', 'paper', 'scissors',]
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
end  #end of a the case for win conditions.
   
   def run
       loop do
         start
         play
         checkwinner
       end
   end #end of the "run" loop
   
end #end of RPS Class


class GameWindow < Gosu::Window
  def initialize
    super 1900, 1000, false
    self.caption = "SUPER ULTRA ARCADE ROCK PAPER SCISSORS ARENA ULTIMATE GAME OF THE YEAR EDITION"
    
    @player_sprite = Gosu::Image.new(self, "PlAYER.png", false)   
    @opponent_sprite = Gosu::Image.new(self, "MegaMan.jpg", false)
    @rock_sprite = Gosu::Image.new(self, "rock.png", false)
    @paper_sprite = Gosu::Image.new(self, "paper.png", false)
    @scissors_sprite = Gosu::Image.new(self, "scissors.png", false)
    @background_image = Gosu::Image.new(self, "arena.jpg", true)
    @textbox_image = Gosu::Image.new(self,"text_box.png", true)
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
  end

  def update
  end

  def draw
    @background_image.draw(0,0,0)
    @player_sprite.draw(-600,-200,1)
    @opponent_sprite.draw(1250,0,1)
    @rock_sprite.draw(600,400,1)
    @paper_sprite.draw(1000,400,1)
    @scissors_sprite.draw(1400,400,1)
    @textbox_image.draw(600,700,1)
    @font.draw("YOU HAVE BEEN CHALLENGED BY ROCKMAN!", 650, 800, 2, 2, 2, 0xff000000)
    @font.draw("CLICK ANYWHERE TO START", 650, 900, 2, 2, 2, 0xff000000)
  end
  
  def needs_cursor?
    true
  end
  
  def button_down(id)
  end
end #end of Gamewindow Class

window = GameWindow.new
window.show

#game = RPS.new
#game.setup
#game.run

