class BookMock
  attr_reader :id, :archived
  attr_accessor :publisher, :cover_state, :publish_date, :label

  def initialize(publish_date, publisher, cover_state)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
    @publisher = publisher
    @cover_state = cover_state
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived?
    calculated_years = ((Time.new - Time.parse(@publish_date)) / 31_615_673).floor
    @cover_state == 'bad' || calculated_years > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
