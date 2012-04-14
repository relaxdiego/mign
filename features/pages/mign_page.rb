# Base class inherited by other pages
class MignPage
  def self.visit
    page = new
    page.visit
    page
  end

  def self.path(path)
    send :define_method, :path do
      path
    end
  end

  def self.default_submit_button(button_id)
    send :define_method, :submit_button_id do
      button_id
    end
  end

  attr_reader :path
  default_submit_button 'submit'

  def initialize
    @session = Capybara.current_session
  end

  #=====================
  # ACTIONS
  #=====================

  def visit
    session.visit path
  end

  def fill_in(field_id, value)
    unless session.has_selector? "##{ field_id.to_s }"
      raise PageAssertionError, "#{ self.class }: Can't find any field with id='#{ field_id }'"
    end
    session.fill_in field_id.to_s, :with => value
  end

  def submit
    unless session.has_selector? "##{ submit_button_id }"
      raise PageAssertionError, "#{ self.class }: Can't find a submit button with id='#{ submit_button_id }'"
    end
    session.click_on "#{ submit_button_id }"
  end

  #=====================
  # QUERIES
  #=====================

  def is_current?
    session.current_path == self.path
  end

  #=====================
  # ASSERTIONS
  #=====================

  def should_be_current
    unless is_current?
      raise PageAssertionError, "Expected #{ url } but #{ session.current_url } was returned."
    end
  end

  def should_not_be_current
    if is_current?
      raise PageAssertionError, "Expected to NOT be redirected to #{ url }."
    end
  end

  def should_have_content(content)
    unless session.has_content?(content)
      raise PageAssertionError, "#{ self.class } does not contain the content '#{ content }'"
    end
  end

  #=====================
  # OTHERS
  #=====================

  def url
    "#{ session.current_host }#{ path }"
  end

  private

  def session
    @session
  end
end

class PageAssertionError < StandardError; end