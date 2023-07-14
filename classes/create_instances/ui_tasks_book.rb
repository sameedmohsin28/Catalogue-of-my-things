require_relative '../book/book'
require_relative '../book/label'

class UITaskBook
  attr_accessor :books, :labels

  def initialize
    @books = []
    @labels = [Label.new('TLS', 'ER'), Label.new('WO', 'HK')]
  end

  def add_a_book(publish_date, publisher, cover_state)
    book_instance = Book.new(publish_date, publisher, cover_state)
    @books.push(book_instance)
  end

  def list_all_books
    puts 'List of all books'
    @books.each do |book|
      puts "Publish Date: #{book.publish_date}, Publisher: #{book.publisher}, Cover State: #{book.cover_state}"
    end
    puts ''
  end

  def list_all_labels
    puts 'List of all labels'
    @labels.each do |label|
      puts "Title: #{label.title}"
    end
    puts ''
  end
end
