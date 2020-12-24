class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.text :name
      t.text :imdb_link
      t.text :img_url
      t.bigint :birth_year
      t.bigint :death_year
      t.text :credit
      t.text :fun_fact_1
      t.text :fun_fact_2
      t.text :fun_fact_3
      t.text :quote_1
      t.text :quote_2
      t.text :quote_3

      t.timestamps
    end
  end
end
