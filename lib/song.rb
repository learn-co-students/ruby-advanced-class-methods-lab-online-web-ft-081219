require'pry'
class Song
  attr_accessor :name, :artist_name #
  @@all = [] #
  
  def initialize
    self
  end 
  
  def self.create
    song = self.new
    song.save
    song
  end 
  
  def self.new_by_name(name)
    songs = self.new
    songs.name = name
    songs
  end
  
  def self.create_by_name(name)
    songs = self.create
    songs.name = name
    songs
  end

  def self.find_by_name(name)
    @@all.detect{ |c| c.name== name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    
    #if self.find_by_name(name)
     # return self.find_by_name(name)
    #else
     # return self.create_by_name(name)
    #end 
  end 
  
  def self.alphabetical
    @@all.sort_by {|each| each.name} 
  end
  
  def self.new_from_filename(filename)
      splitted_filename = filename.split(" - ")
      artist_name = splitted_filename[0]
      song_name = splitted_filename[1]
    
      result = song_name.split(".")
      result_song= result[0]
      mp3 = result[1]
      
      song = self.create
      song.name = result[0]
      song.artist_name = splitted_filename[0]
      song
  end

  def self.create_from_file_name(filename)
    
    
  end 
  
  def self.destroy_all
    @@all = []
  end 
  
  def self.all   #
    @@all        #
  end            #
                 #
  def save       #
    self.class.all << self #
  end           #

end
