require_relative 'Notification.rb'
require_relative 'Email.rb'

class Payment	
	include Notification
	include Email

	attr_accessor :address, :creditCard, :products, :total, :typeSendEmails

	def initialize (address, creditCard, products, total)
		@products = products
		@total = total
		@address = address
		@creditCard = creditCard
		@typeSendEmails = []
	end

	def cart
		@products.each do |value|
			value[:message] = validate value[:type]

			if !value[:message].empty?
				@typeSendEmails << value[:type]
			end
		end

		return @products
	end

	def finalize
		@typeSendEmails.each do |value|
			send value 
		end
	end
end