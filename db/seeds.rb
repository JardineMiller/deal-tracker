require('pry-byebug')
require_relative('../db/sqlrunner.rb')

require_relative('../models/burger.rb')
require_relative('../models/restaurant.rb')
require_relative('../models/discount.rb')
require_relative('../models/deal.rb')

@restaurant = Restaurant.new({
  "name" => "The Retro Burger Bar",
  "tel" => "0131 666 1234",
  "email" => "email@retroburger.co.uk",
  "address" => "123 Fake Street, Edinburgh, EH1 2BC",
  "logo_url" => "retro.jpg",
  "distance" => 6,
  "bio" => "Burger ipsum dolor amet kobe culpa short loin ipsum officia adipisicing bacon dolor. Ea duis steak tail laboris elit labore rump eu non shoulder beef ribs eiusmod. Cow reprehenderit ullamco do cupidatat, ut rump cillum voluptate shoulder. Burger cupidatat ipsum, eiusmod strip steak lorem elit irure."
})

@restaurant2 = Restaurant.new({
  "name" => "Monster Burger",
  "tel" => "0131 123 4567",
  "email" => "email@monsterburger.co.uk",
  "address" => "345 Fake Street, Edinburgh, EH1 1AA",
  "logo_url" => "monster_burger.jpg",
  "distance" => 5,
  "bio" => "Burger ipsum dolor amet kobe culpa short loin ipsum officia adipisicing bacon dolor. Ea duis steak tail laboris elit labore rump eu non shoulder beef ribs eiusmod. Cow reprehenderit ullamco do cupidatat, ut rump cillum voluptate shoulder. Burger cupidatat ipsum, eiusmod strip steak lorem elit irure."
})

@restaurant3 = Restaurant.new({
  "name" => "Burger Wise",
  "tel" => "0131 222 3333",
  "email" => "email@burgerwise.co.uk",
  "address" => "123 Fake Street, Edinburgh, EH10 234",
  "logo_url" => "burger_wise.jpg",
  "distance" => 14,
  "bio" => "Burger ipsum dolor amet kobe culpa short loin ipsum officia adipisicing bacon dolor. Ea duis steak tail laboris elit labore rump eu non shoulder beef ribs eiusmod. Cow reprehenderit ullamco do cupidatat, ut rump cillum voluptate shoulder. Burger cupidatat ipsum, eiusmod strip steak lorem elit irure."
})

@restaurant4 = Restaurant.new({
  "name" => "Burger Stacks",
  "tel" => "0131 109 555",
  "email" => "email@burgerstacks.co.uk",
  "address" => "21 Cloud Avenue, Edinburgh, EH3 234",
  "logo_url" => "burger_stacks.jpg",
  "distance" => 11,
  "bio" => "Burger ipsum dolor amet kobe culpa short loin ipsum officia adipisicing bacon dolor. Ea duis steak tail laboris elit labore rump eu non shoulder beef ribs eiusmod. Cow reprehenderit ullamco do cupidatat, ut rump cillum voluptate shoulder. Burger cupidatat ipsum, eiusmod strip steak lorem elit irure."
})

@restaurant.save
@restaurant2.save
@restaurant3.save
@restaurant4.save



@burger1 = Burger.new({
  "name" => "The Mighty Meaty",
  "restaurant_id" => @restaurant.id,
  "type" => :cheeseburger,
  "price" => 10.99,
  "photo_url" => "mighty_meaty.jpg",
  "description" => "Burger ipsum dolor amet kobe culpa short loin ipsum officia adipisicing bacon dolor. Ea duis steak tail laboris elit labore rump eu non shoulder beef ribs eiusmod. Cow reprehenderit ullamco do cupidatat, ut rump cillum voluptate shoulder. Burger cupidatat ipsum, eiusmod strip steak lorem elit irure."
})

@burger2 = Burger.new({
  "name" => "The Veggie Supreme",
  "restaurant_id" => @restaurant.id,
  "type" => :veggie,
  "price" => 8.99,
  "photo_url" => "veggie_supreme.jpg",
  "description" => "Burger ipsum dolor amet kobe culpa short loin ipsum officia adipisicing bacon dolor. Ea duis steak tail laboris elit labore rump eu non shoulder beef ribs eiusmod. Cow reprehenderit ullamco do cupidatat, ut rump cillum voluptate shoulder. Burger cupidatat ipsum, eiusmod strip steak lorem elit irure."
})

@burger3 = Burger.new({
  "name" => "The Impossible Burger",
  "restaurant_id" => @restaurant.id,
  "type" => :veggie,
  "price" => 18.99,
  "photo_url" => "impossible_burger.jpg",
  "description" => "Burger ipsum dolor amet kobe culpa short loin ipsum officia adipisicing bacon dolor. Ea duis steak tail laboris elit labore rump eu non shoulder beef ribs eiusmod. Cow reprehenderit ullamco do cupidatat, ut rump cillum voluptate shoulder. Burger cupidatat ipsum, eiusmod strip steak lorem elit irure."
})



@burger4 = Burger.new({
  "name" => "Pulled Pork Burger",
  "restaurant_id" => @restaurant2.id,
  "type" => :pork,
  "price" => 12.99,
  "photo_url" => "pulled_pork.jpg",
  "description" => "Burger ipsum dolor amet kobe culpa short loin ipsum officia adipisicing bacon dolor. Ea duis steak tail laboris elit labore rump eu non shoulder beef ribs eiusmod. Cow reprehenderit ullamco do cupidatat, ut rump cillum voluptate shoulder. Burger cupidatat ipsum, eiusmod strip steak lorem elit irure."
})

@burger5 = Burger.new({
  "name" => "Onion Ring Burger",
  "restaurant_id" => @restaurant2.id,
  "type" => :custom,
  "price" => 12.99,
  "photo_url" => "onion_ring.jpg",
  "description" => "Burger ipsum dolor amet kobe culpa short loin ipsum officia adipisicing bacon dolor. Ea duis steak tail laboris elit labore rump eu non shoulder beef ribs eiusmod. Cow reprehenderit ullamco do cupidatat, ut rump cillum voluptate shoulder. Burger cupidatat ipsum, eiusmod strip steak lorem elit irure."
})

@burger6 = Burger.new({
  "name" => "Classic Burger",
  "restaurant_id" => @restaurant2.id,
  "type" => :hamburger,
  "price" => 8.99,
  "photo_url" => "classic.jpg",
  "description" => "Burger ipsum dolor amet kobe culpa short loin ipsum officia adipisicing bacon dolor. Ea duis steak tail laboris elit labore rump eu non shoulder beef ribs eiusmod. Cow reprehenderit ullamco do cupidatat, ut rump cillum voluptate shoulder. Burger cupidatat ipsum, eiusmod strip steak lorem elit irure."
})



@burger7 = Burger.new({
  "name" => "The Greasy Griller",
  "restaurant_id" => @restaurant3.id,
  "type" => :custom,
  "price" => 15.99,
  "photo_url" => "greasy_griller.jpg",
  "description" => "Burger ipsum dolor amet kobe culpa short loin ipsum officia adipisicing bacon dolor. Ea duis steak tail laboris elit labore rump eu non shoulder beef ribs eiusmod. Cow reprehenderit ullamco do cupidatat, ut rump cillum voluptate shoulder. Burger cupidatat ipsum, eiusmod strip steak lorem elit irure."
})

@burger8 = Burger.new({
  "name" => "Atomic Avacado",
  "restaurant_id" => @restaurant3.id,
  "type" => :veggie,
  "price" => 10.99,
  "photo_url" => "atomic_avacado.jpg",
  "description" => "Burger ipsum dolor amet kobe culpa short loin ipsum officia adipisicing bacon dolor. Ea duis steak tail laboris elit labore rump eu non shoulder beef ribs eiusmod. Cow reprehenderit ullamco do cupidatat, ut rump cillum voluptate shoulder. Burger cupidatat ipsum, eiusmod strip steak lorem elit irure."
})

@burger9 = Burger.new({
  "name" => "The Coronary",
  "restaurant_id" => @restaurant3.id,
  "type" => :custom,
  "price" => 13.99,
  "photo_url" => "the_coronary.jpg",
  "description" => "Burger ipsum dolor amet kobe culpa short loin ipsum officia adipisicing bacon dolor. Ea duis steak tail laboris elit labore rump eu non shoulder beef ribs eiusmod. Cow reprehenderit ullamco do cupidatat, ut rump cillum voluptate shoulder. Burger cupidatat ipsum, eiusmod strip steak lorem elit irure."
})

@burger10 = Burger.new({
  "name" => "The Dude",
  "restaurant_id" => @restaurant4.id,
  "type" => :custom,
  "price" => 16.99,
  "photo_url" => "burger_1.jpg",
  "description" => "Burger ipsum dolor amet kobe culpa short loin ipsum officia adipisicing bacon dolor. Ea duis steak tail laboris elit labore rump eu non shoulder beef ribs eiusmod. Cow reprehenderit ullamco do cupidatat, ut rump cillum voluptate shoulder. Burger cupidatat ipsum, eiusmod strip steak lorem elit irure."
})

@burger11 = Burger.new({
  "name" => "The Demon",
  "restaurant_id" => @restaurant4.id,
  "type" => :custom,
  "price" => 13.99,
  "photo_url" => "burger_2.jpg",
  "description" => "Burger ipsum dolor amet kobe culpa short loin ipsum officia adipisicing bacon dolor. Ea duis steak tail laboris elit labore rump eu non shoulder beef ribs eiusmod. Cow reprehenderit ullamco do cupidatat, ut rump cillum voluptate shoulder. Burger cupidatat ipsum, eiusmod strip steak lorem elit irure."
})

@burger12 = Burger.new({
  "name" => "The Happy Jalepeno",
  "restaurant_id" => @restaurant4.id,
  "type" => :custom,
  "price" => 10.99,
  "photo_url" => "burger_3.jpg",
  "description" => "Burger ipsum dolor amet kobe culpa short loin ipsum officia adipisicing bacon dolor. Ea duis steak tail laboris elit labore rump eu non shoulder beef ribs eiusmod. Cow reprehenderit ullamco do cupidatat, ut rump cillum voluptate shoulder. Burger cupidatat ipsum, eiusmod strip steak lorem elit irure."
})

@burger1.save
@burger2.save
@burger3.save

@burger4.save
@burger5.save

@burger6.save
@burger7.save
@burger8.save
@burger9.save

@burger10.save
@burger11.save
@burger12.save

@discount = Discount.new({
  "name" => "5% Off",
  "type" => "percentage",
  "multiplier" => 0.95
})

@discount2 = Discount.new({
  "name" => "10% Off",
  "type" => "percentage",
  "multiplier" => 0.90
})

@discount3 = Discount.new({
  "name" => "15% Off",
  "type" => "percentage",
  "multiplier" => 0.85
})

@discount4 = Discount.new({
  "name" => "20% Off",
  "type" => "percentage",
  "multiplier" => 0.80
})

@discount5 = Discount.new({
  "name" => "25% Off",
  "type" => "percentage",
  "multiplier" => 0.75
})

@discount6 = Discount.new({
  "name" => "30% Off",
  "type" => "percentage",
  "multiplier" => 0.70
})

@discount7 = Discount.new({
  "name" => "35% Off",
  "type" => "percentage",
  "multiplier" => 0.65
})

@discount8 = Discount.new({
  "name" => "40% Off",
  "type" => "percentage",
  "multiplier" => 0.60
})

@discount9 = Discount.new({
  "name" => "45% Off",
  "type" => "percentage",
  "multiplier" => 0.55
})

@discount10 = Discount.new({
  "name" => "50% Off",
  "type" => "percentage",
  "multiplier" => 0.50
})

@discount11 = Discount.new({
  "name" => "£5 Off",
  "type" => "deduction",
  "multiplier" => 5
})

@discount12 = Discount.new({
  "name" => "£10 Off",
  "type" => "deduction",
  "multiplier" => 10
})

@discount13 = Discount.new({
  "name" => "£15 Off",
  "type" => "deduction",
  "multiplier" => 15
})

@discount.save
@discount2.save
@discount3.save
@discount4.save
@discount5.save
@discount6.save
@discount7.save
@discount8.save
@discount9.save
@discount10.save

@discount11.save
@discount12.save
@discount13.save

@deal = Deal.new({
  "name" => "Two For One Tuesdays",
  "burger_id" => @burger1.id,
  "discount_id" => @discount10.id,
  "day" => :tue
})

@deal2 = Deal.new({
  "burger_id" => @burger2.id,
  "name" => "Two For One Tuesdays",
  "discount_id" => @discount10.id,
  "day" => :tue
})

@deal3 = Deal.new({
  "burger_id" => @burger3.id,
  "name" => "Two For One Tuesdays",
  "discount_id" => @discount10.id,
  "day" => :tue
})



@deal7 = Deal.new({
  "burger_id" => @burger1.id,
  "name" => "Festive Friday",
  "discount_id" => @discount6.id,
  "day" => :fri
})

@deal8 = Deal.new({
  "burger_id" => @burger2.id,
  "name" => "Festive Friday",
  "discount_id" => @discount6.id,
  "day" => :fri
})

@deal9 = Deal.new({
  "burger_id" => @burger3.id,
  "name" => "Festive Friday",
  "discount_id" => @discount6.id,
  "day" => :fri
})

@deal10 = Deal.new({
  "burger_id" => @burger4.id,
  "name" => "Festive Season",
  "discount_id" => @discount2.id,
  "day" => :mon
})

@deal11 = Deal.new({
  "burger_id" => @burger5.id,
  "name" => "Festive Season",
  "discount_id" => @discount2.id,
  "day" => :mon
})

@deal12 = Deal.new({
  "burger_id" => @burger6.id,
  "name" => "Festive Season",
  "discount_id" => @discount2.id,
  "day" => :mon
})

@deal13 = Deal.new({
  "burger_id" => @burger7.id,
  "name" => "Fantastic Fridays",
  "discount_id" => @discount11.id,
  "day" => :fri
})

@deal14 = Deal.new({
  "burger_id" => @burger8.id,
  "name" => "Fantastic Fridays",
  "discount_id" => @discount11.id,
  "day" => :fri
})

@deal15 = Deal.new({
  "burger_id" => @burger9.id,
  "name" => "Fantastic Fridays",
  "discount_id" => @discount11.id,
  "day" => :fri
})

@deal16 = Deal.new({
  "burger_id" => @burger10.id,
  "name" => "Happy Humpday",
  "discount_id" => @discount12.id,
  "day" => :wed
})

@deal17 = Deal.new({
  "burger_id" => @burger11.id,
  "name" => "Happy Humpday",
  "discount_id" => @discount12.id,
  "day" => :wed
})

@deal18 = Deal.new({
  "burger_id" => @burger12.id,
  "name" => "Happy Humpday",
  "discount_id" => @discount12.id,
  "day" => :wed
})



@deal19 = Deal.new({
  "burger_id" => @burger1.id,
  "name" => "Greasy Wednesdays",
  "discount_id" => @discount4.id,
  "day" => :wed
})

@deal20 = Deal.new({
  "burger_id" => @burger2.id,
  "name" => "Greasy Wednesdays",
  "discount_id" => @discount4.id,
  "day" => :wed
})

@deal21 = Deal.new({
  "burger_id" => @burger3.id,
  "name" => "Greasy Wednesdays",
  "discount_id" => @discount4.id,
  "day" => :wed
})

@deal22 = Deal.new({
  "burger_id" => @burger4.id,
  "name" => "Mid Week Madness",
  "discount_id" => @discount9.id,
  "day" => :wed
})

@deal23 = Deal.new({
  "burger_id" => @burger5.id,
  "name" => "Mid Week Madness",
  "discount_id" => @discount9.id,
  "day" => :wed
})

@deal24 = Deal.new({
  "burger_id" => @burger6.id,
  "name" => "Mid Week Madness",
  "discount_id" => @discount9.id,
  "day" => :wed
})





@deal28 = Deal.new({
  "burger_id" => @burger10.id,
  "name" => "Happy Burger Day",
  "discount_id" => @discount5.id,
  "day" => :thu
})

@deal29 = Deal.new({
  "burger_id" => @burger11.id,
  "name" => "Happy Burger Day",
  "discount_id" => @discount5.id,
  "day" => :thu
})

@deal30 = Deal.new({
  "burger_id" => @burger12.id,
  "name" => "Happy Burger Day",
  "discount_id" => @discount5.id,
  "day" => :thu
})

@deal25 = Deal.new({
  "burger_id" => @burger7.id,
  "name" => "Thursdays Are The Best",
  "discount_id" => @discount3.id,
  "day" => :thu
})

@deal26 = Deal.new({
  "burger_id" => @burger8.id,
  "name" => "Thursdays Are The Best",
  "discount_id" => @discount3.id,
  "day" => :thu
})

@deal27 = Deal.new({
  "burger_id" => @burger9.id,
  "name" => "Thursdays Are The Best",
  "discount_id" => @discount3.id,
  "day" => :thu
})

@deal4 = Deal.new({
  "burger_id" => @burger4.id,
  "name" => "Thirdsdays",
  "discount_id" => @discount6.id,
  "day" => :thu
})

@deal5 = Deal.new({
  "burger_id" => @burger5.id,
  "name" => "Thirdsdays",
  "discount_id" => @discount6.id,
  "day" => :thu
})

@deal6 = Deal.new({
  "burger_id" => @burger6.id,
  "name" => "Thirdsdays",
  "discount_id" => @discount6.id,
  "day" => :thu
})

@deal31 = Deal.new({
  "burger_id" => @burger4.id,
  "name" => "Weekend Offer",
  "discount_id" => @discount3.id,
  "day" => :sat
})

@deal32 = Deal.new({
  "burger_id" => @burger5.id,
  "name" => "Weekend Offer",
  "discount_id" => @discount3.id,
  "day" => :sat
})

@deal33 = Deal.new({
  "burger_id" => @burger6.id,
  "name" => "Weekend Offer",
  "discount_id" => @discount3.id,
  "day" => :sat
})

@deal34 = Deal.new({
  "burger_id" => @burger1.id,
  "name" => "End of Week Party",
  "discount_id" => @discount5.id,
  "day" => :sat
})

@deal35 = Deal.new({
  "burger_id" => @burger2.id,
  "name" => "End of Week Party",
  "discount_id" => @discount5.id,
  "day" => :sat
})

@deal36 = Deal.new({
  "burger_id" => @burger3.id,
  "name" => "End of Week Party",
  "discount_id" => @discount5.id,
  "day" => :sat
})



@deal37 = Deal.new({
  "burger_id" => @burger11.id,
  "name" => "End of Week",
  "discount_id" => @discount5.id,
  "day" => :fri
})

@deal38 = Deal.new({
  "burger_id" => @burger12.id,
  "name" => "End of Week",
  "discount_id" => @discount5.id,
  "day" => :fri
})

@deal39 = Deal.new({
  "burger_id" => @burger10.id,
  "name" => "End of Week",
  "discount_id" => @discount5.id,
  "day" => :fri
})

@deal40 = Deal.new({
  "burger_id" => @burger11.id,
  "name" => "School's Out",
  "discount_id" => @discount2.id,
  "day" => :sat
})

@deal41 = Deal.new({
  "burger_id" => @burger12.id,
  "name" => "School's Out",
  "discount_id" => @discount2.id,
  "day" => :sat
})

@deal42 = Deal.new({
  "burger_id" => @burger10.id,
  "name" => "School's Out",
  "discount_id" => @discount2.id,
  "day" => :sat
})

@deal43 = Deal.new({
  "burger_id" => @burger4.id,
  "name" => "Payday, Baby",
  "discount_id" => @discount.id,
  "day" => :fri
})

@deal44 = Deal.new({
  "burger_id" => @burger5.id,
  "name" => "Payday, Baby",
  "discount_id" => @discount.id,
  "day" => :fri
})

@deal45 = Deal.new({
  "burger_id" => @burger6.id,
  "name" => "Payday, Baby",
  "discount_id" => @discount.id,
  "day" => :fri
})

@deal37.save
@deal38.save
@deal39.save

@deal40.save
@deal41.save
@deal42.save

@deal43.save
@deal44.save
@deal45.save

@deal46 = Deal.new({
  "burger_id" => @burger10.id,
  "name" => "It's Not Monday",
  "discount_id" => @discount5.id,
  "day" => :tue
})

@deal47 = Deal.new({
  "burger_id" => @burger11.id,
  "name" => "It's Not Monday",
  "discount_id" => @discount5.id,
  "day" => :tue
})

@deal48 = Deal.new({
  "burger_id" => @burger12.id,
  "name" => "It's Not Monday",
  "discount_id" => @discount5.id,
  "day" => :tue
})

@deal49 = Deal.new({
  "burger_id" => @burger7.id,
  "name" => "Deal Names Are Hard",
  "discount_id" => @discount3.id,
  "day" => :tue
})

@deal50 = Deal.new({
  "burger_id" => @burger8.id,
  "name" => "Deal Names Are Hard",
  "discount_id" => @discount3.id,
  "day" => :tue
})

@deal51 = Deal.new({
  "burger_id" => @burger9.id,
  "name" => "Deal Names Are Hard",
  "discount_id" => @discount3.id,
  "day" => :tue
})

@deal52 = Deal.new({
  "burger_id" => @burger4.id,
  "name" => "Deal Name",
  "discount_id" => @discount6.id,
  "day" => :tue
})

@deal53 = Deal.new({
  "burger_id" => @burger5.id,
  "name" => "Deal Name",
  "discount_id" => @discount6.id,
  "day" => :tue
})

@deal54 = Deal.new({
  "burger_id" => @burger6.id,
  "name" => "Deal Name",
  "discount_id" => @discount6.id,
  "day" => :tue
})

@deal.save
@deal2.save
@deal3.save

@deal4.save
@deal5.save

@deal6.save
@deal7.save
@deal8.save

@deal9.save
@deal10.save

@deal11.save
@deal12.save
@deal13.save

@deal14.save
@deal15.save

@deal16.save
@deal17.save
@deal18.save

@deal28.save
@deal29.save
@deal30.save

@deal31.save
@deal32.save
@deal33.save

@deal34.save
@deal35.save
@deal36.save

@deal46.save
@deal47.save
@deal48.save
@deal49.save
@deal50.save
@deal51.save
@deal52.save
@deal53.save
@deal54.save

@deal19.save
@deal20.save
@deal21.save

@deal22.save
@deal23.save
@deal24.save

@deal25.save
@deal26.save
@deal27.save

binding.pry
nil