class Label
  attr_reader :items
  attr_accessor :title, :color

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'title' => @title,
      'color' => @color
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['title'], object['color'])
  end
end
