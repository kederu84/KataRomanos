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
		return dame_romano_2_5(numero)		if numero < 6	
		return dame_romano_6_10(numero)		if numero < 11	
		return dame_romano_11_15(numero)	if numero < 16	
		return dame_romano_16_20(numero)	if numero <= 20
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

		count = 0		
		num_romano = ""		
		simb = ["X", "IX", "V", "IV", "I"]
		valores_num = [10, 9, 5, 4, 1 ]  

		while numero > 0 do
			if numero < valores_num[count]
				count = count + 1
			else
				num_romano = num_romano + simb[count]
				numero = numero - valores_num[count]
			end
		end
		return num_romano
	end

	def dame_romano_16_20(numero)

		if numero == 16 
			return "XVI"
		else
			if numero == 17
				return "XVII"
			else
				if numero == 18
					return "XVIII"
				else
					if numero == 19
						return "XIX"
					end	
				end	

			end	
		end	

		return "XX"
	end


end