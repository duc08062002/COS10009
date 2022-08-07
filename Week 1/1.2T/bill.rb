def main()
puts("Please enter the value of the appetizer price:")
appetizer_price = gets.chomp.to_f()
puts("Please enter the value of the main price:")
main_price = gets.chomp.to_f()
puts("Please enter the value of the dessert price:")
dessert_price = gets.chomp.to_f()
total_price = appetizer_price + main_price + dessert_price
total_price = total_price.to_f()
print("The total price is $")
print(total_price)
end

main()