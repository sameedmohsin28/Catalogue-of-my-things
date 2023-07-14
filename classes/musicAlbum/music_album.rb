require_relative '../item'
require 'date'

class MusicAlbum < Item
  attr_accessor :on_spotify, :title

  def initialize(publish_date, on_spotify, title)
    super(publish_date)
    @on_spotify = on_spotify
    @title = title
  end

  def can_be_archived?
    super && !@on_spotify
  end
end
