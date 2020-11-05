require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
#class methods dont have arguments 
  def self.create
    song = self.new #make an variable for a new song(instantiates)
    song.save #saves song in the @@all array
    song #return the song
  end

  def self.new_by_name(name)#has argument for the name
    song = self.new#creates a new song
    song.name = name#set name property
    song #return the song
    #alternative answer
    #   song = song.create
    #   song.name =name
  end

  def self.create_by_name(name)
    song = self.new#creates a new song
    song.name = name#set name property
    song.save #save the song
    song #return the song
    
  end

  def self.find_by_name(name)
    # binding.pry
    #we need to itterate through the array and find the song
    @@all.detect { |song| song.name == name }
    #itterates through all the songs then looks to see if the name passed in we return it otherwise return nil
    #is the same as a songs name that already exists if it does then return the song
    #detect/find(same thing) iterates through 
    #the array and returns the first match it finds otherwise returns nil
  end

  def self.find_or_create_by_name(name)
    #(Song (class)).find_by_name(*(any args)) expects you to use that method
    # if self.find_by_name(name)
    #   self.find_by_name(name)
    # else self.create_by_name(name)
    # end
    self.find_by_name(name) || self.create_by_name(name)
    #it's either true or its not
    #if the song is in the array it will return a song so it will return true 
    #if it doesn't it will return nil(false) and then create it by name
  end

  def self.alphabetical
    #use sort_by 
    #you can use sort_by to chose what you want to sort by
    @@all.sort_by {|song| song.name}
    #alternative way
    # self.all.sort_by(&:name)
  end

  def self.new_from_filename(filename)
    song = self.new #first ting we want to do is initialize
    split_filename = filename.chomp(".mp3").split(" - ") #make sure to have spaces
    song.name = split_filename[1] #get song name
    song.artist_name = split_filename[0] #get artist name
    song
  end

  def self.create_from_filename(filename)
    song = self.new #first ting we want to do is initialize
    split_filename = filename.chomp(".mp3").split(" - ") #make sure to have spaces
    song.name = split_filename[1] #get song name
    song.artist_name = split_filename[0] #get artist name
    song.save
    song
  end

  def self.destroy_all 
    @@all.clear
  end

  def save
    self.class.all << self
  end

end

