class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :title,    null: false
      t.text       :details,  null: false
      t.bigint     :price,    null: false
      t.integer    :seller_id
      t.references :user, foreign_key:

      t.timestamps
    end
  end
end
