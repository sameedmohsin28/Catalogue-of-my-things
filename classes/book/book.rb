require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if @cover_state == 'bad' || super()

    false
  end

  def to_json(*args)
    {
      class_name: self.class.name,
      publish_date: @publish_date,
      publisher: @publisher,
      cover_state: @cover_state,
      archived: @archived,
      id: @id
    }.to_json(*args)
  end
end
