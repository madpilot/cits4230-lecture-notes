$: << File.join(File.dirname(__FILE__))
require 'rubygems'
require 'song'
require 'json'

# First, we re-open the string class and monkey patch in a & method that is sort of like a 
# binary addition, but for strings, and adds a pad method adds spacesd to a string to bring it up
# to a certain length. It also truncates the string to that length
class String
  def pad(length)
    return (self & (' ' * length))[0..(length - 1)]
  end

  def &(str)
    output = str
    self.split('').each_with_index { |chr, index| output[index..index] = chr }
    output
  end
end

# This module has all the attributes of an ID3 tag. It adds a "to_id3" method
# to the class that it is mixed in to.
#
# Finally it adds a class method called has_id3?
module ID3Tag
  attr_accessor :header, :title, :artist, :album, :year, :comment, :zero_byte, :track, :genre

  def self.included(base)
    base.class_eval do
      def self.has_id3?
        true
      end
    end
  end

  def to_id3
    output = 'TAG'
    output += title.to_s.pad(30)
    output += artist.to_s.pad(30)
    output += album.to_s.pad(30)
    output += year.to_s.pad(4)
    output += comment.to_s.pad(28)
    output += track.to_s.pad(2) if zero_byte
    output += zero_byte ? '1' : '0'
    output += track.to_s.pad(1) unless zero_byte
    output += genre.to_s.pad(1)
  end
end

# Now, let's reopen the song class, mixin ID#Tag and override initialize to assign
# the additional methods supplied by the options hash
class Song
  include ID3Tag
  
  def initialize(title, artist, length, options = {})
    @title = title
    @artist = artist
    @length = length
    @header = options.delete(:header)
    @album = options.delete(:album)
    @year = options.delete(:year)
    @comment = options.delete(:comment)
    @zero_byte = !!options.delete(:zero_byte)
    @track = options.delete(:track)
    @genre = options.delete(:genre)
  end
end

# Finally, we'll also extend the Song class and set self.has_id? to false
class MySong < Song
  def self.has_id3?
    return false
  end
end

puts "Has ID3? " + (Song.has_id3? ? 'Yes' : 'No')
song = Song.new('Smells like Teen Spirit', 'Nirvana', 5.01, :album => 'Nevermind')

puts song.title
puts "'" + song.to_id3 + "'"
puts "Length: #{song.to_id3.length}"
puts ""
song = MySong.new('First Call', 'NOFX', 2.33, :album => 'Coaster')
puts "Has ID3? " + (MySong.has_id3? ? 'Yes' : 'No')
puts song.title
puts "'" + song.to_id3 + "'"
puts "Length: #{song.to_id3.length}"
