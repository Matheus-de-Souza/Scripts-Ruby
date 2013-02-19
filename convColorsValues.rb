require 'clipboard'

def ConvertDecimalToFloat(value)
	Clipboard.copy '%.3ff,' % (value.to_f / 255)
end

def GetColor
	count = 0
	nArguments = ARGV.count
	while count <= nArguments
		case ARGV[count]
			when "-d"
				puts ConvertDecimalToFloat(ARGV[count + 1]) + " " +
					 ConvertDecimalToFloat(ARGV[count + 2]) + " " +
					 ConvertDecimalToFloat(ARGV[count + 3]) + " " +
					 ConvertDecimalToFloat(ARGV[count + 4])
				abort
			else
				puts "uhum"
		end
		count += 1
	end
end

if(ARGV.count > 3)
	GetColor()
else
	puts "This program need a minimum of 3 colors to work."
end
