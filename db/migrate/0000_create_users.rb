class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string    :name, unique: true  #database側にも一意性を定義      
      t.timestamps
    end
  end
end
