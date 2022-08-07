require './input_functions'



def main
  name = read_string("What is your name?")
  if name == "Duc" or name == "Khoa"
    puts name + " is an awesome name!"
  else
    puts name + " is a silly name"
  end
end

main
