module API
  class ApplicationController < ActionController::API
    before_action :authenticate_identical!

    rescue_from StandardError => e
      render json: { status: 500, message: "Internal Server Error" }
    end
  end
end
