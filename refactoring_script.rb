Dir["*cs"].each do |filename|

	if !File.file?(filename)
		next
	end

	contents = File.read(filename)
 	text = contents.gsub(/(SyncResponseEnum)/, 'Response')

	File.open(filename,"w") { |f| f.write(text) }
end
