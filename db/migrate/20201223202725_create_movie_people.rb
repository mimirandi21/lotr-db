class CreateMoviePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_people do |t|
      t.bigint :movie_id
      t.bigint :person_id
      t.text :character
      t.text :other_names
      t.text :title_or_position
      t.text :location

      t.timestamps
    end
  end
end
