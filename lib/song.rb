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
  
  def self.new_from_file_name(name)
    array = []
    name.split("-")
    
    
  binding.pry 
  end 
  
  def self.create_from_file_name(name)
    name = file.new
    
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
