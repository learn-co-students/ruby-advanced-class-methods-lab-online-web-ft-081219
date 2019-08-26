class Tester

def method_one
    puts "here is method 1"
end

def method_two
    puts "here is method 2"
    self.method_one
end


end



x = "something.mp3"
puts x.slice!(0..-5)