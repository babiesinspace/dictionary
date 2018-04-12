class Definition
  attr_reader :method_name, :explanation

  def initialize(method_name, explanation)
    @method_name = method_name
    @explanation = explanation
  end 

end 

class Dictionary

  #initialize expects an array of definition instances, but will add an empty one if nothing is passed
  def initialize(definitions_array=[])
    @library = {}
    #if an array is passed in, call the reader methods for definition and use them to populate the library. Each key is the method name, each value its definition
    if !definitions_array.empty?
      definitions_array.each do |term|
        @library[term.method_name] = term.explanation
      end
    end
  end 

  def get_info(enumerable)
    #check if the term being searched is in the dictionary. If so, return the definition
    if @library.has_key?(enumerable)
      definition = @library[enumerable]
      puts definition
    #otherwise, run the find similar method
    else
      find_similar(enumerable)
    end 
  end 

  def see_index
    #list each key (method name) held in the dictionary
    @library.keys.each { |term| puts term }
  end 

  def add_new(method_name, definition)
    #create a new definition instance
    definition = Definition.new(method_name, definition)
    #add it to the dictionary
    @library[definition.method_name] = definition.explanation
    #show the user what they added
    puts "#{method_name} has been successfully added with the following definition:"
    self.get_info(method_name)
  end 

  def find_similar(term)
    #search through the method names to find similar method names (searches the list of names for any with 3 or more consecutive character matches)
    possibles = @library.keys.grep(/[#{term}]{3,}/)
    #if there are any matches, list them
    if !possibles.empty?  
      puts "Did you mean?"
      possibles.each { |t| puts t }
    else 
      #otherwise, tell them to search the index
      puts "Sorry I didn't see that term or anything similar! Please check the index"
    end 
  end 
end 

