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
     
     # parse filename to find artist name, song name. This converts to array of individaul elements.
     # Then create new song instance using the file & where it is indexed in file
     # Associate new song with an artist (use artist attr accessor to assign this)
     # We also used the self.find_or_create_by_name method in artist class
     # return new song instance 

     def self.new_by_filename(file)
          file = file.split(" - ")
          song = Song.new(file[1])
          artist = Artist.find_or_create_by_name(file[0])
          song.artist = artist
          song
     end

     def artist_name=(artist)
          artist = Artist.find_or_create_by_name(artist)
          self.artist = artist
     end



end
