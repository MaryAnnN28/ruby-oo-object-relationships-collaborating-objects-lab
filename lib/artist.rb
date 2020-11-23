class Artist
     attr_accessor :name

     @@all = []
     
     def initialize(name)
          @name = name
          @@all << self
     end

     # class method should return all artist instances 
     def self.all
          @@all
     end

     # instance method exists to tell a passed in song instance it belongs to this artist instance. 
     def add_song(song)
          song.artist = self 
     end

     # instance method returns an array of all songs that belong to Artist instance should get all existing Song instances from Song & only selects the ones that are associated with this Artist instance (self)
     def songs
          Song.all.select { |song| song.artist == self }
     end

     def self.find_or_create_by_name(name)
          self.all.find { |artist| artist.name == name } || Artist.new(name)
     end

     def print_songs
          self.songs.each { |song| puts song.name }
     end


end
