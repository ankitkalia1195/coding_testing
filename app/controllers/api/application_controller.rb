module API
  class ApplicationController < ActionController::API
    before_action :authenticate_identical!

    rescue_from StandardError => e
      render json: { status: 500, message: "Internal Server Error" }
    end

    rescue_from API::Errors::InvalidSearchError => e
      render json: { status: 422, message: "Search must be minimum of 3 characters" }
    end
  end
end
