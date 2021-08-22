      User.create!(name: "管理者ユーザ",
               email: "kanri@kanri.com",
               parent_or_child: "0",
               password: "123qwe",
               admin: "true"
               )
  user = User.create!(name: "ゲストユーザ(子供)",
                email: "guest@guest.com",
                parent_or_child: "1",
                password: "123qwe",
                admin: "false"
                )
      User.create!(name: "母親",
               email: "haha@haha.com",
               parent_or_child: "0",
               password: "123qwe",
               admin: "false"
               )

management = Management.create!(pocket_money: 3000,
                                email: "guest@guest.com",
                                parent_id: User.third.id,
                                kid_id: User.second.id
                                )

   Treasurer.create!(use_date_at: "2025-07-01",
                     category_id: "2",
                     use_what: "お菓子",
                     use_money: "200",
                     user: user,
                     management: management
                     )
   Treasurer.create!(use_date_at: "2025-07-01",
                     category_id: "3",
                     use_what: "電車代",
                     use_money: "400",
                     user: user,
                     management: management
                     )
   Treasurer.create!(use_date_at: "2025-07-01",
                     category_id: "4",
                     use_what: "鉛筆",
                     use_money: "100",
                     user: user,
                     management: management
                     )
   Treasurer.create!(use_date_at: "2025-07-01",
                     category_id: "4",
                     use_what: "消しゴム",
                     use_money: "50",
                     user: user,
                     management: management
                     )
   Treasurer.create!(use_date_at: "2025-07-01",
                     category_id: "2",
                     use_what: "お菓子",
                     get_money: "300",
                     user: user,
                     management: management
                     )


   Favorite.create!(user_id: User.second.id,
                    treasurer_id: Treasurer.first.id,
                     )
   Favorite.create!(user_id: User.second.id,
                    treasurer_id: Treasurer.second.id,
                     )
   Favorite.create!(user_id: User.second.id,
                    treasurer_id: Treasurer.third.id,
                     )
   Favorite.create!(user_id: User.second.id,
                    treasurer_id: Treasurer.fourth.id,
                     )
   Favorite.create!(user_id: User.second.id,
                    treasurer_id: Treasurer.fifth.id,
                     )
