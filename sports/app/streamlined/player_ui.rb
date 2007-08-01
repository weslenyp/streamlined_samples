class PlayerUI < Streamlined::UI
  # This turns off the quick delete button in the list view.
  quick_delete_button false    
                
  # Only show the CSV and XML export links
  # exporters :csv, :xml         
end