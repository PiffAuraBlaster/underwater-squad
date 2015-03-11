require 'minitest/autorun'
require 'gosu'
require_relative 'RPS_Definitions'

describe "RPS" do
  
  before do 
    @game = RPS.new
  end
  
  it "has player score start at 0" do
    @game.player_score.must_equal 0
  end
  
  it "equals -1 when rock against scissors" do
    @game.comparison('rock', 'scissors').must_equal -1
  end
  it "equals -1 when scissors against paper" do
    @game.comparison('scissors', 'paper').must_equal -1
  end
  it "equals -1 when paper against rock" do
    @game.comparison('paper', 'rock').must_equal -1
  end
  it "equals 0 when rock against rock" do
    @game.comparison('rock', 'rock').must_equal 0   
  end
  it "equals 0 when paper against paper" do
    @game.comparison('paper', 'paper').must_equal 0
  end
  it "equals -1 when scissors against scissors" do
    @game.comparison('scissors', 'scissors').must_equal 0
  end
  it "equals 1 when rock against paper" do
    @game.comparison('rock', 'paper').must_equal 1
  end
  it "equals 1 when paper against scissors" do
    @game.comparison('paper', 'scissors').must_equal 1
  end
  it "equals -1 when scissors against rock" do
    @game.comparison('scissors', 'rock').must_equal 1
  end
  
  it "adds 1 to player_score when"
end

