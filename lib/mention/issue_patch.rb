require_dependency 'issue'

module Mention
  module IssuePatch
    def self.included(base)
      base.class_eval do
        unloadable
        base.send(:after_save) do |issue|
          journal = issue.journals.last
          users = journal.notes.scan(/~[\w.]+/)
          if journal.try(:notes).try(:present?) && users.count > 0
            users = users.map {|u| u[1..-1]} #to remove ~ before user_name
            users = User.where(login: users)
            Mailer.issue_edit(issue.journals.last, users, users).deliver
          end
        end
      end
    end
  end
end
