# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def after_update_path_for(resource)
    users_account_path(current_user)
  end
end
