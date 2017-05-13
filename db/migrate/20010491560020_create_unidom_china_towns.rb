class CreateUnidomChinaTowns < ActiveRecord::Migration

  def change

    create_table :unidom_china_towns, id: :uuid do |t|

      t.references :region, type: :uuid, null: false

      t.column :numeric_code, 'char(9)', null: false, default: '0'*9

      t.string  :name,    null: false, default: '', limit: 200
      t.boolean :virtual, null: false, default: false

      t.text :instruction
      t.text :description

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Unidom::Common::OPENED_AT
      t.datetime :closed_at,        null: false, default: Unidom::Common::CLOSED_AT
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_china_towns, :region_id
    add_index :unidom_china_towns, :numeric_code

  end

end
