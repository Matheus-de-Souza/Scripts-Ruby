require 'net/http'

content = Net::HTTP.get_response(URI.parse('http://www.comprarapidabeirario.com.br/@script/exportatablet/configuracao.php')).body
content.delete!("\n\n")

File.open('configuracao.xml', 'w') {|f| f.write(content) }

content = content.lines("\r").to_a.select { |line| line.include?('#') }.join("")

File.open('configuracao-mod.xml', 'w') {|f| f.write(content) }