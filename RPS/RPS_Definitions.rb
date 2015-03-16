class RPS
  attr_accessor :player_score, :player_choice 
  attr_accessor :opponent_score, :opponent_choice
  
  
  def initialize()
    @player_score = 0
    @opponent_score = 0
    @game_number = 1
  end 
  # Initializes the score values and the game number at the beginning.
     
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
        nil
      end 
  end
  #String, String -> Number 
  #Takes a string from the user and a string from the AI and compares them and spits out a number afterwards. Either -1, 0, or 1.
  #End of comparison
  
  
  def givepoints  
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
     end 
     return x
   end #End of givepoints
 
  def checkend
    if @player_score == 3
      playerwin
      exit
    elsif @opponent_score == 3
      opponentwin
      exit
    end 
  end #End of checkend
   
   def run
       loop do
         play
         givepoints
         checkend
       end
   end #end of run
   
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
    @questionblock_sprite = Gosu::Image.new(self,"?.png",false)
    @background_image = Gosu::Image.new(self, "arena.jpg", true)
    @textbox_image = Gosu::Image.new(self,"text_box.png", true)
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    @textline = "YOU HAVE BEEN CHALLENGED BY ROCKMAN!"
    @textline2 = "CLICK TO MAKE YOUR MOVE!"
    
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
    @font.draw(@textline, 650, 800, 2, 2, 2, 0xff000000)
    @font.draw(@textline2, 650, 900, 2, 2, 2, 0xff000000)
    
    if @game.opponent_choice == 'rock'
      @rock_sprite.draw(750,50,1)
    elsif @game.opponent_choice == 'paper'
      @paper_sprite.draw(750,50,1)
    elsif @game.opponent_choice == 'scissors'
      @scissors_sprite.draw(750,50,1)
    else 
      @questionblock_sprite.draw(800,100,1)
    end# End of opponent_choice pictures
    #Condition to display sprite for opponent_choice
    
    if @game.opponent_choice == 'rock' and @game.player_choice == 'paper'
      @textline = "YOU CHOSE PAPER, HE CHOSE ROCK"
      @textline2 = "YOU GOT A POINT!"
    elsif @game.opponent_choice == 'rock' and @game.player_choice == 'scissors'
      @textline = "YOU CHOSE SCISSORS, HE CHOSE ROCK"
      @textline2 = "HE GOT A POINT!"
    elsif @game.opponent_choice == 'rock' and @game.player_choice == 'rock'
      @textline = "YOU CHOSE ROCK, HE CHOSE ROCK"
      @textline2 = "DRAW! TRY AGAIN"
    elsif @game.opponent_choice == 'paper' and @game.player_choice == 'rock'
      @textline = "YOU CHOSE ROCK, HE CHOSE PAPER"
      @textline2 = "HE GOT A POINT!"
    elsif @game.opponent_choice == 'paper' and @game.player_choice == 'rock'
      @textline = "YOU CHOSE ROCK, HE CHOSE ROCK"
      @textline2 = "DRAW! TRY AGAIN"
    elsif @game.opponent_choice == 'paper' and @game.player_choice == 'rock'
      @textline = "YOU CHOSE ROCK, HE CHOSE ROCK"
      @textline2 = "DRAW! TRY AGAIN"
    elsif @game.opponent_choice == 'scissors' and @game.player_choice == 'rock'
      @textline = "YOU CHOSE ROCK, HE CHOSE ROCK"
      @textline2 = "DRAW! TRY AGAIN"
    elsif @game.opponent_choice == 'scissors' and @game.player_choice == 'rock'
      @textline = "YOU CHOSE ROCK, HE CHOSE ROCK"
      @textline2 = "DRAW! TRY AGAIN"
    elsif @game.opponent_choice == 'scissors' and @game.player_choice == 'rock'
      @textline = "YOU CHOSE ROCK, HE CHOSE ROCK"
      @textline2 = "DRAW! TRY AGAIN"
    end #end of this if statement.
    #condition to change text depending on the outcomes.
    
  end #End of Draw
  
  def needs_cursor?
    true
  end
  
  def button_down(id)
    case id 
    when Gosu::KbEscape
      exit
    when Gosu::MsLeft
      handle_mouse_click()
    end
  end #End of button_down
  
  def handle_mouse_click()
    @game.player_choice = nil
    if mouse_x > 600 and mouse_x < 900  and mouse_y < 650 and mouse_y > 400
      @game.player_choice = 'rock'
    elsif mouse_x > 999 and mouse_x < 1300 and mouse_y < 650 and  mouse_y > 400
      @game.player_choice = 'paper'   
    elsif mouse_x > 1399 and mouse_x < 1690 and mouse_y < 650 and  mouse_y > 400
      @game.player_choice = 'scissors'
    end 
    if @game.player_choice
        moves = ['rock', 'paper', 'scissors',]
        @game.opponent_choice = moves.sample
        @game.givepoints()
    end
  end #end of handle_mouse_click
      
end #end of Gamewindow Class