# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, :foreign_key => :created_user_id, :primary_key => :id, :dependent => :destroy
  belongs_to :created_user, class_name: 'User', foreign_key: 'created_user_id'
  belongs_to :updated_user, class_name: 'User', foreign_key: 'updated_user_id'

  # adds virtual attributes for authentication
  #has_secure_password

  # soft-delete
  acts_as_paranoid

  # image
  has_one_attached :profile

  # to check old password with new password
  attr_accessor :old_password
  attr_accessor :remember_me
  
  # set per_page globally
  WillPaginate.per_page = 10
end
