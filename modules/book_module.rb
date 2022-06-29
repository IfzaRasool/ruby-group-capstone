require 'json'

module BooksDataController
  def load_books
    file = './json/books.json'
    data = []

    if File.exist?(file)
      if File.empty?(file)
        data
      else
        JSON.parse(File.read(file))
      end
    else
      data
    end
  end

  def save_books(book)
    file = './json/books.json'
    data = []
    new_book = {
      'name' => book.name,
      'publisher' => book.publisher,
      'cover_state' => book.cover_state,
      'publish_date' => book.publish_date
    }

    data = JSON.parse(File.read(file)) if File.exist?(file)
    data << new_book
    File.write(file, JSON.pretty_generate(data))
  end
end
