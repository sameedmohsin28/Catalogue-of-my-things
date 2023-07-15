require 'time'

class Item
  attr_reader :id, :archived, :author
  attr_accessor :publish_date, :genre, :label

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
    @genre = []
    @label = []
  end

  def add_genre(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived?
    calculated_years = ((Time.new - Time.parse(@publish_date)) / 31_615_673).floor
    calculated_years > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
