require('pry-byebug')
require_relative('../db/sqlrunner.rb')
require_relative('../models/burger.rb')
require_relative('../models/deal.rb')
require_relative('../models/restaurant.rb')

@restaurant = Restaurant.new({
  "name" => "Brgr",
  "tel" => "0131 666 1234",
  "email" => "email@brgr.co.uk",
  "address" => "123 Fake Street, Edinburgh, EH1 2BC",
  "logo_url" => "brgr.jpg",
  "distance" => 6,
  "bio" => "Burger ipsum dolor amet kobe culpa short loin ipsum officia adipisicing bacon dolor. Ea duis steak tail laboris elit labore rump eu non shoulder beef ribs eiusmod. Cow reprehenderit ullamco do cupidatat, ut rump cillum voluptate shoulder. Burger cupidatat ipsum, eiusmod strip steak lorem elit irure."
})

@restaurant2 = Restaurant.new({
  "name" => "The Burger Factory",
  "tel" => "0131 123 4567",
  "email" => "email@burgerfactory.co.uk",
  "address" => "345 Fake Street, Edinburgh, EH1 1AA",
  "logo_url" => "burgerfactory.jpg",
  "distance" => 5,
  "bio" => "Burger ipsum dolor amet kobe culpa short loin ipsum officia adipisicing bacon dolor. Ea duis steak tail laboris elit labore rump eu non shoulder beef ribs eiusmod. Cow reprehenderit ullamco do cupidatat, ut rump cillum voluptate shoulder. Burger cupidatat ipsum, eiusmod strip steak lorem elit irure."
})

@restaurant3 = Restaurant.new({
  "name" => "Grillstock",
  "tel" => "0131 222 3333",
  "email" => "email@grillstock.co.uk",
  "address" => "123 Fake Street, Edinburgh, EH10 234",
  "logo_url" => "grillstock.jpg",
  "distance" => 14,
  "bio" => "Burger ipsum dolor amet kobe culpa short loin ipsum officia adipisicing bacon dolor. Ea duis steak tail laboris elit labore rump eu non shoulder beef ribs eiusmod. Cow reprehenderit ullamco do cupidatat, ut rump cillum voluptate shoulder. Burger cupidatat ipsum, eiusmod strip steak lorem elit irure."
})

@restaurant4 = Restaurant.new({
  "name" => "Meat Shack",
  "tel" => "0131 109 555",
  "email" => "email@meatshack.co.uk",
  "address" => "21 Cloud Avenue, Edinburgh, EH3 234",
  "logo_url" => "meatshack.jpg",
  "distance" => 11,
  "bio" => "Burger ipsum dolor amet kobe culpa short loin ipsum officia adipisicing bacon dolor. Ea duis steak tail laboris elit labore rump eu non shoulder beef ribs eiusmod. Cow reprehenderit ullamco do cupidatat, ut rump cillum voluptate shoulder. Burger cupidatat ipsum, eiusmod strip steak lorem elit irure."
})

@restaurant.save
@restaurant2.save
@restaurant3.save
@restaurant4.save



@burger = Burger.new({
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

@burger.save
@burger2.save
@burger3.save

@burger4.save
@burger5.save

@burger6.save
@burger7.save
@burger8.save
@burger9.save

@deal = Deal.new({
  "burger_id" => @burger.id,
  "name" => "Two For One Tuesdays",
  "discount" => 0.50,
  "day" => :tue
})

@deal2 = Deal.new({
  "burger_id" => @burger2.id,
  "name" => "Two For One Tuesdays",
  "discount" => 0.50,
  "day" => :tue
})

@deal3 = Deal.new({
  "burger_id" => @burger3.id,
  "name" => "Two For One Tuesdays",
  "discount" => 0.50,
  "day" => :tue
})

@deal4 = Deal.new({
  "burger_id" => @burger4.id,
  "name" => "30% Off",
  "discount" => 0.70,
  "day" => :wed
})

@deal5 = Deal.new({
  "burger_id" => @burger5.id,
  "name" => "30% Off",
  "discount" => 0.70,
  "day" => :wed
})

@deal6 = Deal.new({
  "burger_id" => @burger.id,
  "name" => "30% Off",
  "discount" => 0.70,
  "day" => :thu
})

@deal7 = Deal.new({
  "burger_id" => @burger2.id,
  "name" => "30% Off",
  "discount" => 0.70,
  "day" => :thu
})

@deal8 = Deal.new({
  "burger_id" => @burger3.id,
  "name" => "30% Off",
  "discount" => 0.70,
  "day" => :thu
})

@deal9 = Deal.new({
  "burger_id" => @burger4.id,
  "name" => "30% Off",
  "discount" => 0.70,
  "day" => :tue
})

@deal10 = Deal.new({
  "burger_id" => @burger5.id,
  "name" => "30% Off",
  "discount" => 0.70,
  "day" => :tue
})

@deal11 = Deal.new({
  "burger_id" => @burger7.id,
  "name" => "Mental Mondays",
  "discount" => 0.60,
  "day" => :mon
})

@deal12 = Deal.new({
  "burger_id" => @burger8.id,
  "name" => "Mental Mondays",
  "discount" => 0.60,
  "day" => :mon
})

@deal13 = Deal.new({
  "burger_id" => @burger9.id,
  "name" => "Mental Mondays",
  "discount" => 0.60,
  "day" => :mon
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

binding.pry
nil