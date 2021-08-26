User.create!(name: "管理者ユーザ",
             email: "kanri@kanri.com",
             parent_or_child: 0,
             password: "123qwe",
             admin: "true"
             )

User.create!(name: "ゲストユーザ(親)",
             email: "haha@haha.com",
             parent_or_child: 0,
             password: "123qwe",
             admin: "false"
             )

User.create!(name: "ゲストユーザ(子)",
             email: "guest@guest.com",
             parent_or_child: 1,
             password: "123qwe",
             admin: "false"
             )

User.create!(name: "悟空",
              email: "goku@goku.com",
              parent_or_child: 0,
              password: "123qwe",
              admin: "false"
              )

User.create!(name: "ご飯",
              email: "gohan@gohan.com",
              parent_or_child: 1,
              password: "123qwe",
              admin: "false"
              )

User.create!(name: "ベジータ",
              email: "vegita@vegita.com",
              parent_or_child: 0,
              password: "123qwe",
              admin: "false"
              )

User.create!(name: "トランクス",
             email: "torankus@torankus.com",
             parent_or_child: 1,
             password: "123qwe",
             admin: "false"
             )

User.create!(name: "優作",
              email: "yuusaku@yuusaku.com",
              parent_or_child: 0,
              password: "123qwe",
              admin: "true"
              )

User.create!(name: "新一",
              email: "shinichi@shinichi.com",
              parent_or_child: 1,
              password: "123qwe",
              admin: "false"
              )

User.create!(name: "ひろし",
              email: "hiroshi@hiroshi.com",
              parent_or_child: 0,
              password: "123qwe",
              admin: "false"
              )

User.create!(name: "しんのすけ",
              email: "shintyan@shintyan.com",
              parent_or_child: 1,
              password: "123qwe",
              admin: "false"
              )

Management.create!(email: "guest@guest.com",
                   parent_id: 2,
                   kid_id: 3
                   )

Management.create!(email: "gohan@gohan.com",
                   parent_id: 4,
                   kid_id: 5
                   )

Management.create!(email: "torankus@torankus.com",
                   parent_id: 6,
                   kid_id: 7
                   )

Management.create!(email: "yuusaku@yuusaku.com",
                   parent_id: 8,
                   kid_id: 9
                   )

Management.create!(email: "hiroshi@hiroshi.com",
                  parent_id: 10,
                  kid_id: 11
                  )

Treasurer.create!(use_date_at: "2021-07-01",
                  category_id: 1,
                  use_what: "お菓子",
                  use_money: 200,
                  get_money: 0,
                  user_id: 3,
                  management_id: 1
                  )

Treasurer.create!(use_date_at: "2021-07-07",
                  category_id: 2,
                  use_what: "電車代",
                  use_money: 400,
                  get_money: 0,
                  user_id: 3,
                  management_id: 1
                  )

Treasurer.create!(use_date_at: "2021-07-08",
                  category_id: 3,
                  use_what: "鉛筆",
                  use_money: 100,
                  get_money: 0,
                  user_id: 3,
                  management_id: 1
                  )

Treasurer.create!(use_date_at: "2025-07-01",
                  category_id: 3,
                  use_what: "消しゴム",
                  use_money: 50,
                  get_money: 0,
                  user_id: 3,
                  management_id: 1
                  )

Treasurer.create!(use_date_at: "2025-07-01",
                  category_id: 2,
                  use_what: "バス代",
                  use_money: 300,
                  get_money: 0,
                  user_id: 3,
                  management_id: 1
                  )

Favorite.create!(user_id: 3,
                 treasurer_id: 1
                  )
Favorite.create!(user_id: 3,
                 treasurer_id: 2
                  )
Favorite.create!(user_id: 3,
                 treasurer_id: 3
                  )
Favorite.create!(user_id: 3,
                 treasurer_id: 4
                  )
Favorite.create!(user_id: 3,
                 treasurer_id: 5
                  )

Comment.create!(content: "おいしかった",
                treasurer_id: 1,
                user_id: 3
                )

Comment.create!(content: "楽しかった",
                treasurer_id: 2,
                user_id: 3
                )

Comment.create!(content: "ワクワク",
                treasurer_id: 3,
                user_id: 3
                )

Comment.create!(content: "嬉しい",
                treasurer_id: 4,
                user_id: 3
                )

Comment.create!(content: "バス大好き",
                treasurer_id: 5,
                user_id: 3
                )
