require_relative('../db/sqlrunner.rb')

class Discount
  attr_reader :id, :name, :multiplier
  
  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @multiplier = options["multiplier"].to_f
  end

  # =============================================================
  # ========================== CRUD =============================
  
  def save
    sql = "
    INSERT INTO discounts
    (name, multiplier)
    VALUES
    ($1, $2)
    RETURNING id
    "
    values = [@name, @multiplier]
    discount = SqlRunner.run(sql, values).first
    @id = discount["id"].to_i
  end

  def self.find(id)
    sql ="
    SELECT * FROM discounts
    WHERE id = $1
    "
    values = [id]
    discount = SqlRunner.run(sql, values).first
    return Discount.new(discount)
  end

  def update
    sql = "
    UPDATE discounts
    SET (name, multiplier) =
    ($1, $2)
    WHERE id = $3
    "
    values = [@name, @multiplier, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "
    DELETE FROM discounts
    WHERE id = $1
    "
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # =============================================================
  # ========================== ALLS =============================
  
  def self.delete_all
    sql = "
    DELETE FROM discounts
    "
    SqlRunner.run(sql)
  end

  def self.all
    sql = "
    SELECT * FROM discounts ORDER BY id
    "
    result = SqlRunner.run(sql)
    return result.map { |discount| Discount.new(discount) }
  end

  def self.count
    return self.all.count
  end

end