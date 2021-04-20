class V1::SheetsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_data, only: [:update, :destroy]
    def index
	    @data = Sheet.all
    end
	
	# 默认实现 弃用
    def create_back
	    @data = current_user.sheets.build(sheet_params)
	    if @data.save
		    render_success(@data)
	    else
		    render_detail_error(@data.errors)
	    end
    end
	
	# json 实现
	def create
		@sheet = current_user.sheets.build(sheet_params)
		
		if @sheet.save
			save_tags(params[:tags],@sheet.id)
			render_success(@sheet)
		else
			render_detail_error(@sheet.errors)
		end
	end

    def show
	    @data = Sheet.find(params[:id])
	    if current_user && current_user.collection?(@data.id)
		    # 如果登录，就判断是否收藏
		    @collection_id = true
	    else
		    # 未登陆或未收藏 都显示为未收藏
		    @collection_id = false
	    end
    end
	# 默认实现 弃用
    def update_back
	    if @data.update(ad_params)
		    render_success(@data)
	    else
		    render_detail_error(@data.errors)
	    end
    end
	
	# json 实现
	def update
		if @data.update(sheet_params)
			
			save_tags(params[:tags],@data.id)
			
			render_success(@data)
		else
			render_detail_error(@data.errors)
		end
	end

	def destroy
		@data.destroy
	end
	
	private
		def sheet_params
			params.permit(:title, :banner, :description, labels_attributes: [:id, :tag_id, :user_id])
		end
		
		def set_data
			@data = current_user.sheets.find(params[:id])
		end
		
		def save_tags tags, sheet_id
			# 歌单保存成功
			Label.where("sheet_id = ? and user_id = ?",sheet_id,current_user.id).delete_all
			# 如果有标签
			if tags && tags.count>0
				# 单个保存
				# TODO 改为事务处理
				tags.each do |tag|
					label=Label.new(id:tag["id"],tag_id:tag["tag_id"],sheet_id:tag["sheet_id"],user_id:current_user.id)
					label.save
				end
			end
		end
end
