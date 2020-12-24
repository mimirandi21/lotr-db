class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.text :title
      t.text :imdb_link
      t.text :edition
      t.text :plot_summary
      t.interval :length
      t.text :fun_fact_1
      t.text :fun_fact_2
      t.text :fun_fact_3
      t.float :imdb_review
      t.bigint :metacritic_review
      t.text :rating
      t.text :rotten_tomato_review
      t.text :img_url
      t.text :trailer
      t.text :genres
      t.bigint :year

      t.timestamps
    end
  end
end
