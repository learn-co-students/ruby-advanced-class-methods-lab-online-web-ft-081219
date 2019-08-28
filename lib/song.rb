class Song
  attr_accessor :name, :artist_name #
  @@all = [] #
  
  def initialize
    
    self
    @@all << self 
    
  end 
  
  def self.create
    song = self.new
  end 
  
  def self.new_by_name(name)

  end
  
  def self.create_by_name
    
  end

  def self.find_by_name(name)
    @@all.detect{ |songs| puts songs }
  end
  
  def self.find_or_create_by_name
  end
  
  def self.alphabetical
  end
  
  def self.new_from_file_name
  end 
  
  def self.create_from_filename
  
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
