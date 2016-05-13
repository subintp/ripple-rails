json.id @movie.id
json.name @movie.name
json.image_url @movie.image_url
json.reviews @movie.reviews, :id, :content, :rating, :likers_count