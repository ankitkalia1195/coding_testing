module API
  class TokensController < ApplicationController
    include JwtAuthenticator
    skip_before_action :authenticate_identical!

    def create
      if user = User.authenticate(params[:password])
        token_info = generate_api_token(user)
      end

      render json: token_info
    end
  end
end
