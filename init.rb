require 'redmine'
require 'mention'

Rails.application.config.to_prepare do
  Mention.apply_patch
end

Redmine::Plugin.register :redmine_mention_plugin do
  name 'redmine_mention_plugin'
  author 'Systango avdept'
  description 'Sends email to user after mentioning him/her (e.g. @john) in issue note and wiki'
  version '0.0.2'
  requires_redmine :version_or_higher => '2.2.4'

  # require 'redmine_mention_plugin_hook_listener.rb'

  class MentionPluginAssets < Redmine::Hook::ViewListener

    def view_layouts_base_html_head(context={})
      javascript_include_tag('lib/jquery.mentions.js', :plugin => 'redmine_mention_plugin')+
          javascript_include_tag('redmine-mention.js', :plugin => 'redmine_mention_plugin')+
          javascript_include_tag('lib/jquery-ui.js', :plugin => 'redmine_mention_plugin')+
          stylesheet_link_tag("jquery.mentions.css", :plugin => 'redmine_mention_plugin')+
          stylesheet_link_tag("jquery-ui.css", :plugin => 'redmine_mention_plugin')
    end

  end

end
