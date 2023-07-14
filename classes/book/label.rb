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
      id: @id,
      title: @title,
      color: @color,
      items: @item
    }.to_json(*args)
end
