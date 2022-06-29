require 'json'

module SourceModule
  def create_source
    print 'Source:'
    source_name = gets.chomp
    Source.new(source_name)
  end

  def list_all_sources
    @sources = []
    if @sources.any?
      puts ''
      puts 'Here are the sources: '
      @sources.each_with_index { |source, index| puts "#{index}) ID: #{source.id}, Name: '#{source.name}'" }
      puts ''
    else
      puts 'No source details to show'
    end
  end

  def load_sources
    file = 'sources.json'

    if File.exist? file
      File.open(file)
      JSON.parse(File.read(file)).map do |source|
        new_source = Source.new(source['name'])
        new_source.id = source['id']
        new_source.items = source['items']
        @sources.push(new_source)
      end
    else
      File.new(file, 'w') []
    end
  end
end
