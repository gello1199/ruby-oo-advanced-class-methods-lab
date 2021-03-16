require "pry"
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
    song = self.new #instantiates new song
    song.save #saves song to the save method above and shovels into @@all
    song #returns new song
  end

  def self.new_by_name(name)
    song = self.new #instantiates new song
    song.name = name #sets the name
    song #returns the song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name} #iterates over individual instance is a song. Sort by sort.name
  end

  def self.new_from_filename(filename)
    song = self.new
    split_file = filename.chomp(".mp3").split(" - ")
    song.name = split_file[1]
    song.artist_name = split_file[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.create
    split_file = filename.chomp(".mp3").split(" - ")
    song.name = split_file[1]
    song.artist_name = split_file[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
  
end
