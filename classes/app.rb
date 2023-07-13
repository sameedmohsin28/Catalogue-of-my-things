require_relative 'Methods/game_methods'
require_relative 'storage'

class App
  def initialize(main)
    @main = main
    #code  for book


    #code for music


    # code for game
    @game_methods = GameMethods.new
    if File.zero?('./JSON/games.json') == false && File.zero?('./JSON/authors.json') == false
      @game_methods.games = Storage.load_data('games')
      @game_methods.authors = Storage.load_data('authors')
    end
  end

  #code for book




  #code for music




  # code for game
  def create_a_game
    print 'Game was published at what date? [yyyy/mm/dd]: '
    publish_date = gets.chomp
    print 'Is game archived? [y/n]: '
    archived = gets.chomp.capitalize
    print 'Game was last played at? [yyyy/mm/dd]: '
    last_played_at = gets.chomp
    print 'choose (0) for single player or (1) for multiplayer: '
    multiplayer = gets.chomp.to_i
    print "Author's first name: "
    first_name = gets.chomp
    print "Author's last name: "
    last_name = gets.chomp
    @game_methods.create_game(publish_date, true, last_played_at, true, first_name, last_name) if archived == 'Y' && multiplayer == 1
    @game_methods.create_game(publish_date, true, last_played_at, false, first_name, last_name) if archived == 'Y' && multiplayer == 0
    @game_methods.create_game(publish_date, false, last_played_at, false, first_name, last_name) if archived == 'N' && multiplayer == 0
    @game_methods.create_game(publish_date, false, last_played_at, true, first_name, last_name) if archived == 'N' && multiplayer == 1
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
    puts "Exited"
  end
end
