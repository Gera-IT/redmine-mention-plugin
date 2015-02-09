class MentionController < ApplicationController
	def search
		project = Project.find_by_identifier(params[:project_id])

    result = project.users.with_name(params[:search_tag]).each.inject([]) do |data, user|
    						data << {id: user.id, username: user.login, full_name: user.name, email: user.mail}
		end if project
		result ||= {}
    render json: {users: result}
	end
end