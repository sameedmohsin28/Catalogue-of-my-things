require_relative '../item'
require 'time'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, last_played_at, multiplayer)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    calculated_last_played = ((Time.new - Time.parse(@last_played_at)) / 31_615_673).floor
    super && calculated_last_played > 2
  end
end
