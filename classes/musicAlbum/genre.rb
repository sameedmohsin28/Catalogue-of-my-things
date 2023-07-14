class Genre
  attr_accessor :id, :name, :items

  def initialize(name)
    @id = generate_id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'name' => @name
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['name'])
  end

  private

  def generate_id
    Random.rand(1..1000)
  end
end
