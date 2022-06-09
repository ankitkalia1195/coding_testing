module Search
  class BaseService
    attr_reader :errors

    def initialize(params, user = nil)
      @user = user
      @search_query = params[:q]
      @order_query = params[:o]
      @direction_query = params[:d]
      @params = params
      @records = self.class.to_s.gsub("Service", "").constantize.all
    end

    def execute
      order if @order_query.present?
      search if @search_query.present?
      paginate

      @records
    end


    private

    def paginate
      @records = @records.page(@params[:page])
                         .extending(JsonPaginatable)
    end

    def search
      search_params = @search_query.slice(*whitelisted_search_params)
      @records = @records.where(search_params)
    end

    def order
      if @order_query.present? && @direction_query.present?
        @records = @records.order(@order_query => @direction_query)

        return
      end

      @records = @records.order(created_at: :desc)
    end

    def whitelisted_search_params
      raise "Whitelisted search params must be defined for the service"
    end
  end
end
