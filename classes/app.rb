require_relative 'create_instances/create_instances_game'
require_relative 'storage'

class App
  def initialize(main)
    @main = main
    # code  for book

    # code for music

    # code for game
    @game_methods = GameMethods.new
    unless File.empty?('./json_database/games.json') == false && File.empty?('./json_database/authors.json') == false
      return
    end

    @game_methods.games = Storage.load_data('games')
    @game_methods.authors = Storage.load_data('authors')
    puts @game_methods.authors
  end

  # code for book

  # code for music

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
