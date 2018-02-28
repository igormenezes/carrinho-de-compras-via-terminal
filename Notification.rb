module Notification
	public

	def validate type
		case type
		when 1
			return book
		when 2
			return subscriptionService
		when 3
			return music
		end
	end

	private

	def book
		return 'Esse item é isento de impostos!'
	end

	def subscriptionService
		return 'Você precisa ativar a assinatura, vai ser enviado um e-mail com essa notificação, ao concluir a compra!'
	end

	def music
		@total -= 10
		return 'Você ganhou um vouncher de R$ 10,00 na compra desse produto! (Descontado do valor total da compra)'
	end
end