class CreateLogBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :log_books do |t|
      t.string :place, null: false
      t.string :temperature
      t.string :water_temperature
      t.string :transparency
      t.string :en_time
      t.string :ex_time
      t.string :deep_avg
      t.string :deep_max
      t.date   :date
      t.text    :weight
      t.text    :wear
      t.text    :free_space
      t.text    :member
      t.references :user
      t.timestamps
    end
  end
end
