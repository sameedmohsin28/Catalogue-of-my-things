class Item
  attr_reader :id, :archived
  attr_accessor :publish_date, :genre, :author_name, :label
  
  def initialize (publish_date, archived)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
    @genre = []
    @author_name = []
    @label = []
  end

  def add_genre(genre)
    @genre << genre
  end

  def add_author(author_name)
    @author_name << author_name
  end

  def add_label(label)
    @label << label
  end
end