puts "hello"

def doit(val)
	array = [1, 2, 3]
	array[2] = val
	array.each do |e|
		puts e
	end

end

doit('hah')


mydict = {42 => "answer", "score" => 100, :name => "Tobi"}
puts mydict[42]
puts mydict["score"]
puts mydict[:name]


$global_var = 32

class TestClass
	@@local_var = 14

	def initialize
		@local_var = 20
	end	

	def test
		local_var = 7
		$global_var += 1
		@@local_var += 1
		@local_var += 1
		local_var += 1
		puts "$global_var=#{$global_var}"
		puts "@@local_var=#{@@local_var}"
		puts "@local_var=#{@local_var}"
		puts "local_var=#{local_var}"
	end
end

v = TestClass.new
v.test