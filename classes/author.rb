require 'UUID'
require_relative '../item'

class Author
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @id = UUID.new.generate
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item: Item.new)
    @items << item
    Item.author = self
  end
end
