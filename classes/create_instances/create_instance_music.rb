require_relative '../item'
require_relative '../musicAlbum/genre'
require 'json'

class MusicCatalog
  attr_accessor :genres, :music_albums

  def initialize
    @genres = []
    @music_albums = []
  end

  def list_all_music_albums
    @music_albums.each do |music_album|
      print "#{@music_albums.find_index(music_album)}) Published Date: #{music_album.publish_date}, "
      puts "Is on Spotify: #{music_album.on_spotify}, Title: #{music_album.title}"
    end
  end

  def list_all_genres
    @genres.each do |genre|
      puts "#{@genres.find_index(genre)}) #{genre.name}"
    end
  end
end
