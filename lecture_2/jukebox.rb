$: << File.join(File.dirname(__FILE__))
require 'song'

puts Song.class_method
smells_like_teen_spirit = Song.new('Smells Like Teen Spirit', 'Nirvana', 5.01)
puts smells_like_teen_spirit.to_s
puts smells_like_teen_spirit.to_json
