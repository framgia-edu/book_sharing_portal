User.create!(
  name: "dinh van nam",
  email: "admin@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  admin: true,
  confirmed_at: Time.now.utc
  )
50.times do |n|
  name  = Faker::Book.author
  email = "author#{n+1}@gmail.com"
  Author.create(name: name, email: email, confirmed_at: Time.now.utc)
end
50.times do |n|
  name  = Faker::Book.author
  email = "user#{n+1}@gmail.com"
  intro = Faker::Lorem.paragraph(20)
  User.create!(
  name: name,
  email: email,
  introduction: intro,
  password: "123456",
  password_confirmation: "123456",
  confirmed_at: Time.now.utc
  )
end
categories_list = ["Sách bình luận văn học‎",
"Sách chính trị‎",
"Sách địa lý‎",
"Sách giáo khoa‎",
"Sách có nội dung hư cấu‎",
"Sách lịch sử‎",
"Sách phi hư cấu‎",
"Sách khoa học‎",
"Sách kinh doanh‎",
"Sách thiếu nhi‎",
"Sách thiếu niên‎",
"Sách tự lực‎",
"Sách khoa học viễn tưởng‎"]
categories_list.each do |cate|
  Category.create!(name: cate)
end

categories = Category.all
authors = Author.all
users =  User.all
100.times do |n|

  name  = Faker::Book.title
  intro = Faker::Lorem.paragraph(20)

  author = authors[rand(0...50)]
  user = users[rand(0..50)]
  book = user.books.create(name: name, introduce: intro)
  book.add_author author
  rand(5..20).times do |n|
    user = users[rand(0..50)]
    comment = Faker::Lorem.paragraph(20)
    rating = rand(4..10)
    unless user.review_exist? book
    book.add_review user, rating , comment
    end
  end
  rand(3..7).times do |n|
  category = categories[rand(0...13)]
  unless book.category_exist?(category)
  book.add_category category
  end
  end

end

