require 'rubygems'
require 'net/http'
require 'active_support/core_ext'
require 'json'

if(ARGV.count < 2)
	abort("you need to give a url or a file to parse and a output")
end

content = Net::HTTP.get_response(URI.parse(ARGV[0])).body
content = content.delete!("\n\n").lines("\r").to_a
content = content.join("")
content = Hash.from_xml(content).to_json

File.open(ARGV[1], 'w') {|f| f.write(content) }

#content = content.lines("\r").to_a.select { |line| line.include?('#') }.join("")

#File.open(ARGV[1], 'w') {|f| f.write(content) }
