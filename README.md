# checkout_with_offers

Our client is an online store, here are a few of the products they sell:

Product code	Name	Price
001	Lavender heart	£9.25
002	Personalised cufflinks	£45.00
003	Kids T-shirt	£19.95
Their marketing team want to offer promotions as an incentive for customers to purchase these items.

If you spend over £60, then you get 10% off of your purchase.
If you buy 2 or more lavender hearts then the price drops to £8.50.
Our check-out can scan items in any order, and because our promotions will change, it needs to be flexible regarding our promotional rules.

The interface to our checkout looks like this (shown in Ruby):

co = Checkout.new(promotional_rules)
co.scan(item)
co.scan(item)
price = co.total
Implement a checkout system that fulfills these requirements. Do this outside of any frameworks.

Test data
You should have test cases that that assert that when the products listed are in the basket, they have the correct price.

Basket: 001,002,003  
=> Total price expected: £66.78

Basket: 001,003,001  
=> Total price expected: £36.95

Basket: 001,002,001,003  
=> Total price expected: £73.76
