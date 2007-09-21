# This is an example of an Additions module. Additions modules are used to add custom columns to
# the Streamlined views. The value returned can be a string, raw HTML, etc.
#
# Methods in an Additions module have access to all the columns on the current record. For example,
# we could create an addition that combines the first and last name of a person this way:
#
#   module PersonAdditions
#     def first_and_last_name
#       "#{first_name} #{last_name}"
#     end
#   end
#
module TeamAdditions 
  # Here, we're specifying an additional column called "personnel" that displays
  # the total number of people (players plus coach) on the team.
  def personnel
    "#{players.size + 1} people"
  end
  
  # The annual sales column is stored in the database as a decimal number. It should be
  # formatted nicely in the view so we define an additional column for it here. We also
  # set :human_name and :sort_column in the UI definition near the end of this file.
  def formatted_annual_sales
    number_to_currency(annual_sales, :precision => 0)
  end
end

# Streamlined currently requires that you manually include Additions modules in your model class.
# This process of inclusion will be automated at some point in the future. You must also include
# any Rails helpers your Addition methods might use.
Team.class_eval do
  include TeamAdditions
  include ActionView::Helpers::NumberHelper
end

# ui_for is the heart of Streamlined's declarative system. It enables you to control which
# columns are displayed in various views, which buttons show up, whether or not columns are linked,
# and so on. The wiki has a good overview of the declarations available to you.
#
# Older versions of Streamlined used inheritance, e.g. TeamUI < Streamlined::UI.
Streamlined.ui_for(Team) do
  user_columns  :name, { :html_options => { :class => "team_input_field" }, :link_to => {:action => 'show'}},
                :city, { :html_options => { :class => "team_input_field", :size => 20 }},
                :sport, { :create_only => true, :enumeration => Team::Sport::SPORTS },
                :coach, 
                         {
                           :show_view => [:name, {:fields => [:first_name, :last_name]}],
                           :edit_view => [:select, {:fields => [:first_name, :last_name]}],
                         },
                :home_state, { :show_view => [:link], :edit_in_list => false },
                :players,
                :personnel, { :render_wrapper => :red_content },
                :formatted_annual_sales, { :human_name => "Annual Sales", :sort_column => "annual_sales" }

  # If you'd like the list view to include a different set of columns from the other views, 
  # you can do so via the #list_columns declaration as illustrated below.
  # list_columns :name,
  #              :city,      
  #              :home_state         
  edit_columns  :name,
                :city,
                :home_state,
                :annual_sales

end