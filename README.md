### Deal Tracker

 A Ruby/Sinatra based web application for creating, managing and displaying discounts & deals for local Burger restaurants.
 
## This Project Utilises:
Ruby
Object Oriented Programming
Web Programming (Sintatra MVC Framework)
RESTful Routes
PostgreSQL


## The Brief

Jarrod has an insatiable hunger for burgers. However, he only has a limited budget, so prefers to go to places that have a deal on. He would like a way to track which deals are available at which places on a given day so that he can maximise his burger intake for minimum spending.

### MVP:

- Add a burger eatery # Completed
- Add burgers available at an eatery and view them as a list # Completed
- Add a list of deals for an eatery where a deal has # Completed
  - Label string e.g. "Two For One Tuesdays" # Completed
  - A list of burgers that deal applies to # Completed
  - The day that the deal is available on e.g. "Wednesday" # Completed
  
### Possible Extensions:

- Show the deals available by day of the week Mon - Sun # Completed
- Add a price to a burger and add a savings amount/percentage to a deal so it's clear how much Jarrod is saving # Completed
- Any other ideas you might come up with # Completed

### Additional Features included by myself:

- Fully functioning search bar
- Filter by distance
- Fully functioning CRUD admin section for creating & maintaining data
- Groupon-like customer facing front page
- Day navigation sidebar on front page

### Getting Started

In the app's working directory, complete the following steps:

# 1. Create the database

```
createdb deal_tracker
```

# 2. Create the tables
```
psql -d deal_tracker -f db/deal_tracker.sql
```

# 3. Seed the database
```
ruby db/seeds.rb
```

# 4. Run the app
``` 
ruby app.rb
```

# 5. Open in browser
http://localhost:4567

# 6. Enjoy!



