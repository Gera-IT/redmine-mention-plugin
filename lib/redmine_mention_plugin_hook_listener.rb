class RedmineMentionPluginHookListener < Redmine::Hook::ViewListener

  def view_layouts_base_html_head(context={})
    javascript_include_tag('lib/jquery.mentions.js', :plugin => 'redmine_mention_plugin')+
    javascript_include_tag('redmine-mention.js', :plugin => 'redmine_mention_plugin')+
    stylesheet_link_tag("jquery.mentions.css", :plugin => 'redmine_mention_plugin')
  end

end
