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
end

