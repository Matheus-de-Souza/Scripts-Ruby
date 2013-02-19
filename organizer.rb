arrBags = []

class Tours
	attr_accessor :filename, :title
	def initialize(filename, title)
		@filename = filename
		@title    = title
	end
end

Dir.glob("versao-online/*.xml") do |filename|
	f = File.open(filename)
	/title="([^"]+)"/ =~ f.first
	arrBags << Tours.new(filename[14..(filename.size - 1)],$1)
end

superstring = ""

arrBags.sort! { |a,b| a.title.downcase <=> b.title.downcase }
arrBags.each { |a| superstring << "\t<include url=\"#{a.filename}\" />\n\n" }

File.open("tour-organize.xml", 'w') { |f| f.write(superstring) }
