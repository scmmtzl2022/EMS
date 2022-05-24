require 'reform/form/validation/unique_validator'
module User::Contract
  class Update < Reform::Form
  include Sync::SkipUnchanged
    property :name
    property :email
    property :role
    property :phone
    property :dob, as: :date
    property :address
    property :profile
    property :position
    property :join_date, as: :date
    property :employment_type
    property :department
    property :university
    property :degree
    property :skill
    property :language
    property :iq
    property :gender
    property :nrc_no
    property :marital_status
    property :card_id
    property :pc_number
    property :bank_account
    property :religion
    property :SSB_number
    property :SSB_card_issue_date, as: :date
    property :mac_address
    property :pc_password
    property :contact_name
    property :contact_phone
    property :relation
    property :created_user_id
    property :updated_user_id

    validates :name, presence: true, length: { maximum: 100 }
    validates :email, presence: true, length: { maximum: 100 },
                      format: { with: Constants::VALID_EMAIL_REGEX },
                      unique: true
    validates :phone, numericality: true, allow_blank: true, length: { minimum: 10, maximum: 13 }
    validates :address, length: { maximum: 255 }, allow_blank: true
    validates :profile, length: { maximum: 255 }, allow_blank: true
    validates :dob, format: { with: Constants::VALID_DATE_FORMAT }, allow_blank: true
  end
end
