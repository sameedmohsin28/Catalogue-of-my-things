require_relative '../games/author'
require_relative '../games/game'

class GameMethods
  attr_accessor :games, :authors

  def initialize
    @games = []
    @authors = []
  end

  def create_game(publish_date, last_played_at, multiplayer, first_name, last_name)
    game = Game.new(publish_date, last_played_at, multiplayer)
    create_author(first_name, last_name, game)
    @games.push(game)
  end

  def create_author(first_name, last_name, game)
    author = Author.new(first_name, last_name)
    author.add_item(game)
    @authors.push(author)
  end

  def list_all_games
    if @games.empty?
      puts 'There are no games! Kindly add one'
    else
      puts 'Games: '
      @games.each do |game|
        puts "#{@games.find_index(game)}) Published Date: #{game.publish_date}, Multiplayer: #{game.multiplayer}"
      end
    end
  end

  def list_all_authors
    if @authors.empty?
      puts 'There are no authors! Kindly create one by adding a game'
    else
      puts 'Authors: '
      @authors.each do |author|
        puts "#{@authors.find_index(author)}) #{author.first_name} #{author.last_name}"
      end
    end
  end
end
