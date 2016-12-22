class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, :id => false do |t|
      t.string :uuid, limit: 36, primary_key: true, null: false
      t.string :email
      t.string :username, :unique => true

      t.string :pw_func
      t.string :pw_alg
      t.integer :pw_cost
      t.integer :pw_key_size
      t.string :pw_nonce
      
      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip


      t.timestamps
    end

    add_index :users, :email
    add_index :users, :reset_password_token, :unique => true
  end
end
