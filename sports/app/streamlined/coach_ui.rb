# As this example demonstrates, the Additions module is entirely optional and can be left out of
# the UI file if it isn't needed.
#
# module CoachAdditions
#   def years_of_experience
#     5
#   end
# end
#
# Coach.class_eval { include CoachAdditions }

Streamlined.ui_for(Coach) do
  user_columns :first_name, { :html_options => { :title => "This field is required" }},
               :last_name,
               :middle_name, { :help => "This field is optional" },
               :sponsors,
               :team
  
  # Since we're redirecting back to the list view using render_filter in CoachesController, we need
  # to disable AJAX when editing and saving a record. The UI gets confused if we don't.
  edit_submit_button :ajax => false
end