class Admin::DashboardController < Admin::BaseController
  def home
    @users = User.all
  end
end
