class Product
	attr_accessor :itens, :products, :cart, :total

	public

	def initialize
		@cart = []
		@total = 0
		@itens = ['Livro','Assinatura de Serviço','Música']
		@products = [
			{name: 'Livro', price: 45.00, type: 1, message: ''},
			{name: 'Assinatura de Serviço', price: 40.00, type: 2, message: ''},
			{name: 'Música', price: 35.00, type: 3, message: ''}
		]
	end

	def item(value)
		if @products[value.to_i - 1].nil? 
			return false
		end

		add @products[value.to_i - 1]
		return @products[value.to_i - 1] 
	end

	private

	def add (item)
		@cart << item
		@total += item[:price]
	end
end