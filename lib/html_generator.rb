require "erb_generator"

class HTMLGenerator < ERBGenerator

  def initialize(layout = nil)
    if layout
      layout
      pend_things = layout.split('<%= yield %>')
      @prepend = pend_things[0]
      @append = pend_things[1]
    end
  end


  def section(text)
    template = "#{@prepend}<section><%=awesome_text%></section>#{@append}"
    options_hash = {:locals => {:awesome_text => text, :title_text => "title"}}
    erb(template, options_hash)
  end

  def unordered_list(items)
    template =
        "#{@prepend}<ul>
    <% html_items.each do |item| %>
    <li><%=item%></li>
    <%end%>
    </ul>#{@append}"

    options_hash = {:locals => {:html_items => items}}
    erb(template, options_hash)
  end

  def button(button, type = {})
    if type[:class] == nil
      var1 = "#{@prepend}<button><%=button_type%></button>#{@append}"
    else
      var1 = "#{@prepend}<button class='<%=button_class[:class]%>'><%=button_type%></button>#{@append}"
    end
    template = var1
    option_hash = {:locals => {:button_type => button, :button_class => type}}
    erb(template, option_hash)

  end

end
