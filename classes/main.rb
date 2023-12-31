require_relative 'app'

class Startup
  def initialize
    @app = App.new(self)
    show_options
  end

  def show_options
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all games'
    puts '4 - List all labels'
    puts '5 - List all genres'
    puts '6 - List all authors'
    puts '7 - Add a book'
    puts '8 - Add a music album'
    puts '9 - Add a game'
    puts '10 - Exit'
    print 'Enter your choice: '
    selector = gets.chomp
    puts ''
    choice(selector)
  end

  def choice(selector)
    options = {
      '1' => :directing_to_list_all_books,
      '2' => :list_all_music_albums,
      '3' => :list_of_games,
      '4' => :directing_to_list_all_labels,
      '5' => :list_all_genres,
      '6' => :list_of_authors,
      '7' => :input_for_add_a_book,
      '8' => :create_a_music_album,
      '9' => :create_a_game,
      '10' => :exit
    }

    method = options[selector]
    if method.nil?
      puts 'Invalid input, try again'
      puts
      show_options
    else
      @app.send(method)
    end
  end
end

def main
  Startup.new
end

main
