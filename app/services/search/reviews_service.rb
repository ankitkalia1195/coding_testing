module Search
  class ReviewsService < BaseService
    MINIMUM_SEARCH_CHARS = 3

    def execute
      raise API::Errors::InvalidSearchError if @search_query.present? && @search_query.length <= MINIMUM_SEARCH_CHARS

      super

      filter_by_search if @search_query.present?
      @records
    end

    private

    def filter_by_search
      @records = @records.joins(:user).where("title ILIKE %?% ", @search_query)
                          .or_where("description ILIKE %?%", @search_query)
    end
  end
end
