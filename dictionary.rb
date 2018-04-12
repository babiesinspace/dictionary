class Definition
  attr_reader :method_name, :explanation

  def initialize(method_name, explanation)
    @method_name = method_name
    @explanation = explanation
  end 

end 

class Dictionary
  attr_reader :library
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
end 

each = Definition.new("each", ".each is a Ruby method that can be called on an array. It takes a block of code and calls it once for each element, passing that element to the block.")

dictionary = Dictionary.new([each])

puts dictionary.get_info("each")