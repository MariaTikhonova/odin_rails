require 'rest-client'

class BingResponse

def initialize
	@url = "https://www.bing.com/search?q=#{@input.gsub!(/\s/,"+")}"
end

def get_input
puts "We are searching for:"
@input = gets.chomp
end

#store in variables if we want to output exacly this
def get_response
 @response = RestClient.get(@url)
 @header = @response.header
 @code = @response.code
 @cookies = @response.cookies
 @body = @response.body
end

#most likely we want output to the file
def get_output
if @code == 200
@result = File.new("result.txt", "w+")
return @result.write(@body)
else
p  "Invalid response"
end
end

end

