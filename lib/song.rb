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
    new_song=self.new
    new_song.save
    new_song
  end
  
  def self.new_by_name(name_string)
    new_song=self.new
    new_song.name=name_string
    new_song
  end
  
  def self.create_by_name(name_string)
    create.name=name_string
    self.find_by_name(name_string)
  end

  def self.find_by_name(name_string)
    self.all.find{|song|song.name==name_string}
  end

  def self.find_or_create_by_name(name_string)
    if self.find_by_name(name_string)
      self.find_by_name(name_string)
    else
      self.create_by_name(name_string)
    end
  end
  
  def self.alphabetical
    self.all.sort_by{|song|song.name}
  end
  
  def self.new_from_filename(file_name)
    holder=file_name.chomp(".mp3").split(" - ")
    new_song=self.new
    new_song.name=holder[1]
    new_song.artist_name=holder[0]
    new_song
  end
  
  def self.create_from_filename(filename)
    song_return=self.new_from_filename(filename)
    song_return.save
  end
  
  def self.destroy_all
    self.all.clear
  end

end
