class CreateConsults < ActiveRecord::Migration[5.2]
  def change
    create_table :consults do |t|
      t.string :username
      t.float :uf_value
      t.date :date_requested

      t.timestamps
    end
  end
end
