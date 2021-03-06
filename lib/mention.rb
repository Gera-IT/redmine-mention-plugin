require_dependency 'issue'
require_dependency 'watcher'
require_dependency 'user'
require_dependency 'issue'
require_dependency 'wiki_page'
require 'mention/journal_patch'
require 'mention/user_patch'
require 'mention/issue_patch'
require 'mention/journal_helper_patch'
require 'mention/wiki_helper_patch'
require 'mention/wiki_content_patch'

module Mention
	def self.update_tag(content, watchable=nil)
    mentioned_users = content.scan(/\[\~\w+\]/)
    mentioned_users.each do |mentioned_user|
      if user = User.find_by_login(mentioned_user[2..-2])
      	if watchable.is_a?(Issue) or watchable.is_a?(WikiPage)
					content = content.gsub(mentioned_user, "<a class='user active' href='/users/#{user.id}'>#{user.name}</a>")
      	else
      		content = content.gsub(mentioned_user, "<a class='user active' href='/users/#{user.id}'>#{user.name}</a>")
      	end
      end
    end
    content
	end

  def self.apply_patch
	  Journal.send(:include, Mention::JournalPatch)
	  User.send(:include, Mention::UserPatch)
		Issue.send(:include, Mention::IssuePatch)
	  JournalsHelper.send(:include, Mention::JournalHelperPatch)
	  WikiHelper.send(:include, Mention::WikiHelperPatch)
	  WikiContent.send(:include, Mention::WikiContentPatch)
  end
end