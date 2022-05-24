module User::Operation
  class Update < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(User, :find_by)
      step Contract::Build(constant: User::Contract::Update)
    end
    step Nested(Present)
    step :assign_current_user!
    step Contract::Validate(key: :user)
    step Contract::Persist()

    def assign_current_user!(options, params:, **)
      options['model'][:dob] = params[:user][:dob]
      options['model'][:join_date] = params[:user][:join_date]
      options['model'][:SSB_card_issue_date] = params[:user][:SSB_card_issue_date]
      options[:params][:user][:updated_user_id] = options['current_user'][:id]
      
    end
  end
end
