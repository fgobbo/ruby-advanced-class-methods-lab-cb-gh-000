class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    song = find_by_name(name)
    return song if song
    create_by_name(name) unless song
  end

  def self.alphabetical
    all.sort do |song_1, song_2|
      song_1.name <=> song_2.name
    end
  end

  def self.new_from_filename(filename)
    artist, name = filename.match(/(.+)\s-\s(.+)\..+/).captures
    song = find_or_create_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    all.clear
  end
end
