module User::Operation
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(User, :new)
      step Contract::Build(constant: User::Contract::Create)
    end
    step Nested(Present)
    step :assign_current_user!
    step Contract::Validate(key: :user)
    step Contract::Persist()

    def assign_current_user!(options, params:, **)
      options[:params][:user][:role] ||= 1
      options['model'][:dob] = params[:user][:dob]
      if options['current_user'].present?
        options[:params][:user][:created_user_id] = options['current_user'][:id]
        options[:params][:user][:updated_user_id] = options['current_user'][:id]
      else
        options[:params][:user][:created_user_id] = 3
        options[:params][:user][:updated_user_id] = 3
      end
    end
  end
end
