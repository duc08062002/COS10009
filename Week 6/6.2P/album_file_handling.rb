module Genre
  POP, CLASSIC, JAZZ, ROCK = *1..4
end

$genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']

class Album

    attr_accessor :title, :artist, :genre, :tracks
  def initialize (title, artist, genre, tracks)
    @title = title
    @artist = artist
    @genre = genre
    @tracks = tracks
  end
end

class Track
    attr_accessor :name, :location

    def initialize (name, location)
        @name = name
        @location = location
    end
end



def read_tracks(music_file)
  count = music_file.gets().to_i()
  tracks =Array.new()
  index =0
  while index<count do
  track = read_track(music_file)
  tracks << track
  index +=1
end
  return tracks
end



def read_track(music_file)
  track_name = music_file.gets()  
  track_location = music_file.gets()  
  track = Track.new(track_name, track_location)  
  return track
end


def print_tracks(tracks)
  tracksCount = tracks.count
  index =0
  while index< tracksCount do
  print_track(tracks[index]) 
  index+=1
end
end


def print_track(track)
  puts(track.name)
  puts(track.location)
end



def read_album(music_file)
    album_title = music_file.gets
    album_artist = music_file.gets
    album_genre =  music_file.gets.to_i
    tracks = read_tracks(music_file)
    album = Album.new(album_title, album_artist, album_genre, tracks)
    return album
end



def print_album(album)
    puts (album.title.to_s)
    puts (album.artist.to_s)
    puts(album.genre.to_s)
    puts('Genre is ' + $genre_names[album.genre])
    print_tracks(album.tracks)
end



def main()
  music_file = File.new("album.txt", "r")
    if music_file
      album = read_album(music_file)    
      music_file.close   
      else     
      puts "Unable to open file to read!"   
      end 
      print_album(album)
end


main()