# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :screen_name
      t.string :name
      t.string :description
      t.string :profile_image_url

      t.timestamps
    end
  end
end
