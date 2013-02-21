module TeamMemberHelper
  
  def last_user_event(user)
    Redmine::Activity::Fetcher.new(User.current, :author => user).events(nil, nil, :limit => 1).first
  end
  
end