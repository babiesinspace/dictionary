require_relative 'dictionary.rb'

each = Definition.new("each", ".each is a Ruby method that can be called on an array. It takes a block of code and calls it once for each element, passing that element to the block. It returns the original array.")

map = Definition.new("map", ".map executes the given block for each element of the array, but returns a new array whose values are the return values of each iteration of the block. This does not manipulate the original array - add the bang operator (!) if that is the desired outcome.")

grep = Definition.new("grep", ".grep accepts a pattern (regex) and returns an array of every matching element in the enum. When a block is passed, the result of running that block on those matched elements is what is stored in the array.")

dictionary = Dictionary.new([each, map, grep])

if ARGV[0] == nil
  puts "Welcome to my Enumerable Dictionary! Please run me again, and after typing 'app.rb', please add one of the following:"
  puts "  - A term you would like to search"
  puts "  - 'index' to see a list of defined terms"
  puts "  - 'add' to add a definition"
elsif ARGV[0] == 'index'
  puts "You can search:"
  dictionary.see_index
elsif ARGV[0] == 'add'
  puts "What is the name of the method you would like to define?"
  method_name = STDIN.gets.chomp
  puts "Please enter a definition for #{method_name}"
  definition = STDIN.gets.chomp
  dictionary.add_new(method_name, definition)
else 
  term = ARGV[0]
  dictionary.get_info(term)
end 

#dictionary.see_index

#dictionary.get_info("eachl")