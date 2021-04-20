class V1::CollectionsController < ApplicationController
	before_action :authenticate_user!
	def create
		collection = current_user.collections.build({ sheet_id: params[:sheet_id] })
		if collection.save
			render_success(collection)
		else
			render_argument_error
		end
	end
	def destroy
		collection = current_user.collections.find_by_sheet_id(params[:id])
		collection.destroy if collection.present?
	end
end
