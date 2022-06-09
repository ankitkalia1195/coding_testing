module API
  class ReviewsController < ApplicationController
    def index
      @reviews = Search::ReviewsService.new(params, @current_identical).execute

      render json: @reviews
    end

    private

    def permitted_params
      params.permit(:q, :o, :d)
    end
  end
end
