require 'pry-byebug'
require_relative 'models/artist'
require_relative 'models/album'
Artist.delete_all()
Album.delete_all()

artist1 = Artist.new({
  'name' => 'The Beatles'
})

artist2 = Artist.new({
  'name' => 'Ludwig Van Beethoven'
})

customer1.save()
customer2.save()

album1 = Album.new({
  'title' => 'Revolver',
  'genre' => 'Rock',
  'artist_id' => artist1.id
})

album2 = Album.new({
  'title' => 'Symphony No. 9',
  'genre' => 'Classical',
  'artist_id' => artist2.id
})

album1.save()
album2.save()

binding.pry
nil