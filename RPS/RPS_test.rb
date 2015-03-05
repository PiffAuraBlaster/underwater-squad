require 'minitest/autorun'
require './RPS'

Class TestRPS < Minitest::Test

def setup
  @RPS = RPS.new
end

def game_number_is_1
  assert_equal "1", @game_number
end

