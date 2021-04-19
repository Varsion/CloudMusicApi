class V1::AdsController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	before_action :set_ad, only: [:destroy, :update]
	
	  def index
		  @ads = Ad.all
	  end
	
	  def create
		  @ad = current_user.ads.build(ad_params)
		  if @ad.save
			  render_success(@ad)
		  else
			  render_detail_error(@ad.errors)
		  end
	  end
	
	  def update
		  if @ad.update(ad_params)
			  render_success(@ad)
		  else
			  render_detail_error(@ad.errors)
		  end
	  end
	
	  def destroy
		  @ad.destroy
	  end
		
	  private
		  def ad_params
			  params.permit(:title, :banner, :uri, :order)
		  end
	
		  def set_ad
			  @ad = current_user.ads.find(params[:id])
		  end
end
