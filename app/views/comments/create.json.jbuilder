json.status 'success'
json.id @comment.id
json.user_first_name @comment.user.first_name
json.user_last_name @comment.user.last_name
json.body @comment.body
