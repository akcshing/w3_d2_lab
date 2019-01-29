require('pg')


class Property

attr_accessor :address, :value, :bedroom_number, :year, :status, :size, :type, :id


  def initialize(property)
    @id = property["id"].to_i if property['id']
    @address = property["address"]
    @value = property["value"]
    @bedroom_number = property["bedroom_number"]
    @year = property["year"]
    @status = property["status"]
    @size = property["size"]
    @type = property["type"]
  end


  def save
    db = PG.connect( { dbname: 'property', host: 'localhost' } )
    sql = "INSERT INTO property_details(
    address,
    value,
    bedroom_number,
    year,
    status,
    size,
    type
    ) VALUES($1, $2, $3, $4, $5, $6, $7)
    RETURNING id"

    values = [@address, @value, @bedroom_number, @year, @status, @size, @type]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]['id'].to_i

    db.close()
  end

  def Property.delete_all
    db = PG.connect( {dbname: 'property', host: 'localhost'})
    sql = "DELETE FROM property_details"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close()
  end

  def delete
    db = PG.connect( { dbname: 'property', host: 'localhost' } )
    sql = "DELETE FROM property_details WHERE id = $1 "
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close()
  end

  def update
    db = PG.connect( { dbname: 'property', host: 'localhost' } )
    sql = "UPDATE property_details SET(
      address,
      value,
      bedroom_number,
      year,
      status,
      size,
      type
      ) = ($1, $2, $3, $4, $5, $6, $7)
      WHERE id = $8"
      values = [@address, @value, @bedroom_number, @year, @status, @size, @type, @id]
      db.prepare("update", sql)
      db.exec_prepared("update", values)
      db.close()
  end

  def Property.find(id)
    db = PG.connect( { dbname: 'property', host: 'localhost' } )
    sql = "SELECT FROM property_details WHERE id = $1 "
    values = [id]
    db.prepare("find", sql)
    found_property = db.exec_prepared("find", values)
    return found_property.map { |property| Property.new(property)}
    db.close()
  end

  def Property.find_by_address(address)
    db = PG.connect( { dbname: 'property', host: 'localhost' } )
    sql = "SELECT FROM property_details WHERE address = $1 "
    values = [address]
    db.prepare("find", sql)
    found_property = db.exec_prepared("find", values)
    return found_property.map { |property| Property.new(property)}
    db.close()
  end




end
