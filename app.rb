require_relative 'dictionary.rb'

each = Definition.new("each", ".each is a Ruby method that can be called on an array. It takes a block of code and calls it once for each element, passing that element to the block. It returns the original array.")

map = Definition.new("map", ".map executes the given block for each element of the array, but returns a new array whose values are the return values of each iteration of the block. This does not manipulate the original array - add the bang operator (!) if that is the desired outcome.")

grep = Definition.new("grep", ".grep accepts a pattern (regex) and returns an array of every matching element in the enum. When a block is passed, the result of running that block on those matched elements is what is stored in the array.")

inject = Definition.new("inject", ".inject combines all elements of the enumerable by applying a binary operation, specified by a block or a symbol that names a method or operator. Can be used to build or reduce arrays and hashes.\nExample:\n[5, 10, 20].inject(:+) => 35 \nSee also: reduce")

reduce = Definition.new("reduce", ".reduce combines all elements of the enumerable by applying a binary operation, specified by a block or a symbol that names a method or operator. Can be used to build or reduce arrays and hashes.\nExample:\n[5, 10, 20].reduce(:+) => 35 \nSee also: inject")

includ = Definition.new("include?", ".include?(obj) takes an object as a parameter and iterates through an enumerable - returns a boolean denoting whether or not any member of the enum equals the object. Equality is tested using ==")

find = Definition.new("find", ".find passes each entry in an enumerable to a block. It returns the first instance for which the block does not return 'false'. If no object matches, returns 'nil'.\nSee also: find_all")

find_all = Definition.new("find_all", ".find_all passes each entry in an enumerable to a block. It returns an array populated with any instances for which the block does not return 'false'. If no object matches, returns 'nil'.\nSee also: find, select")

selec = Definition.new("select", ".select passes each entry in an enumerable to a block. It returns an array populated with any instances for which the block returns a true value. If no object matches, returns 'nil'.\nSee also: find, reject")

reject = Definition.new("reject", ".reject passes each entry in an enumerable to a block. It returns an array populated with any instances for which the block returns a false value.")

dictionary = Dictionary.new([each, map, grep, inject, reduce, includ, find, find_all, selec, reject])
#if the user doesn't run any commands, tell them the commands they can run
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