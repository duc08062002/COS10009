require './input_functions'



def print_silly_name(name)
	puts(name + " is a")
	# complete the code needed here - you will need a loop.
	i=0
	while i<60
	print 'silly '
	i= i+1
	end
	puts 'name!'
end


def main
  name = read_string("What is your name?")
  if name == "Duc" or name == "Khoa"
    puts name + " is an awesome name!"
  else
    print_silly_name(name)
  end
end

main()
