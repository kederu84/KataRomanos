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


	def dame_romano_16_20(numero)

		if numero

	end


end