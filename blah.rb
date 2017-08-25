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
	@@class_var = 14

	def initialize
		@instance_var = 20
	end

	def TestClass.ho
		puts 'class method ho called'
	end

	def test
		local_var = 7
		$global_var += 1
		@@class_var += 1
		@instance_var += 1
		local_var += 1
		puts "$global_var=#{$global_var}"
		puts "@@class_var=#{@@class_var}"
		puts "@instance_var=#{@instance_var}"
		puts "local_var=#{local_var}"
	end
end

v = TestClass.new
v.test
TestClass.ho

class InstanceAsLocal
	def initialize
		@instance = 230
	end
	def m2
		@instance
	end
	def test
		puts m2  # print out 230
	end

	def test_or
		noo = nil
		noo ||= 20
		puts noo

		noo = 200
		noo ||= 20
		puts noo
	end
end

c = InstanceAsLocal.new
c.test
c.test_or