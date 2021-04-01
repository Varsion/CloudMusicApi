class HomesController < ApplicationController
	 def index
 		 render json: {
  			code: 200,
  			info: 'Cloud Music Api is Running!',
  			data: nil
	     }
 	end
end
