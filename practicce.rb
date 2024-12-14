def double_vision
  yield("Atul")
  yield("Anurag")
end

double_vision { |name| puts "My name is #{name}" }