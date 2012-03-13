def get_user(name)
  first_name = name.split(' ')[0]
  new_member = User.find_by_first_name(first_name)
  raise "Couldn't find a user with first name #{first_name}" if new_member.nil?
  new_member
end