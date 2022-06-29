require 'UUID'

class Label
  attr_accessor :title, :color

  def initialize(title, color)
    @id = UUID.new.generate(1..100)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
