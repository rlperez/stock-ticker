class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :symbol, limit: 10
      t.string :company_name
      t.string :exchange
      t.string :industry
      t.string :website
      t.text :description
      t.string :ceo
      t.string :issue_type
      t.string :sector

      t.timestamps
    end
  end
end
