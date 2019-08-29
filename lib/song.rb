require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  # def intialize(name, artist_name)
  #   @name = name 
  #   @artist_name = artist_name
  # end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
     song = self.new 
       @@all << song
        song 
   end 
   
   def self.new_by_name(name) #=> CLASS CONSTRUCTOR
     song = self.create 
     song.name = name
     song 
   end 
   
   def self.create_by_name(name) #=> CLASS CONSTRUCTOR
     song = self.create 
     song.name = name 
     song 
   end 
   
   def self.find_by_name(name) #=> CLASS Finder
     @@all.detect{|s| s.name == name }
   end 
   
   def self.find_or_create_by_name(name)
    self.find_by_name(name) || create_by_name(name)
   end 
   
   def self.alphabetical
    # @@all.sort_by{ |a, b| a.name <=> b.name }
    # objects_array.sort! { |a, b|  a.attribute <=> b.attribute }
    @@all.sort_by{ |a| a.name } # => Sort by attribute(name) not by the object itself
   end 
  
   def self.new_from_filename(filename)
      splitted_filename =
      filename.split(" - ")
      artist_name = splitted_filename[0]
      song_name = splitted_filename[1].gsub(".mp3", "")
      # binding.pry
      song = self.new_by_name(song_name)
      song.artist_name = artist_name
      song 
   end
   
   def self.create_from_filename(filename)
           splitted_filename =
      filename.split(" - ")
      artist_name = splitted_filename[0]
      song_name = splitted_filename[1].gsub(".mp3", "")
      # binding.pry
      song = self.create_by_name(song_name)
      song.artist_name = artist_name
      song 
   end 
   
   def self.destroy_all 
     @@all = []
   end 
end 










