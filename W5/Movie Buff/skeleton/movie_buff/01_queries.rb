# == Schema Information
#
# Table name: actors
#
#  id   :bigint           not null, primary key
#  name :string           not null
#
# Indexes
#
#  index_actors_on_name  (name)
#

# Table name: movies
#
#  id          :bigint           not null, primary key
#  score       :float            not null
#  title       :string           not null
#  votes       :integer          not null
#  yr          :integer          not null
#  director_id :integer          not null
#
# Indexes
#
#  index_movies_on_director_id  (director_id)
#  index_movies_on_title        (title)
#

# Table name: castings
#
#  id       :bigint           not null, primary key
#  ord      :integer          not null
#  actor_id :integer          not null
#  movie_id :integer          not null
#
# Indexes
#
#  index_castings_on_actor_id               (actor_id)
#  index_castings_on_actor_id_and_movie_id  (actor_id,movie_id) UNIQUE
#  index_castings_on_movie_id               (movie_id)
#

def it_was_ok
  # Consider the following:
  #
  # Movie.where(yr: 1970..1979)
  #
  # We can use ranges (a..b) inside a where method.
  #
  # Find the id, title, and score of all movies with scores between 2 and 3
  Movie
    .select(:id, :title, :score)
    .where(score: 2..3)
end

def harrison_ford
  # Consider the following
  #
  # Actor
  #   .joins(:movies)
  #   .where(movies: { title: 'Blade Runner' })
  #
  # It's possible to join based on active record relations defined in models.
  #
  # Find the id and title of all movies in which Harrison Ford
  # appeared but not as a lead actor
  Movie
    .select(:id, :title)
    .joins(:actors)
    .where("actors.name = 'Harrison Ford'")
    .where.not("castings.ord = 1")
    # .where(actors: { name: "Harrison Ford" } )
    # .where.not(castings: { ord: 1 })
end

def biggest_cast
  # Consider the following:
  #
  # Actor
  #   .joins(:movies)
  #   .group('actors.id')
  #   .order('COUNT(movies.id) DESC')
  #   .limit(1)
  #
  # Sometimes we need to use aggregate SQL functions like COUNT, MAX, and AVG.
  # Often these are combined with group.
  #
  # Find the id and title of the 3 movies with the
  # largest casts (i.e most actors)
  Movie 
  .select(:id,:title)
  .joins(:actors)
  .limit(3)
  .group(:id)
  .order("COUNT(actors.id) desc")


  # .select(:id, :title)
  # .group(:id)
  # .limit(3)
  # .joins(:actors)
  # .order("count(actors.id) DESC")
end

def directed_by_one_of(them)
  # Consider the following:
  #
  # Movie.where('yr IN (?)', years)
  #
  # We can use IN to test if an element is present in an array.
  #
  # ActiveRecord gives us an even better way to write this:
  #
  # Movie.where(yr: years)
  #
  # Find the id and title of all the movies directed by one of 'them'.
  Movie
    .select(:id, :title)
    .where('actors.name IN (?)',them)
    .group(:id)
    .joins(:director)


end

def movie_names_before_1940
  # Consider the following:
  #
  # Movie.where('score < 2.0').pluck(:title)
  # => ['Police Academy: Mission to Moscow']
  #
  # Pluck works similarly to select, except that it converts a query result
  # directly into a Ruby Array instead of an ActiveRecord object. This can
  # improve performace for larger queries.
  #
  # Use pluck to find the title of all movies made before 1940.
  Movie.where('yr < 1940').pluck(:title)
end
