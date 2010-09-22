$: << File.join(File.dirname(__FILE__))
require 'rubygems'
require 'song'
require 'json'

# Let's re-open the Song class and add a to_json method
class Song
  def to_json
    {
      :title => @title,
      :artist => @artist,
      :length => @length.to_f
    }.to_json
  end
end

smells_like_teen_spirit = Song.new('Smells Like Teen Spirit', 'Nirvana', 5.01)
puts smells_like_teen_spirit.title
puts smells_like_teen_spirit.to_s
puts smells_like_teen_spirit.to_json
