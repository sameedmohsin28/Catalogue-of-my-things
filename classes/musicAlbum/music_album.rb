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

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'on_spotify' => @on_spotify,
      'title' => @title
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['on_spotify'], object['title'])
  end
end
