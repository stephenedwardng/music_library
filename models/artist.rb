require('pg')
require_relative('../db/sql_runner')

class Artist

  attr_accessor :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def albums_by_artist()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id}"
    results = SqlRunner.run(sql)
    albums_by_artist = results.map {|album| Album.new(album)}
    return albums_by_artist
  end

end