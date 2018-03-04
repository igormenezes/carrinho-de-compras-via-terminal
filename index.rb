load 'Product.rb'
load 'Payment.rb'

def start(product)
    loop do
        puts "Digite o número do produto que deseja comprar: \n \n"
        puts "1 - Livro \n"
        puts "2 - Assinatura de Serviço \n"
        puts "3 - Música \n\n"
                
        @value = gets
                
        if [1, 2, 3].include? @value.to_i 
            break      
        end

        puts "VOCÊ DIGITOU UM VALOR INVÁLIDO! \n \n"  
    end
    
    item = product.item @value.to_i

    puts "Adicionado o seguinte item: \n \n"
    puts "Produto: #{item[:name]} \n"
    puts "Preço: #{item[:price]} \n"
    puts "Total: #{product.total}"

    loop do 
        puts "Deseja adicionar outro item ao carrinho? (S) - Sim (N) - Não"
        @value = gets

        if @value.strip.upcase == 'S'
            start product
            break
        elsif @value.strip.upcase == 'N'
            finalizePurchase product
            break
        end
    end 
end

def finalizePurchase(product)
    puts "Informe o seu endereço para finalizar a sua compra?\n"
    address = gets

    puts "Informe o seu cartão de credito?\n"
    creditCard = gets

    payment = Payment.new address, creditCard, product.cart, product.total
    payment.cart

    puts "\n\n"

    payment.products.each do |value|
        puts "Produto: #{value[:name]} \n"
        puts "Preço: #{value[:price]} \n"
        puts "Mensagem: #{value[:message]} \n\n"
    end

    puts "Endereço para entrega: #{payment.address}"
    puts "Número do cartão de credito: #{payment.creditCard}"
    puts "Total: #{product.total} \n\n"

    loop do 
        puts puts "Deseja finalizar a compra? (S) - Sim (N) - Não"
        @value = gets

        if @value.strip.upcase == 'S'
            payment.finalize
            break
        elsif @value.strip.upcase == 'N'
            puts "Compra foi abandonada!"
            break
        end
    end 
end


product = Product.new
start product

