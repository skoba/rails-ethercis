class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  
  # before_filter :set_ehr_session_id

  # protected
  # def set_ehr_session_id
    
  # end
end
