class CreateMoradors < ActiveRecord::Migration[7.1]
  def change
    create_table :moradors do |t|

      t.timestamps
    end
  end
end
