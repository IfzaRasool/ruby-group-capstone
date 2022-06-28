class Label
  attr_accessor :title, :color

  def initialize(title, color, items)
    @id = Random.rand(1..100)
    @title = title
    @color = color
    @items = items
  end

  def add_item
    # method add item
  end
end
