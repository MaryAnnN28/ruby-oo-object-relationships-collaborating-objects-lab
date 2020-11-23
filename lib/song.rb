class Song
     attr_accessor :name, :artist #relies on artist class 

     @@all = []

     def initialize(name)
          @name = name
          @@all << self
     end

     def self.all
          @@all
     end
     
     # 1) parse file to separate artist name, song name, extension. 
     #     This converts to an array of individaul elements stored in file = 
     # 2) Then create new song instance using the file & where it is indexed in file
     # 3) We also used the class method <self.find_or_create_by_name> in artist class
     # 4) Associate new song with an artist (use artist attr accessor to assign this at top)
     # 5) return new song instance 

     def self.new_by_filename(file)
          file = file.split(" - ")
          song = Song.new(file[1])
          artist = Artist.find_or_create_by_name(file[0])
          song.artist = artist
          song
     end

     # 1) Turn the artist's name as a string into an Artist object
     #    First get instance of the Artist class that represents that artist
     #    We chose to use an already existing class method in Artist class
     #    that we created <self.find_or_create_by_name>. Since we're in the 
     #    song class, we call the class Artist, instead of self. 
     # 2) Assign the song to the artist 
     def artist_name=(artist)
          artist = Artist.find_or_create_by_name(artist)
          self.artist = artist
     end



end
