require_relative '../item'
require_relative '../musicAlbum/music_album'
require_relative '../musicAlbum/genre'
require 'json'


class MusicCatalog
  attr_accessor :genres, :music_albums

  def initialize
    @genres = []
    @music_albums = []
  end

  def create_music_album(publish_date, on_spotify, title)
    music_album = MusicAlbum.new(publish_date, on_spotify, title)
    @gmusic_albums.push(music_album)
  end

  def create_genre (name, music_album)
    genre = Genre.new(name)
    author.add_item(music_album)
    @genres.push(genre)
  end

  def list_all_music_albums
    @music_albums.each do |music_album|
      puts "#{@music_albums.find_index(music_album)} Published Date: #{music_album.publish_date}, Is on Spotify: #{music_album.on_spotify}, Title: #{music_album.title}"
    end
  end

  def list_all_genres
    @genres.each do |genre|
      puts "#{@genres.find_index(genre)} ID: #{genre.id}, Name: #{genre.name}"
    end
  end

  def create_music_album(publish_date, on_spotify, title)
    music_album = MusicAlbum.new(publish_date, on_spotify, title)
    @music_albums.push(music_album)
    save_data('music_albums.json', @music_albums)
  end
  
  # def create_genre(name)
  #   genre = Genre.new(name)
  #   @genres.push(genre)
  #   save_data('genres.json', @genres)
  # end
  
  private
  
  def save_data(filename, data)
    File.open(filename, 'w') { |file| file.write(JSON.dump(data)) }
    puts "Data saved to #{filename}"
  end
end
