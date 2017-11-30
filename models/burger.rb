require_relative('../db/sqlrunner.rb')

class Burger
  attr_reader :id, :name, :type, :photo_url, :description, :price, :restaurant_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @restaurant_id = options["restaurant_id"].to_i
    @name = options["name"]
    @type = options["type"] || ""
    @price = options["price"].to_f
    @photo_url = options["photo_url"] if options["photo_url"]
    @description = options["description"] if options["description"]
  end

  # =============================================================
  # ========================== CRUD =============================

  def save
    sql = "
    INSERT INTO burgers
    (restaurant_id, name, type, price, photo_url, description)
    VALUES
    ($1, $2, $3, $4, $5, $6)
    RETURNING id
    "
    values = [@restaurant_id, @name, @type, @price, @photo_url, @description]
    burger = SqlRunner.run(sql, values).first
    @id = burger["id"].to_i
  end

  def self.find(id)
    sql = "
    SELECT * FROM burgers
    WHERE id = $1
    "
    values = [id]
    burger = SqlRunner.run(sql, values).first
    return Burger.new(burger)
  end

  def update
    sql = "
    UPDATE burgers
    SET (restaurant_id, name, type, price, photo_url, description) =
    ($1, $2, $3, $4, $5, $6)
    WHERE id = $7
    " 
    values = [@restaurant_id, @name, @type, @price, @photo_url, @description, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "
    DELETE FROM burgers
    WHERE id = $1
    "
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # =============================================================
  # ========================== ALLS =============================
  
  def self.delete_all
    sql = "
    DELETE FROM burgers
    "
    SqlRunner.run(sql)
  end

  def self.all
    sql = "
    SELECT * FROM burgers ORDER BY id
    "
    result = SqlRunner.run(sql)
    return result.map { |burger| Burger.new(burger) }
  end

  def self.all_of_type(type)
    sql = "
    SELECT * FROM burgers
    WHERE type = $1
    "
    values = [type]
    result = SqlRunner.run(sql, values)
    return result.map { |burger| Burger.new(burger) }
  end

  def self.count
    return self.all.count
  end

  def self.all_types
    sql = "
    SELECT DISTINCT ON (burgers.type) * FROM burgers
    "
    result = SqlRunner.run(sql)
    return result.map { |burger| Burger.new(burger) }
  end

  # =============================================================
  # ========================= OTHER =============================
  
  def deals
    sql = "
    SELECT deals.* FROM deals
    INNER JOIN burgers
    ON deals.burger_id = burgers.id
    WHERE burgers.id = $1
    "
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |deal| Deal.new(deal) }
  end

  def restaurant
    sql = "
    SELECT restaurants.* FROM burgers
    INNER JOIN restaurants
    ON burgers.restaurant_id = restaurants.id
    WHERE burgers.id = $1
    "
    values = [@id]
    result = SqlRunner.run(sql, values).first
    return Restaurant.new(result)
  end

  def final_price(deal)
    return sprintf('%.2f',(price * deal.discount.multiplier)) if deal.discount.type == "percentage"
    return sprintf('%.2f',(price - deal.discount.multiplier)) if deal.discount.type == "deduction"
  end

end