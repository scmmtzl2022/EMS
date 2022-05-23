class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :profile
      t.string :role
      t.string :phone
      t.string :address
      t.date :dob
      t.date :join_date
      t.string :position
      t.string :employment_type
      t.string :department
      t.string :university
      t.string :degree
      t.string :skill
      t.string :language
      t.string :iq
      t.string :gender
      t.string :nrc_no
      t.string :marital_status
      t.string :card_id
      t.string :pc_number
      t.bigint :bank_account
      t.string :religion
      t.string :SSB_number
      t.date :SSB_card_issue_date
      t.string :mac_address
      t.string :pc_password
      t.string :contact_name
      t.string :contact_phone
      t.string :relation
      t.bigint :created_user_id
      t.bigint :updated_user_id
      t.integer :deleted_user_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
