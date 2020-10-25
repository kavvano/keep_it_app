class CreateKeepItUps < ActiveRecord::Migration[6.0]
  def change
    create_table :keep_it_ups do |t|

      t.timestamps
    end
  end
end
