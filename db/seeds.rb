require "open-uri"

puts 'Cleaning database...'

PostFont.destroy_all if Rails.env.development?
Post.destroy_all if Rails.env.development?
Font.destroy_all if Rails.env.development?
Tag.destroy_all if Rails.env.development?

tag_1 = Tag.create!(name: "Tech")
tag_2 = Tag.create!(name: "Classic")
tag_3 = Tag.create!(name: "Experimental")

puts "#{Tag.count} tags created!"

font_1 = Font.create!(name: "Arial", free_commercial: true, google: true)
font_2 = Font.create!(name: "Open Sans", free_commercial: true, google: true)
font_3 = Font.create!(name: "Roboto", free_commercial: false, google: false)
font_4 = Font.create!(name: "Calibre", free_commercial: false, google: false)
font_5 = Font.create!(name: "Zingy", free_commercial: false, google: false)

puts "#{Font.count} fonts created!"

post_photo_1 = URI.open('https://i.pinimg.com/564x/0e/fe/9c/0efe9c31e4bf98c0601261817f766074.jpg')
post_1 = Post.new(website: "Studio Almond", url: "https://www.almond.studio/", tag: tag_2)
post_1.photo.attach(io: post_photo_1, filename: 'post_photo_1.jpg', content_type: 'image/jpeg')
post_1.save!

PostFont.create!(font: font_1, post: post_1)
PostFont.create!(font: font_5, post: post_1)

post_photo_2 = URI.open('https://i.pinimg.com/236x/ac/19/60/ac1960f861fd5c8ab3dbe499dbd11446.jpg')
post_2 = Post.new(website: "Weapons of Reason", url: "https://weaponsofreason.com/", tag: tag_2)
post_2.photo.attach(io: post_photo_2, filename: 'post_photo_2.jpg', content_type: 'image/jpeg')
post_2.save!

PostFont.create!(font: font_2, post: post_2)

post_photo_3 = URI.open('https://i.pinimg.com/564x/1a/3f/98/1a3f9876cf5bd41a3c3fe45792f4996a.jpg')
post_3 = Post.new(website: "Weapons of Reason", url: "https://weaponsofreason.com/", tag: tag_2)
post_3.photo.attach(io: post_photo_3, filename: 'post_photo_3.jpg', content_type: 'image/jpeg')
post_3.save!

PostFont.create!(font: font_4, post: post_3)

post_photo_4 = URI.open('https://i.pinimg.com/564x/b8/5e/c5/b85ec523cacfdc7d17744093ea45299e.jpg')
post_4 = Post.new(website: "Weapons of Reason", url: "https://weaponsofreason.com/", tag: tag_3)
post_4.photo.attach(io: post_photo_4, filename: 'post_photo_2.jpg', content_type: 'image/jpeg')
post_4.save!

PostFont.create!(font: font_1, post: post_4)

post_photo_5 = URI.open('https://i.pinimg.com/236x/97/ab/8c/97ab8c03d178b5774ff16846a93eec1e.jpg')
post_5 = Post.new(website: "Weapons of Reason", url: "https://weaponsofreason.com/", tag: tag_1)
post_5.photo.attach(io: post_photo_5, filename: 'post_photo_5.jpg', content_type: 'image/jpeg')
post_5.save!

PostFont.create!(font: font_2, post: post_5)

post_photo_6 = URI.open('https://i.pinimg.com/564x/b2/87/28/b2872872ac46f78bbb749e90a89e0a50.jpg')
post_6 = Post.new(website: "Weapons of Reason", url: "https://weaponsofreason.com/", tag: tag_1)
post_6.photo.attach(io: post_photo_6, filename: 'post_photo_6.jpg', content_type: 'image/jpeg')
post_6.save!

PostFont.create!(font: font_4, post: post_6)

puts "#{PostFont.count} postfonts created!"
