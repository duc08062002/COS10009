require './input_functions'

# Task 6.1 T - use the code from 5.1 to help with this

class Track
	attr_accessor :name, :location

	def initialize (name, location)
		@name = name
		@location = location
	end
end

# Returns an array of tracks read from the given file
def read_tracks(music_file)

  count = music_file.gets().to_i()
  tracks =Array.new()

  # Put a while loop here which increments an index to read the tracks
  index =0
  while index<count do
  track = read_track(music_file)
  tracks << track
  index +=1
end
  return tracks

end

# reads in a single track from the given file.

def read_track(a_file)
  # complete this function
	# you need to create a Track here.
  trackName = a_file.gets()  
  trackSoundPath = a_file.gets()  
  track = Track.new(trackName, trackSoundPath)  
  return track
end


# Takes an array of tracks and prints them to the terminal
def print_tracks(tracks)

  # Use a while loop with a control variable index
  # to print each track. Use tracks.length to determine how
  # many times to loop.
  tracksCount = tracks.count
  index =0
  while index< tracksCount do
  # Print each track use: tracks[index] to get each track record
  print_track(tracks[index]) 
  index+=1
end
end
# Takes a single track and prints it to the terminal
def print_track(track)
  puts(track.name)
	puts(track.location)
end


# search for track by name.
# Returns the index of the track or -1 if not found
def search_for_track_name(tracks, search_string)

# Put a while loop here that searches through the tracks
# Use the read_string() function from input_functions.
# NB: you might need to use .chomp to compare the strings correctly
index =0
found_index = -1
while (index< tracks.length)
if(tracks[index].name.chomp == search_string)
found_index = index
end
index+=1
end
return found_index
end



# Put your code here.





# Reads in an Album from a file and then prints all the album
# to the terminal

def main()
  	a_file = File.new("album.txt", "r")
	 if a_file
    tracks = read_tracks(a_file)     
    a_file.close   
    else     
    puts "Unable to open file to read!"   
    end 
print_tracks(tracks)
  	search_string = read_string("Enter the track name you wish to find: ").chomp
  	index = search_for_track_name(tracks, search_string)
  	if index > -1
   		puts "Found " + tracks[index].name + " at " + index.to_s()
  	else
    	puts "Entry not Found"
  	end
end

main()
