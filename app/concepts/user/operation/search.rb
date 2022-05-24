# frozen_string_literal: true

module User::Operation
  class Search < Trailblazer::Operation
    step :get_users

    def get_users(options, params:, **)
      options['users'] = if options[:is_admin]
                           User.where("id LIKE :id or name LIKE :name or department LIKE :department", {:id => "%#{params[:search_keyword]}%", :name => "%#{params[:search_keyword]}%", :department => "%#{params[:search_keyword]}%"})
                         end
      options['last_search_keyword'] = params[:search_keyword]
    end
  end
end

