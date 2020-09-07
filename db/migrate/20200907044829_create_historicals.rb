class CreateHistoricals < ActiveRecord::Migration[5.2]
  def change
    create_table :historicals do |t|
      t.date :uf_date
      t.float :uf_value

      t.timestamps
    end
  end
end
