module Email
	public

	def send type
		case type
		when 2
			 sendSubscriptionService
		when 3
			 sendMusic
		end
	end

	private

	def sendSubscriptionService
		puts "\nFoi enviado e-mail sobre aviso para ativar sua assinatura!"
	end

	def sendMusic 
		puts "\nFoi enviado e-mail sobre aviso de sua compra de mídia digital!"
	end
end