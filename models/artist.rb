require('pg')
require_relative('../db/sql_runner')
require_relative('./album')

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

  def albums_by_artist()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
    results = SqlRunner.run(sql)
    albums_by_artist = results.map {|album| Album.new(album)}
    return albums_by_artist
  end

  def update()
    sql = "UPDATE artists SET (name) = ('#{@name}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def self.find(id)
      sql = "SELECT * FROM artists WHERE id = #{id}"
      results = SqlRunner.run(sql)
      artist_hash = results.first
      artist = Artist.new(artist_hash)
      return artist
    end

end