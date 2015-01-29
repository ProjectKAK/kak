class CreateUseringredients < ActiveRecord::Migration
  def change
    create_table :useringredients do |t|
      t.string :name

      t.timestamps null: false
      t.references :user
      t.references :ingredient
    end
  end
end
