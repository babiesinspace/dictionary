class Definition
  attr_reader :method_name, :explanation

  def initialize(method_name, explanation)
    @method_name = method_name
    @explanation = explanation
  end 

end 

class Dictionary

  def initialize(definitions_array=[])
    @library = {}
    if !definitions_array.empty?
      definitions_array.each do |term|
        @library[term.method_name] = term.explanation
      end
    end
  end 

  def get_info(enumerable)
    if 
      definition = @library[enumerable]
      puts definition
    else
      find_similar(enumerable)
    end 
  end 

  def see_index
    @library.keys.each { |term| puts term }
  end 

  def add_new(method_name, definition)
    definition = Definition.new(method_name, definition)
    @library[definition.method_name] = definition.explanation
    puts "#{method_name} has been successfully added with the following definition:"
    self.get_info(method_name)
  end 

  def find_similar(term)
    possibles = @library.keys.grep(/[#{term}]{3,}/)
    if !possibles.empty?  
      puts "Did you mean?"
      possibles.each { |t| puts t }
    else 
      puts "Sorry I didn't see that term or anything similar! Please check the index"
    end 
  end 
end 

