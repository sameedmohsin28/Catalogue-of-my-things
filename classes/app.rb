require_relative 'create_instances/create_instances_game'
require_relative 'create_instances/ui_tasks_book'
require_relative 'storage'

class App
  def initialize(main)
    @main = main

    # code  for book
    @ui_task_book_instance = UITaskBook.new
    return unless File.empty?('./json_database/books.json') == false && File.empty?('./json_database/labels.json') == false
    @ui_task_book_instance.books = Storage.load_data('books')
    @ui_task_book_instance.labels = Storage.load_data('labels')

    # code for music

    # code for game
    @game_methods = GameMethods.new
    return unless File.empty?('./json_database/games.json') == false && File.empty?('./json_database/authors.json') == false

    @game_methods.games = Storage.load_data('games')
    @game_methods.authors = Storage.load_data('authors')
  end

  # code for book
  def input_for_add_a_book
    print 'Enter publish date [DD/MM/YYYY]: '
    publish_date = gets.chomp
    print 'Enter publisher name: '
    publisher = gets.chomp
    print 'What is the state of the book cover? [good/bad]: '
    cover_state = gets.chomp
    if cover_state != 'good' && cover_state != 'bad'
      puts 'Please enter a valid input.'
      print 'What is the state of the book cover? [good/bad]: '
      cover_state = gets.chomp
    end
    print 'Title of the book: '
    label = gets.chomp
    print 'color of the book cover: '
    color = gets.chomp
    @ui_task_book_instance.add_a_book(publish_date, publisher, cover_state, label, color)
    Storage.save_data('books', @ui_task_book_instance.books)
    Storage.save_data('labels', @ui_task_book_instance.labels)
    puts 'The book has been added.'
    puts ''
    @main.show_options
  end

  def directing_to_list_all_books
    @ui_task_book_instance.list_all_books
    @main.show_options
  end

  def directing_to_list_all_labels
    @ui_task_book_instance.list_all_labels
    @main.show_options
  end

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
    puts 'Thank you for using this app!'
    puts ''
  end
end
