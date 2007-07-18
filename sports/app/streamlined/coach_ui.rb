# The Additions module is entirely optional and can be left out of the UI file if it isn't needed.
#
# module CoachAdditions
#   def years_of_experience
#     5
#   end
# end

class CoachUI < Streamlined::UI
  # Since we're redirecting back to the list view using render_filter in CoachesController, we need
  # to disable AJAX when editing and saving a record. If we don't, the UI gets confused.
  edit_submit_button :ajax => false
end