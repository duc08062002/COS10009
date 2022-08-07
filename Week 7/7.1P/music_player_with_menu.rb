require './input_functions'

module Genre
    POP, CLASSIC, JAZZ, ROCK = *1..4
  end
  
  $genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']
  $albums_file = nil
  class Album
  
      attr_accessor :artist, :title, :genre, :tracks
    def initialize (artist, title, genre, tracks)
      @artist = artist
      @title = title
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


# 1 READ IN ALBUMS
# 1.1 READ ALBUMS, ALBUM, TRACKS AND TRACK
def read_track music_file
	name = music_file.gets.chomp
    location = music_file.gets
    track = Track.new(name, location)
    return track
end

def read_tracks music_file
	count = music_file.gets().to_i
  	tracks = Array.new
        while (0 < count)
            track = read_track(music_file)
            tracks << track
            count -= 1
        end
	return tracks
end

def read_album music_file
		album_artist = music_file.gets
		album_title = music_file.gets
		album_genre = music_file.gets.to_i
	  	tracks = read_tracks(music_file) 
	 	album = Album.new(album_artist, album_title, album_genre, tracks)
	  	return album
  end

def read_albums music_file
	count = music_file.gets().to_i
	albums = Array.new
        while (0 < count)
            album = read_album(music_file)
            albums << album
            count -= 1
        end
	return albums
end








# 2 DISPLAY ALBUMS
def display_albums(albums)
    finished = false
    begin
    puts 'Display Albums:'
    puts '1 - Display All'
    puts '2 - Display Genre'
    choice = read_integer_in_range("Option: ", 1, 2)
    puts (' ')
        case choice
        when 1
            print_albums(albums)
        when 2
            print_album_genres(albums)
        else
            puts 'Please select again'
        end
    finished = read_string('Press ENTER to continue...')
    end until finished
end

# 2.1 PRINT ALBUMS, ALBUM, TRACKS AND TRACK
def print_track track
	puts('Track title is: ' + track.name)
  	puts('Track file location is: ' + track.location)
end

def print_tracks tracks
	count = tracks.length
	i = 0
	while (i < count)
	  print_track(tracks[i]) 
	  i += 1
	end
end

def print_album album
    puts ('Album title: ' + album.title.to_s)
         puts ('Artist name: ' + album.artist.to_s)
         puts('Genre: ' + $genre_names[album.genre])
         puts(' ')
end

def print_albums albums
	count = albums.length
	i = 0
    while (i < count)
        puts ('Album ID: ' + (i+1).to_s)
	  print_album(albums[i]) 
	  i += 1
	end
end

# 2.2 PRINT ALBUM GENRE
def print_album_genres albums
    puts "Select Genre"
    puts "1 - Pop"
    puts "2 - Classic"
    puts "3 - Jazz"
    puts "4 - Rock"
    search_genre = read_integer_in_range('Option: ', 1, 4)
    puts ' '
    i = 0
    while i < albums.length
        if search_genre == albums[i].genre
            puts ('Album ID: ' + (i+1).to_s)
            print_album(albums[i])
        end
        i += 1
    end
end







# 3 PLAY ALBUM
def play_tracks tracks 
    if tracks.count >0
    track_id = read_integer_in_range('Play Track: ', 1, tracks.count)
    print 'Playing '
    print_title_track(tracks[track_id - 1])
    else
    end
end


def play_album(albums)
    album = nil
      puts 'Play Albums:'
      album = search_by_id(albums)
      play_tracks(album.tracks)
      if album.tracks.count>0
      print ' from album '
      print_album_title(album)
      else
      end
      puts ' '
      puts "(Delay for some seconds as the requirement said)"
      puts' '
      sleep (3)
      stop = read_string('Press ENTER to continue...')
end

# 3.1 PLAY BY ID

def print_title_track track
	puts(track.name)
end

def print_title_tracks tracks
	count = tracks.length
    puts 'Track List: '
	i = 0
    while (i < count)
      print (i+1).to_s 
      print ' - '
	  print_title_track(tracks[i]) 
	  i += 1
	end
end

def print_album_title_and_tracks album
    if album.tracks.count >0 
    print_title_tracks(album.tracks)
    else
        puts 'There is no track in this album' 
    end
end

def print_albums_id_tracks albums
	count = albums.length
	i = 0
    while (i < count)
      print ' ID is ' + i.to_s + " for: "
      print_album_title_and_tracks(albums[i-1]) 
	  i += 1
	end
end

def print_album_title album
    puts  album.title.to_s
end


def search_by_id(albums)
    id = read_integer_in_range('Enter Album ID: ', 1, albums.count)
    print_album_title_and_tracks(albums[id-1])
    return albums[id-1]
end





#4 UPDATE ALBUMS
def search_by_ids(albums)
    id = read_integer_in_range('Enter Album ID: ', 1, albums.count  )
    index = search_for_album_ids(albums, id)
    return albums[id-1]
end

def update_album_genre album
    puts('The current album genre is: ', $genre_names[album.genre])
    puts('Select New Genre')
    puts "1 - Pop"
    puts "2 - Classic"
    puts "3 - Jazz"
    puts "4 - Rock"
    new_genre = read_integer('Option: ')
    album.genre = new_genre
end

def update_album_title album
    puts('The current album title is: ', album.title)
    title = read_string('Enter a new title:')
    album.title = title
end

def search_for_album_ids(albums, albumss)
    index =0
    found_index = -1
    while (index< albums.length)
    if(albums[index] == albumss)
    found_index = index
    end
    index+=1
    end
    return found_index
    end
        
def update_album album
    finished = false
    begin
      puts 'Update Albums:'
      puts '1 - Update Album Title'
      puts '2 - Update Album Genre'

      choice = read_integer_in_range("Option: ", 1, 2)
          case choice
          when 1
              update_album_title album
          when 2
              update_album_genre album
          end
      finished = read_string('Press ENTER...')
    end until finished
end

def update_albums albums
    finished = false
    album = nil
    begin
      puts 'Update Albums:'
      puts "Update an album's info."
      albumss = search_by_ids(albums)
      
      update_album(albumss)
              puts "Updated Album Info"
              puts ' '
              index = search_for_album_ids(albums, albumss)
              if index > -1
                puts ('Album ID: ' + (index+1).to_s)
              else
               puts "Entry not Found"
              end
      print_album(albumss)
      finished = read_string('Press ENTER to continue...')
    end until finished
end




# MAIN MENU
def main_menu_albums
    finished = false
    begin
     puts('TEXT MUSIC PLAYER')
      puts(' ')
      puts('     Main Menu:')
      puts('1 - Read in Albums')
      puts('2 - Display Albums')
      puts('3 - Play Album')
      puts('4 - Update an existing Album')
      puts('5 - Exit')
    choice = read_integer_in_range("Option: ", 1, 5)
    puts (' ')
        case choice
        when 1
            puts('Enter Album')
            puts('Enter the file name of the music library.')
            $albums_file = read_string("Enter file name: (albums.txt in case you don't know)")
            music_file = File.new($albums_file, "r")
            if music_file 
                albums = read_albums(music_file)
                music_file.close()
                puts 'Music Library loaded.'
                read_string("Press ENTER...")
                else
                puts "Unable to open file to read!"   
                end 
         when 2
            if music_file
            display_albums(albums)
            else
            puts 'No Music Library loaded'
            back = read_string("Press ENTER...")
            end
        when 3
            if music_file
            play_album(albums)
            else
            puts 'No Music Library loaded'
            back = read_string("Press ENTER...")
            end
        when 4
            if music_file
            update_albums(albums)
            else
            puts 'No Music Library loaded'
            back = read_string("Press ENTER...")
            end    
        when 5
            puts 'Goodbye :)'
            finished = true
        else
            puts 'Please select again'
        end
    end until finished
end

def main
    main_menu_albums
end

main()