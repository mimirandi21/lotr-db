class CreateUserMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :user_movies do |t|
      t.bigint :user_id
      t.bigint :movie_id
      t.bigint :user_rating
      t.text :user_notes
      t.text :private_notes

      t.timestamps
    end
  end
end
