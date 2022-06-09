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
    response = JSON.parse(get(:reviews, params: { q: { title: "title"}}))

    expect response["data"][0].to eq(target_review.to_h)
  end

  it "can search the review by description" do
    user = create(:user)
    review = create(:review)
    target_review = create(:review, description: "desc")

    request.headers["X-Authorization-Token"] = generate_token(user)
    response = JSON.parse(get(:reviews, params: { q: { description: "desc"}}))

    expect response["data"][0].to eq(target_review.to_h)
  end

  it "can filter by following users" do
    user = create(:user)
    another_user = create(:user)
    follower_user = create(:user)
    follower = create(:follower, follower: follower_user, followee: user)

    review = create(:review, user: another_user)
    target_review = create(:review, user: user)

    request.headers["X-Authorization-Token"] = generate_token(follower_user)
    response = JSON.parse(get(:reviews, params: { from_following: true }))

    expect response["data"][0].to eq(target_review.to_h)
    expect response["data"].count.to eq(1)
  end

  it "can filter by following users names" do
    user = create(:user)
    another_user = create(:user)
    follower_user = create(:user)
    follower = create(:follower, follower: follower_user, followee: user)

    review = create(:review, user: another_user)
    target_review = create(:review, user: user)

    request.headers["X-Authorization-Token"] = generate_token(follower_user)
    response = JSON.parse(get(:reviews, params: { from_following: { name: "alice"} }))

    expect response["data"][0].to eq(target_review.to_h)
    expect response["data"].count.to eq(1)
  end
end
