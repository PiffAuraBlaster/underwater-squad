class RPS
  attr_accessor :player_score 
  
  def initialize()
    @player_score = 0
    @opponent_score = 0
    @game_number = 1
  end 
  # Initializes the score values and the game numberat the beginning.
  
  def start
      puts "This is a 5 game tournament. This is game #{@game_number}"
      puts "Select your move: enter rock, paper or scissors"
  end
  #Displays what game number you are on a prompts user for their move. 
   
  def play
      @moves = ['rock', 'paper', 'scissors',]
      @player_choice = $stdin.gets.chomp.downcase
      @opponent_choice = @moves.sample
  end
  # String -> String
  # Takes a typed in string which is either rock, paper, or scissors and uses it as the move for the @player_choice and saves that for later use in checkwinner.
  
  def comparison(first, second)
    case [first, second]
      when ['rock', 'scissors'], ['scissors', 'paper'], ['paper', 'rock'] 
        -1
      when ['rock', 'rock'], ['scissors', 'scissors'], ['paper', 'paper']
         0
      when ['rock', 'paper'], ['scissors', 'rock'], ['paper', 'scissors']
         1
      else
        puts ERROR
      end 
  end #End of comparison
  
  def givescore  
    x = comparison(@player_choice, @opponent_choice)
   if x == -1
       @player_score += 1
       @game_number += 1
     elsif x == 0
       @player_score += 0
       @opponent_score += 0
       @game_number += 0
     elsif x == 1
       @opponent_score += 1
       @game_number += 1
     else
       puts ERROR
     end 
   end #End of point giving condition.
 


  def checkend
    if @player_score == 3
      puts "Congrats, you beat a computer. Your parents must be so proud."
      exit
    elsif @opponent_score == 3
      puts "You lose. Wow. You must feel terrible."
      exit
  end #End of checking for winner
   
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
    
    @game = RPS.new
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
    @font.draw("PRESS ENTER TO START", 650, 900, 2, 2, 2, 0xff000000)
    if @opponent_choice == 'rock'
      @rock_sprite.draw(700,50,1)
    elsif @opponent_choice == 'paper'
      @paper_sprite.draw(700,50,1)
    elsif 
      @scissors_sprite.draw(700,50,1)
    else 
    end
  end #End of Draw
  
  def needs_cursor?
    true
  end
  
  def button_down(id)
    case id 
    when Gosu::KbEscape
      exit
    when Gosu::KbEnter
      
    when Gosu::MsLeft
      handle_mouse_click()
    end
  end #End of button_down
  
  def handle_mouse_click()
    
  end
      
end #end of Gamewindow Class