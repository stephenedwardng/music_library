require('pg')
require_relative('../db/sql_runner')

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

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

end