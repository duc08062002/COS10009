def write_data_to_file(file_name)
a_file = File.new(file_name, "w") # open for writing
if a_file # if nil this test will be false
a_file.puts('5')
a_file.puts('Fred')
a_file.puts('Sam')
a_file.puts('Jill')
a_file.puts('Jenny')
a_file.puts('Zorro')
a_file.close
else
puts "Unable to open file to write!"
end
end


def read_data_from_file(name)
  a_file=File.new(name,"r")
if a_file
  count = a_file.gets.to_i
  index=0
  while (index<count) 
  puts a_file.gets
  index+=1
end
   a_file.close 
else
  puts "no file"
end
end

def main
  # open for writing
  
  write_data_to_file("mydata.txt")
  

   # open for reading   
  read_data_from_file("mydata.txt")
   
end

main