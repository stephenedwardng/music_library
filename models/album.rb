require('pg')
require_relative('../db/sql_runner')
require_relative('./artist')

class Album

  attr_accessor :title, :genre

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ('#{@title}', '#{@genre}', '#{@artist_id}') RETURNING id;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
    results = SqlRunner.run(sql)
    artist_data = results[0]
    artist = Artist.new(artist_data)
    return artist
  end

  def update()
    sql = "UPDATE albums SET (title, genre) = ('#{@title}', '#{genre}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = #{id};"
    results = SqlRunner.run(sql)
    album_hash = results.first
    album = Album.new(album_hash)
    return album
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

end