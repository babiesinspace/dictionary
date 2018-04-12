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

  def get_info(ennumerable)
    definition = @library[ennumerable]
    puts definition
  end 

  def see_index
    @library.keys.each { |term| puts term }
  end 

  def add_new(method_name, definition)
    definition = Definition.new(method_name, definition)
    @library[definition.method_name] = definition.explanation
    puts "#{method_name} has been successfully added"
  end 
end 

each = Definition.new("each", ".each is a Ruby method that can be called on an array. It takes a block of code and calls it once for each element, passing that element to the block.")

dictionary = Dictionary.new([each])

dictionary.see_index