class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.datetime :build_date
      t.belongs_to :colour, null: false, foreign_key: true

      t.timestamps
    end
  end
end
