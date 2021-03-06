class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_couple
      couple_path(current_couple)
    elsif current_vendor
      vendor_path(current_vendor)
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
