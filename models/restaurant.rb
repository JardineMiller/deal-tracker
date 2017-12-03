require_relative('../db/sqlrunner.rb')

class Restaurant
  attr_reader :id, :name, :tel, :email, :address, :logo_url, :bio, :distance
  
  def initialize(options)
    @id = options["id"].to_i if options["id"]    
    @name = options["name"]
    @tel = options["tel"]
    @email = options["email"]
    @address = options["address"]
    @logo_url = options["logo_url"]
    @bio = options["bio"]
    @distance = options["distance"].to_i
  end

  # =============================================================
  # ========================== CRUD =============================

  def save
    sql = "
    INSERT INTO restaurants
    (name, tel, email, address, logo_url, bio, distance)
    VALUES
    ($1, $2, $3, $4, $5, $6, $7)
    RETURNING id
    "
    values = [@name, @tel, @email, @address, @logo_url, @bio, @distance]
    restaurant = SqlRunner.run(sql, values).first
    @id = restaurant["id"].to_i
  end

  def self.find(id)
    sql = "
    SELECT * FROM restaurants
    WHERE id = $1
    "
    values = [id]
    burger = SqlRunner.run(sql, values).first
    return Restaurant.new(burger)
  end

  def update
    sql = "
    UPDATE restaurants
    SET (name, tel, email, address, logo_url, bio, distance) = 
    ($1, $2, $3, $4, $5, $6, $7)
    WHERE id = $8
    "
    values = [@name, @tel, @email, @address, @logo_url, @bio, @distance, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "
    DELETE FROM restaurants
    WHERE id = $1
    "    
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # =============================================================
  # ========================== ALLS =============================
  
  def self.delete_all
    sql = "
    DELETE FROM restaurants
    "
    SqlRunner.run(sql)
  end

  def self.all
    sql = "
    SELECT * FROM restaurants ORDER BY name
    "
    result = SqlRunner.run(sql)
    return result.map { |restaurant| Restaurant.new(restaurant) }
  end

  def self.count
    return self.all.count
  end

 def self.search(string)
    sql = "
    SELECT * FROM restaurants
    WHERE name LIKE $1 OR name LIKE lower($1)
    "
    values = ["%#{string}%"]
    result = SqlRunner.run(sql, values)
    return result.map { |restaurant| Restaurant.new(restaurant) }
  end

  # =============================================================
  # ========================= OTHER =============================

  def burgers
    sql = "
    SELECT DISTINCT burgers.* FROM deals
    INNER JOIN burgers
    ON deals.burger_id = burgers.id
    INNER JOIN restaurants
    ON burgers.restaurant_id = restaurants.id
    WHERE restaurant_id = $1
    "
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |burger| Burger.new(burger) }   
  end

  def deals
    sql = "
    SELECT DISTINCT ON (restaurant_id, deals.name) deals.* FROM deals 
    INNER JOIN burgers 
    ON deals.burger_id = burgers.id 
    INNER JOIN restaurants 
    ON burgers.restaurant_id = restaurants.id 
    WHERE restaurant_id = $1
    "
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |deal| Deal.new(deal) }
  end

end