file = File.open('db/mediafiles.txt', 'wb')
(1..3000).to_a.each do |number|
	file.write("@media (max-width: #{number}px) {img {height: #{(number.to_f/100*(20+(15-number.to_f/100))).to_i}px;width: auto;}}\n")
end