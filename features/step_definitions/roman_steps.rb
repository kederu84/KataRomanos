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
		return "II" if numero == 2
		return "III" if numero == 3
		return "IV" if numero == 4

  end

end