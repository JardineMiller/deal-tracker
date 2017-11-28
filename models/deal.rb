require_relative('../db/sqlrunner.rb')

class Deal
  attr_reader :id, :name, :burger_id, :discount_id, :day

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @burger_id = options["burger_id"].to_i
    @discount_id = options["discount_id"].to_i
    @day = options["day"].to_sym
  end

  # =============================================================
  # ========================== CRUD =============================

  def save
    sql = "
    INSERT INTO deals
    (name, discount_id, day, burger_id)
    VALUES
    ($1, $2, $3, $4)
    RETURNING id
    "
    values = [@name, @discount_id, @day, @burger_id]
    deal = SqlRunner.run(sql, values).first
    @id = deal["id"].to_i
  end

  def self.find(id)
    sql = "
    SELECT * FROM deals
    WHERE id = $1
    "
    values = [id]
    burger = SqlRunner.run(sql, values).first
    return Deal.new(burger)
  end

  def update
    sql = "
    UPDATE deals
    SET (name, discount_id, day, burger_id) =
    ($1, $2, $3, $4)
    WHERE id = $5
    "
    values = [@name, @discount_id, @day, @burger_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "
    DELETE FROM deals
    WHERE id = $1
    "
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # =============================================================
  # ========================== ALLS =============================
  
  def self.delete_all
    sql = "
    DELETE FROM deals
    "
    SqlRunner.run(sql)
  end

  def self.all
    sql = "
    SELECT * FROM deals
    "
    result = SqlRunner.run(sql)
    return result.map { |deal| Deal.new(deal) }
  end

  def self.all_count
    return self.all.count
  end

  def self.distinct_all
    sql = "
    SELECT DISTINCT ON (restaurant_id, deals.name) deals.* FROM deals
    INNER JOIN discounts
    ON deals.discount_id = discounts.id
    INNER JOIN burgers
    ON deals.burger_id = burgers.id
    INNER JOIN restaurants
    ON burgers.restaurant_id = restaurants.id
    "
    result = SqlRunner.run(sql)
    return result.map { |deal| Deal.new(deal) }
  end

  def self.distinct_count
    return self.distinct_all.count
  end

  # ===============================================================
  # =========================== INFO ==============================
  
  def burger
    sql = "
    SELECT DISTINCT ON (restaurant_id, deals.name) burgers.* FROM deals
    INNER JOIN burgers
    ON deals.burger_id = burgers.id
    INNER JOIN restaurants
    ON burgers.restaurant_id = restaurants.id
    WHERE deals.id = $1
    "
    values = [@id]
    result = SqlRunner.run(sql, values).first
    return Burger.new(result)
  end

  def burgers
    sql = "
    SELECT burgers.* FROM deals
    INNER JOIN discounts
    ON discount_id = discounts.id
    INNER JOIN burgers
    ON burger_id = burgers.id
    WHERE discount_id = $1
    "
    values = [@discount_id]
    result = SqlRunner.run(sql, values)
    return result.map { |burger| Burger.new(burger) }
  end

  def restaurant
    sql = "
    SELECT DISTINCT ON (restaurant_id, deals.name) restaurants.* FROM deals
    INNER JOIN burgers
    ON deals.burger_id = burgers.id
    INNER JOIN restaurants
    ON burgers.restaurant_id = restaurants.id
    WHERE deals.id = $1
    "
    values = [@id]
    result = SqlRunner.run(sql, values).first
    return Restaurant.new(result)
  end

  def discount
    sql = "
    SELECT * FROM discounts
    WHERE id = $1
    "
    values = [@discount_id]
    result = SqlRunner.run(sql, values).first
    return Discount.new(result)
  end

  def final_price
    return sprintf('%.2f',(self.burger.price * self.discount.multiplier))
  end

end