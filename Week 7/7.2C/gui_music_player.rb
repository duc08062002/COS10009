require 'rubygems'
require 'gosu'

TOP_COLOR = Gosu::Color.new(0xFF1EB1FA)
BOTTOM_COLOR = Gosu::Color.new(0xFF1D4DB5)

module ZOrder
  BACKGROUND, PLAYER, UI = *0..2
end

module Genre
  POP, CLASSIC, JAZZ, ROCK = *1..4
end

$genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']

class ArtWork
	attr_accessor :bmp

	def initialize (file)
		@bmp = Gosu::Image.new(file)
	end
end

# Put your record definitions here

class Track
	attr_accessor :name, :location
	def initialize (name, location)
		@name = name
		@location = location
	end
end

class Album
	attr_accessor :title, :artist, :genre, :tracks
	def initialize (title, artist, genre, tracks)
		@title = title
		@artist = artist
		@genre = genre
		@tracks = tracks
	end
end

class MusicPlayerMain < Gosu::Window

	def initialize
	    super 600, 800
	    self.caption = "Music Player"
		@background = BOTTOM_COLOR
        @player = TOP_COLOR
		@music_font = Gosu::Font.new(15)
		@title_font = Gosu::Font.new(20)

        @play = Gosu::Image.new("images/play.png")
		@pause = Gosu::Image.new("images/pause.png")
		@next = Gosu::Image.new("images/next.png")
		@stop = Gosu::Image.new("images/stop.png")

		
		@album1 = Gosu::Image.new("images/album1.png")
		@album2 = Gosu::Image.new("images/album2.png")
		@album3 = Gosu::Image.new("images/album3.png")
		@album4 = Gosu::Image.new("images/album4.png")
		@album_selection = "albums/album1.txt"
		@index =0
		# Reads in an array of albums from a file and then prints all the albums in the
		# array to the terminal
	end

  # Put in your code here to load albums and tracks
def read_album(music_file)
	album_title = music_file.gets.chomp
	album_artist = music_file.gets.chomp
	album_genre = music_file.gets.chomp.to_i
	tracks = read_tracks(music_file)
	album = Album.new(album_title, album_artist, album_genre, tracks)
end

def read_tracks(music_file)
	tracks = Array.new()
	count = music_file.gets().to_i
	index = 0

	while (index < count)
		track = read_track(music_file)
        tracks << track
		index += 1
	end
	return tracks
end

def read_track(music_file)
	name = music_file.gets.chomp
	location = music_file.gets()
	track = Track.new(name, location)
	return track
end


def print_tracks(tracks)
	index = 0
	xpos = 20
	xpos2 = 330
	ypos = 240
	while (index < tracks.length)
		ypos += 20
		print_track(tracks[index], xpos2, xpos, ypos, index).to_s
		index += 1
	end
end

def print_track(track, xpos2, xpos, ypos, index)
	@music_font.draw("#{index}: #{track.name}", xpos, ypos, ZOrder::UI, 1.0, 1.0, Gosu::Color::BLACK)
	@music_font.draw("#{index}: #{track.location}", xpos2, ypos, ZOrder::UI, 1.0, 1.0, Gosu::Color::BLACK)
end

def print_album(album)
	@music_font.draw("Album title:  #{album.title.to_s}", 20, 180, ZOrder::UI, 1.0, 1.0, Gosu::Color::RED)
	@music_font.draw("Artist name:  #{album.artist.to_s}", 20, 200, ZOrder::UI, 1.0, 1.0, Gosu::Color::RED)
	@music_font.draw("Album genre:  #{$genre_names[album.genre]}", 20, 220, ZOrder::UI, 1.0, 1.0, Gosu::Color::RED)
	@music_font.draw("Tracks Name: ", 20, 240, ZOrder::UI, 1.0, 1.0, Gosu::Color::BLACK)
	@music_font.draw("Tracks File Location: ", 330, 240, ZOrder::UI, 1.0, 1.0, Gosu::Color::BLACK)
	print_tracks(album.tracks)
end

def play_album(album)
	play_tracks(album.tracks)
end

def play_tracks(tracks)
		play_track(tracks)
end

def play_track(track)
	@music_font.draw("Now Playing: #{track[0].name}", 200, 650, ZOrder::UI, 1.0, 1.0, Gosu::Color::BLACK)
end

def next_album(album, index)
	next_tracks(album.tracks, index)
end
def next_tracks(tracks, index)
	if index< tracks.length
	next_track(tracks, index) 
	else
	@music_font.draw("This is the last Track", 200, 650, ZOrder::UI, 1.0, 1.0, Gosu::Color::BLACK)
	@index =0
	end
end
def next_track(track, index)
	@music_font.draw("Now playing: #{track[index].name}", 200, 650, ZOrder::UI, 1.0, 1.0, Gosu::Color::BLACK)
end

  # Detects if a 'mouse sensitive' area has been clicked on
  # i.e either an album or a track. returns true or false


# Draw a coloured background using TOP_COLOR and BOTTOM_COLOR

	def draw_background
		Gosu.draw_rect(0, 0, 600, 800, @background, ZOrder::BACKGROUND, mode=:default)
        Gosu.draw_rect(10, 10, 580, 780, @player, ZOrder::PLAYER, mode=:default)
		draw_album()
	end

	def draw_album_info(album)
		print_album(album)
		@play.draw(200, 600, ZOrder::UI, scale_x = 0.20, scale_y = 0.20)
		@pause.draw(240, 600, ZOrder::UI, scale_x = 0.20, scale_y = 0.20)
		@next.draw(280, 600, ZOrder::UI, scale_x = 0.20, scale_y = 0.20)
		@stop.draw(320, 600, ZOrder::UI, scale_x = 0.20, scale_y = 0.20)

		if ((mouse_x > 200 and mouse_x < 219) and (mouse_y > 600 and mouse_y < 626))
			Gosu.draw_rect(199, 599, 21, 29, Gosu::Color::RED, ZOrder::PLAYER, mode=:default)
		end
		if ((mouse_x > 240 and mouse_x < 263) and (mouse_y > 600 and mouse_y < 624))
			Gosu.draw_rect(239, 599, 26, 27, Gosu::Color::RED, ZOrder::PLAYER, mode=:default)
		end
		if ((mouse_x > 280 and mouse_x < 301) and (mouse_y > 600 and mouse_y < 625))
			Gosu.draw_rect(279, 599, 23, 27, Gosu::Color::RED, ZOrder::PLAYER, mode=:default)
		end
		if ((mouse_x > 320 and mouse_x < 344) and (mouse_y > 600 and mouse_y < 621))
			Gosu.draw_rect(319, 599, 26, 23, Gosu::Color::RED, ZOrder::PLAYER, mode=:default)
		end
	end

	def draw_album()
		@album1.draw(15, 50, ZOrder::UI, scale_x = 1, scale_y = 1)
		@album2.draw(165, 50, ZOrder::UI, scale_x = 1, scale_y = 1)
		@album3.draw(315, 50, ZOrder::UI, scale_x = 1, scale_y = 1)
		@album4.draw(465, 50, ZOrder::UI, scale_x = 1, scale_y = 1)
	
		if ((mouse_x > 25 and mouse_x < 145) and (mouse_y > 50 and mouse_y < 170))
			Gosu.draw_rect(14, 49, 121, 121, Gosu::Color::YELLOW, ZOrder::PLAYER, mode=:default)
			@album_selection = "albums/album1.txt"
		end
	
		if ((mouse_x > 165 and mouse_x < 285) and (mouse_y > 50 and mouse_y < 170))
			Gosu.draw_rect(164, 49, 121, 121, Gosu::Color::YELLOW, ZOrder::PLAYER, mode=:default)
			@album_selection = "albums/album2.txt"
		end
	
		if ((mouse_x > 315 and mouse_x < 435) and (mouse_y > 50 and mouse_y < 170))
			Gosu.draw_rect(314, 49, 121, 121, Gosu::Color::YELLOW, ZOrder::PLAYER, mode=:default)
			@album_selection = "albums/album3.txt"
		end
	
		if ((mouse_x > 465 and mouse_x < 585) and (mouse_y > 50 and mouse_y < 170))
			Gosu.draw_rect(464, 49, 121, 121, Gosu::Color::YELLOW, ZOrder::PLAYER, mode=:default)
			@album_selection = "albums/album4.txt"
		end
		music_file = File.new(@album_selection, "r")
		album = read_album(music_file)
		draw_album_info(album)
		
	end

	def draw
		@title_font.draw("GUI MUSIC PLAYER", 220, 20, ZOrder::UI, 1.0, 1.0, Gosu::Color::RED)
		draw_background
		if Gosu.button_down? Gosu::MsLeft
			music_file = File.new(@album_selection, "r")
			album = read_album(music_file)
	    	button = area_clicked(mouse_x, mouse_y)
			index = 0
			case button
			when 1
				play_album(album)
			when 2
				@music_font.draw("Pausing", 245, 650, ZOrder::UI, 1.0, 1.0, Gosu::Color::BLACK)
			when 3 
				next_album(album, @index)
			when 4
				@music_font.draw("Stop Playing", 230, 650, ZOrder::UI, 1.0, 1.0, Gosu::Color::BLACK)
			end
	    end
		@music_font.draw("How To Use:", 30, 670, ZOrder::UI, 1.0, 1.0, Gosu::Color::YELLOW)
		@music_font.draw("Choose album by pointing at the album image", 30, 690, ZOrder::UI, 1.0, 1.0, Gosu::Color::WHITE)
		@music_font.draw("Press button to play, pause, stop track ", 30, 710, ZOrder::UI, 1.0, 1.0, Gosu::Color::WHITE)
		@music_font.draw("Hold the next button to play the next track", 30, 730, ZOrder::UI, 1.0, 1.0, Gosu::Color::WHITE)

	end
	def update
		if Gosu.button_down? Gosu::MsLeft
			button = area_clicked(mouse_x, mouse_y)
			case button
			when 3
				@index += 1
				sleep(0.5)
			end
		end
	end

	def needs_cursor?; true; end

	def area_clicked(mouse_x, mouse_y)
		if ((mouse_x > 200 and mouse_x < 219) and (mouse_y > 600 and mouse_y < 626))
			return 1
		end
		if ((mouse_x > 240 and mouse_x < 263) and (mouse_y > 600 and mouse_y < 624))
			return 2
		end
		if ((mouse_x > 280 and mouse_x < 301) and (mouse_y > 600 and mouse_y < 625))
			return 3
		end
		if ((mouse_x > 320 and mouse_x < 344) and (mouse_y > 600 and mouse_y < 621))
			return 4
		end
	  end

	def button_down(id)
		if id == Gosu::KB_ESCAPE
			close
		else
			super
		end
end
end

# Show is a method that loops through update and draw

MusicPlayerMain.new.show if __FILE__ == $0
