require 'UUID'

class Label
  attr_accessor :title, :color
  attr_reader :items

  def initialize(title, color)
    @id = UUID.new.generate
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
