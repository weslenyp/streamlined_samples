module TeamsHelper
  # Called by render_wrapper.
  # Column#render_wrapper is very fragile, and is intended as an alternative to something even worse:
  # custom rendering an entire partial to make some tiny tweak. Use with care
  def red_content(meth,view,*args)
    if meth.name == "render_content"
      "<span style='color:red;'>#{meth.call(view,*args)}</span>"
    else
      meth.call(view,*args)
    end
  end
end
