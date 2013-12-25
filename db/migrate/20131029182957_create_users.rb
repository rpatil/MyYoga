class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :date_of_birth
      t.string :address
      t.string :address2
      t.string :city
      t.string :landmark
      t.string :state
      t.string :country
      t.string :username
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.boolean :terms_acceptance
      t.boolean :email_verify
      t.boolean :spam_user
      t.string :user_type
      t.date :date_of_registration

      t.timestamps
    end
  end
end
