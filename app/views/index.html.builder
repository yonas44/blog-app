@users.each do |user|
  xml.div(id: 'user') do
    xml.img(src: user.photo, id: 'user-img')
    xml.h4 user.name
    xml.span 'Number of posts#user.posts_counter'
  end
end
