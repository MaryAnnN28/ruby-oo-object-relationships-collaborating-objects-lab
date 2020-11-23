
class MP3Importer
     attr_accessor :path


     def initialize(path)
          @path = path
     end
     
     # the Dir.glob accesses current directory
     # Then class each path arg that has a .mp3 filename
     # reformat file with gsub which takes out end of filename to only include song & artist into string. 

     def files
          song_files = Dir.glob("#{path}/*.mp3").collect { |file| file.gsub("#{path}/","") }
     end


     # calls Song.new_by_filename(file) method in song class
     # uses method above so that each file will be sent to 
     # that method is Song class. 
     def import
          files.each { |file| Song.new_by_filename(file) }
     end

            


end
