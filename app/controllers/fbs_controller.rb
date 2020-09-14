class FbsController < ApplicationController
    def create
        @fb = Fb.find_or_create_by(uid: auth['uid']) do |u|
          u.name = auth['info']['name']
          u.email = auth['info']['email']
          u.image = auth['info']['image']
        end
  #    binding.pry
        session[:user_id] = @fb.id
     
        redirect_to user_path(@user)
      end
     
      private
     
      def auth
        request.env['omniauth.auth']
      end
end
