# frozen_string_literal: true

class ApplicationController < ActionController::Base
  #before_action :authorized
 # before_action :AdminAuthorized
  helper_method :current_user
  helper_method :logged_in?, :admin?, :user?

  def current_user
    User.find_by(id: cookies.signed[:user_id])
  end

  def admin?
    current_user.role.to_i.zero? if current_user
  end

  def user?
    current_user.role.to_i == 1 if current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to '/welcome' unless logged_in?
  end

  def AdminAuthorized
    redirect_to '/welcome' unless admin?
  end
  
  def check_resource(resource)
    if resource 
      true
    else 
      render :file => Rails.root.join('public', '404.html'),  :status => 404
    end
  end
end
