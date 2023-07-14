require_relative 'create_instances/create_instances_game'
require_relative 'storage'
require_relative 'create_instances/create_instance_music'

class App
  def initialize(main)
    @main = main
    # code  for book

    # code for music
    @music_catalog = MusicCatalog.new
    unless File.empty?('./json_database/music_albums.json') == false && File.empty?('./json_database/genres.json') == false
    end
    @music_catalog.music_albums = Storage.load_data('music_album')
    @music_catalog.genres = Storage.load_data('genre')

    # code for game
    @game_methods = GameMethods.new
    return unless File.empty?('./JSON/games.json') == false && File.empty?('./JSON/authors.json') == false

    @game_methods.games = Storage.load_data('games')
    @game_methods.authors = Storage.load_data('authors')
  end

  # code for book

  # code for music
  def create_a_music_album
    print 'Enter the name of the music album: '
    name = gets.chomp
    print 'Enter the publish date of the music album [yyyy/mm/dd]: '
    publish_date = gets.chomp
    print 'Is the music album available on Spotify? [y/n]: '
    on_spotify = gets.chomp.downcase == 'y'
    print 'Enter the name of the genre for the music album: '
    genre_name = gets.chomp
    # Create a music album and genre instance
    music_album = MusicAlbum.new(publish_date, on_spotify, name)
    genre = Genre.new(genre_name)
    genre.add_item(music_album)
    # Add the music album and genre to the music catalog
    @music_catalog.music_albums.push(music_album)
    @music_catalog.genres.push(genre)
    Storage.save_data('music_albums', @music_catalog.music_albums)
    Storage.save_data('genres', @music_catalog.genres)
    puts 'Music album created successfully!'
    @main.show_options
  end
  
  def list_all_music_albums
    @music_catalog.list_all_music_albums
    @main.show_options
  end

  def list_all_genres
    @music_catalog.list_all_genres
    @main.show_options
  end

  # code for game
  def create_a_game
    print 'Game was published at what date? [yyyy/mm/dd]: '
    publish_date = gets.chomp
    print 'Game was last played at? [yyyy/mm/dd]: '
    last_played_at = gets.chomp
    print 'choose (0) for single player or (1) for multiplayer: '
    multiplayer = gets.chomp.to_i
    multiplayer_bool = false if multiplayer.zero?
    multiplayer_bool = true if multiplayer == 1
    print "Author's first name: "
    first_name = gets.chomp
    print "Author's last name: "
    last_name = gets.chomp
    @game_methods.create_game(publish_date, last_played_at, multiplayer_bool, first_name, last_name)
    Storage.save_data('games', @game_methods.games)
    Storage.save_data('authors', @game_methods.authors)
    puts 'Game created successfully!'
    @main.show_options
  end

  def list_of_games
    @game_methods.list_all_games
    @main.show_options
  end

  def list_of_authors
    @game_methods.list_all_authors
    @main.show_options
  end

  def exit
    puts 'Exited'
  end
end
