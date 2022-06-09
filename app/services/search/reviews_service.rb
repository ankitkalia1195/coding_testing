module Search
  class ReviewsService < BaseService
    def execute
      super

      filter_by_following if params[:q][:from_following].present?
    end

    private

    # Examples of filter
    # {q: { from_following: true }}
    # {q: { from_following: { name: "alice"} }} # Case sensitive
    def filter_by_following
      target_users = @user.following_users
      target_users = target_users.where(name: params[:q][:from_following][:name]) if params[:q][:from_following].is_a?(Hash)
      target_user_ids = target_users.pluck(:id)

      @records = @records.where(author_id: target_user_ids)
    end

    def whitelisted_search_params
      [:title, :description, :rating]
    end
  end
end
