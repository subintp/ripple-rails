json.user do
  json.id @user.id
  json.name @user.name
  json.avathar_url @user.avathar_url
  json.is_following @current_user.follows?(@user)
  json.follows_you @user.follows?(@current_user)

  json.counts do
    json.followers @user.followers(User).count
    json.following @user.followees(User).count
    json.reviews @user.reviews.count
  end

  json.reviews @reviews do |review|
    json.partial! 'api/v1/reviews/review', review: review
  end

  json.watchlist @watchlist_movies do |watchlist_movie|
    json.id watchlist_movie.movie_id
    json.name watchlist_movie.movie.name
    json.image_url watchlist_movie.movie.image_url
  end
end