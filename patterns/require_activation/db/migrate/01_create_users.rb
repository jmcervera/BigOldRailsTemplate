class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.timestamps
      t.string :login, :null => false
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token, :null => false
      t.integer :login_count, :default => 0, :null => false
      t.datetime :last_request_at
      t.datetime :last_login_at
      t.datetime :current_login_at
      t.string :last_login_ip
      t.string :current_login_ip
      t.string :roles
      t.string :first_name
      t.string :last_name
      t.string :perishable_token, :default => "", :null => false
      t.string :email, :default => "", :null => false
      t.boolean :active
    end

    add_index :users, :login
    add_index :users, :persistence_token
    add_index :users, :last_request_at
    add_index :users, :perishable_token
    add_index :users, :email
  end

  def self.down
    drop_table :users
  end
end
