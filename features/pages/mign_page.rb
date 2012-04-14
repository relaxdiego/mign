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

  def self.has_html_element_id(html_element_id)
    html_element_id = html_element_id.to_s.gsub!(/^\#?/, '')
    send :define_method, "has_#{ html_element_id }_html_element?".gsub(/-/, '_') do
      return has_html_element?(html_element_id), html_element_id
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
    session.current_path == self.path && missing_html_elements.length == 0
  end

  def has_html_element?(html_element_id)
    session.has_selector? "##{ html_element_id.to_s }"
  end

  #=====================
  # ASSERTIONS
  #=====================

  def should_be_current
    unless is_current?
      missing = missing_html_elements

      error = "Expected #{ self.url } but another page was returned."
      error << " URL: #{ session.current_url }." if session.current_url != self.url
      error << " Missing HTML ID#{ missing.length > 1 ? 's' : '' }: #{ missing.join(', ') }" if missing.length > 0

      raise PageAssertionError, error
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

  def missing_html_elements
    missing = []
    methods.select{ |m| m.to_s =~ /^has_.+_html_element\?$/ }.each do |method_name|
      not_missing, element_name = send(method_name)
      missing << element_name unless not_missing
    end
    missing
  end

  private

  def session
    @session
  end
end

class PageAssertionError < StandardError; end