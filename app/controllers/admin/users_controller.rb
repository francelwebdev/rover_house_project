class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
      
  end
end
