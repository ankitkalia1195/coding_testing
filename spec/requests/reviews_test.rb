require 'rails_helper'

RSpec.describe Api::ReviewsController, type: :controller do
  it "displays list of reviews" do
    user = create(:user)
    review = create(:review)

    request.headers["X-Authorization-Token"] = "Bearer #{generate_token(user)}"
    response = JSON.parse(get(:reviews))

    expect response["data"][0].to eq(review.to_h)
  end

  it "can search the review by title" do
    user = create(:user)
    review = create(:review)
    target_review = create(:review, title: "title")

    request.headers["X-Authorization-Token"] = generate_token(user)
    response = JSON.parse(get(:reviews, params: { q: { title: "itl"}}))

    expect response["data"][0].to eq(target_review.to_h)
  end

  it "can search the review by description" do
    user = create(:user)
    review = create(:review)
    target_review = create(:review, description: "description")

    request.headers["X-Authorization-Token"] = generate_token(user)
    response = JSON.parse(get(:reviews, params: { q: { description: "desc"}}))

    expect response["data"][0].to eq(target_review.to_h)
  end
end
