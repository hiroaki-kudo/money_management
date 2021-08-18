
user = User.create!(name: "神様",
               email: "kamisama@kamisama.com",
               # parent_or_child: "0",
               password: "123abc",
               admin: "true"
               )

       User.create!(name: "ゲストユーザ",
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
