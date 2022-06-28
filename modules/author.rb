require 'json'

module AuthorModule
  def add_author(author)
    author_db = './json/authors.json'
    authors = []
    new_author = {
      'first_name' => author.multiplayer,
      'last_name' => author.last_played_at
    }

    authors = JSON.parse(File.read(author_db)) if File.exist?(author_db)

    authors << new_author
    File.write(author_db, JSON.pretty_generate(authors))
  end

  def fetch_authors
    author_db = './json/authors.json'
    authors = []

    if File.exist?(author_db)
      if File.empty?(author_db)
        authors
      else
        JSON.parse(File.read(author_db))
      end
    else
      authors
    end
  end
end
