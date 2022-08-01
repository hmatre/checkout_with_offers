require 'terminal-table'

class Product
  PRODUCTS = {"001"=>'Lavender heart', "002"=>'Personalised cufflinks', "003"=>'Kids T-shirt' }
  PRODUCT_PRICE = {"001"=> 9.25, "002"=> 45, "003"=>19.45 }
end


class Invoice

  def initialize(data)
    @data = data
    new_hash = data.group_by(&:itself).map { |k,v| [k, v.count] }.to_h
    @lavender_heart = new_hash["001"].to_i
    @personalised_cufflinks = new_hash["002"].to_i
    @kids_tshirt = new_hash["003"].to_i
  end

  def discounted_price
    total_price = 0
    if @lavender_heart >= 2
      total_price = 8.5 * @lavender_heart
    else
      total_price = 9.25 * @lavender_heart
    end
    total_price = total_price + 45 * @personalised_cufflinks + 19.95 * @kids_tshirt
    if total_price > 60
      discount = total_price * 10 / 100
      total_price = total_price - discount
      total_price.round(2)
    else
      total_price
    end
  end

  def print_invoice(price)
    puts "################ INVOICE #######################"

    puts "Basket: #{@data & Product::PRODUCTS.keys}"
    puts "total price expected: £#{price}"
  end
end

puts "################ PRODUCTS #######################"
rows = []
rows << ["Product code", "Name", "Price"]
rows << :separator

Product::PRODUCTS.map { |e| rows << [e[0], e[1], Product::PRODUCT_PRICE[e[0]]] }
table = Terminal::Table.new :rows => rows
puts table

puts "Enter Product code: choose from above list"
entered_items = []
4.times do 
  entered_items << gets.chomp()
end
puts "Entered item: #{entered_items.join(', ')}"
# puts "Enter item quantity for the Product"
# data = {}
# Product::PRODUCTS.each do |pro, v|
#   puts "Please Select Qauntity for #{v} :"
#   data["#{pro}"] = gets.chomp().to_i
# end
invoice = Invoice.new(entered_items.reject(&:empty?))
price = invoice.discounted_price
invoice.print_invoice(price)
