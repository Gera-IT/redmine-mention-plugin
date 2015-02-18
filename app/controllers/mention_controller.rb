class MentionController < ApplicationController
	def search
		project = Project.find_by_identifier(params[:project_id])

    result = project.users.where("firstname like ? OR lastname like ?", "%#{params[:search_tag][:term]}%", "%#{params[:search_tag][:term]}%").each.inject([]) do |data, user|
    						data << {uid: user.login, value: user.name}
		end if project
		result ||= {}
    render json: {users: result}
	end
end