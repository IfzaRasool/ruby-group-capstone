class Item
  attr_accessor :publish_date, :archived
  attr_reader :label, :genre, :author, :source

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..100)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?; end

  def move_to_archive; end

  private :can_be_archived?
end
