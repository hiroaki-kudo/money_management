
      User.create!(name: "神様",
               email: "kamisama@kamisama.com",
               # parent_or_child: "0",
               password: "123abc",
               admin: "true"
               )

  user = User.create!(name: "ゲストユーザ",
                email: "guest@guest.com",
                parent_or_child: "1",
                password: "123abc",
                admin: "false"
                )

      User.create!(name: "母親",
               email: "haha@haha.com",
               parent_or_child: "0",
               password: "123abc",
               admin: "false"
               )

   Treasurer.create!(use_date_at: "2025-07-01",
                     category_id: "2",
                     use_what: "お菓子",
                     use_money: "200",
                     user: user
                     )

   Treasurer.create!(use_date_at: "2025-07-01",
                     category_id: "3",
                     use_what: "電車代",
                     use_money: "400",
                     user: user
                     )

   Treasurer.create!(use_date_at: "2025-07-01",
                     category_id: "4",
                     use_what: "鉛筆",
                     use_money: "100",
                     user: user
                     )

   Treasurer.create!(use_date_at: "2025-07-01",
                     category_id: "4",
                     use_what: "消しゴム",
                     use_money: "50",
                     user: user
                     )

   Treasurer.create!(use_date_at: "2025-07-01",
                     category_id: "2",
                     use_what: "お菓子",
                     get_money: "300",
                     user: user
                     )

   Treasurer.create!(use_date_at: "2025-07-01",
                     category_id: "2",
                     use_what: "お菓子",
                     use_money: "200",
                     user: user
                     )
