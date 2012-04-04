module UserHelpers
  def create_user(attributes = {})
    # Make sure all keys are symbols
    attributes.keys.each { |key| attributes[key.to_sym] = attributes.delete(key) }

    attributes[:password_confirmation] ||= attributes[:password]
    Factory.create(:user, attributes)
  end

  def get_user(name)
    first_name = name.split(' ')[0]
    return @user if @user.first_name == first_name
    user = User.find_by_first_name(first_name)
    raise "Couldn't find a user with first name #{first_name}" if user.nil?
    user
  end
end

World(UserHelpers)