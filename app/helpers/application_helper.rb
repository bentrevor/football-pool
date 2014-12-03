module ApplicationHelper
  def current_user
    @current_user ||= User.new(name: 'default_user')
  end

  def current_user_name
    @current_user.name if @current_user
  end

  def current_user=(user)
    @current_user = user
  end
end
