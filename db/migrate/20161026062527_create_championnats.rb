class CreateChampionnats < ActiveRecord::Migration[5.0]
  def change
    create_table :championnats do |t|

      t.timestamps
    end
  end
end
