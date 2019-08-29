require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  # def intializer(name, artist_name)
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
     song = self.new 
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
     @@all.sort_by{ |a, b| a <=> b }
   end 
   
end 











