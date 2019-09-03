class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
   song = self.new
   @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end
  
  def self.find_by_name(name)
     @@all.find{|songs|songs.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by{ |s| s.name}
  end
  
  def self.new_from_filename(file)
    song = self.new
    song.name = file.split(" - ")[1].split(".")[0]
    song.artist_name = file.split(" - ")[0]
    song
  end
  
  def self.create_from_filename(file)
    song = self.new
    song.name = file.split(" - ")[1].split(".")[0]
    song.artist_name = file.split(" - ")[0]
    @@all << song
  end
  
  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end
  
  def save
    self.class.all << self
  end

end
