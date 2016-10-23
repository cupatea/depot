class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  before_action :authorize
  protected
    def authorize
      if User.count.zero?
        User.create!(name:'test', password: 'test')
        session[:user_id] = User.first.id
        redirect_to edit_user_url(User.first)
      else
        unless User.find_by(id: session[:user_id])
          redirect_to login_url, notice: "Please log in"
        end
      end
    end
end
