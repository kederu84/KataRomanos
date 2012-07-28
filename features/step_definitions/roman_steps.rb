require 'rspec/expectations'


Given /^un conversor$/ do
  @conversor = Conversor.new
end

When /^le paso (\d+)$/ do |numero|
  @resultado = @conversor.convertir_romano(numero.to_i) # express the regexp above with the code you wish you had
end


Then /^lo convierte a ([A-Z]*)/ do |valor_romano|
 	@resultado.should == valor_romano
end


class Conversor
	def convertir_romano(numero)
		return "I" if numero == 1 		
		return dame_romano(numero)		
    end


    def dame_romano(numero)
	    case numero  
	        when 2  
	        	 then "II"
	        when 3  
	        	 then "III"	        
	    end
	end

end