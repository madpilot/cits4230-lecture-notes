class Song
  attr_accessor :title, :artist, :length, :genre

  def initialize(title, artist, length, options = {})
    @title = title
    @artist = artist
    @length = length
  end

  def to_s
    "#{@title} by #{@artist}"
  end

  def to_i
    @length.to_i
  end

  def to_f
    @length
  end
end
