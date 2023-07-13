require './classes/item'
require 'time'

class Game < Item
  def initialize(publish_date, archived, last_played_at, multiplayer)
    super(publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    calculated_last_played = ((Time.new - Time.parse(@last_played_at)) / 31_615_673).floor
    super && calculated_last_played > 2
  end
end
