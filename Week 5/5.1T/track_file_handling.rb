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

def read_track(music_file)
  # complete this function
	# you need to create a Track here.
  trackName = music_file.gets()  
  trackSoundPath = music_file.gets()  
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

# Open the file and read in the tracks then print them
def main()
  music_file = File.new("input.txt", "r") # open for reading
  if music_file
    tracks = read_tracks(music_file)     
    music_file.close   
    else     
    puts "Unable to open file to read!"   
    end 
  # Print all the tracks
  print_tracks(tracks)
end

main()