# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance| # This disables 'field-with-error div' setting when adding errors to display issues with article creation (or something)
  html_tag.html_safe
end