module Mention
  module JournalHelperPatch
    def self.included(base)
      base.class_eval do
        def render_notes(issue, journal, options={})
          content = ''
          editable = User.current.logged? && (User.current.allowed_to?(:edit_issue_notes, issue.project) || (journal.user == User.current && User.current.allowed_to?(:edit_own_issue_notes, issue.project))) # Make this a separate function call.
          links = []
          if !journal.notes.blank?
            links << link_to(image_tag('comment.png'),
                             {:controller => 'journals', :action => 'new', :id => issue, :journal_id => journal},
                             :remote => true,
                             :method => 'post',
                             :title => l(:button_quote)) if options[:reply_links]
            links << link_to_in_place_notes_editor(image_tag('edit.png'), "journal-#{journal.id}-notes",
                                                   { :controller => 'journals', :action => 'edit', :id => journal, :format => 'js' },
                                                      :title => l(:button_edit)) if editable
          end
          content << content_tag('div', links.join(' ').html_safe, :class => 'contextual') unless links.empty?
          content << textilizable(journal, :notes)
          content = Mention.update_tag(content)
          css_classes = "wiki"
          css_classes << " editable" if editable
          content_tag('div', content.html_safe, :id => "journal-#{journal.id}-notes", :class => css_classes)
        end
      end
    end
  end
end