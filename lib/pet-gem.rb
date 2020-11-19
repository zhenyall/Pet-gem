class HTMLPet
	
  def initialize
		@pet = pet
	end

	def to_html
		content = File.read("#{self.class.root}/pet-gem.html")
		@html_new = "#{self.class.root}/pet-gem.html"
		File.open(@html_new, 'w') {|f|
			content.gsub!('{{pet}}', @pet.class.to_s)
			content.gsub!('{{name}}', @pet.name)
			content.gsub!('{{emoji}}', @pet.emoji) 
      content.gsub!('{{response}}', @pet.response.join('<br>')) 
      f.puts content
    	}
  end

  def open_html
    to_html    
    system("xdg-open #{@html_new}")
  end

  def self.root
    File.expand_path '..', __FILE__
  end
end