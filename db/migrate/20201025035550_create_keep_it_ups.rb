class CreateKeepItUps < ActiveRecord::Migration[6.0]
  def change
    create_table :keep_it_ups do |t|
      t.references :user,  null: false, foreign_key: true
      t.references :tweet, null: false, foreign_key: true
      t.timestamps
    end
  end
end
