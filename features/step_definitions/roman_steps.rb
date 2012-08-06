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
		return dame_romano_2_5(numero)	if numero < 6	
		return dame_romano_6_10(numero)	if numero < 11	
		return dame_romano_11_15(numero)	if numero < 16	
    end


    def dame_romano_2_5(numero)
	    case numero  
	        when 2  
	        	 then "II"
	        when 3  
	        	 then "III"
	       	when 4
	        	 then "IV"
	    	else  "V"        
	    end
	end

	def dame_romano_6_10(numero)
		w = { 	6 => "VI", 
				7 => "VII",
				8 => "VIII",
				9 => "IX",
				10 => "X" }
		return w.fetch( numero ) if w.has_key?( numero )
	end 	


	def dame_romano_11_15(numero)

		romano = ""
		contador = 0
		valores = [10, 9, 5, 4, 1 ]  
		simbolos = ["X", "IX", "V", "IV", "I"]
		while numero > 0 do
			if numero < valores[contador]
				contador = contador + 1
			else
				romano = romano + simbolos[contador]
				numero = numero - valores[contador]
			end
		end
		return romano
	end


end