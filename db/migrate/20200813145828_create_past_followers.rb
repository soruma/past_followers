# frozen_string_literal: true

class CreatePastFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :past_followers do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :followers_count

      t.timestamps
    end
  end
end
