json.id @review.id
json.content @review.content
json.rating @review.rating
json.comments @review.comments, :id, :content, :user_id