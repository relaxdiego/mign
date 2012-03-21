def get_user(name)
  first_name = name.split(' ')[0]
  return @user if @user.first_name == first_name
  user = User.find_by_first_name(first_name)
  raise "Couldn't find a user with first name #{first_name}" if user.nil?
  user
end