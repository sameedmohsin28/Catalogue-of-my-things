# frozen_string_literal: true

require 'time'

# Represents an item in the catalog.
class Item
  attr_reader :id, :archived
  attr_accessor :publish_date, :genre, :author, :label

  def initialize(publish_date, archived)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
    @genre = []
    @author = []
    @label = []
  end

  def add_genre(genre)
    @genre << genre
  end

  def add_author(author)
    @author << author
  end

  def add_label(label)
    @label << label
  end

  def can_be_archived?
    calculated_years = ((Time.new - Time.parse(@publish_date)) / 31_615_673).floor
    calculated_years > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
