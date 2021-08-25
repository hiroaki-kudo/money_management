FactoryBot.define do
  factory :user do
    name { '管理者ユーザ' }
    email { 'kanri@kanri.com' }
    parent_or_child { 0 }
    password { '123qwe' }
    password_confirmation { '123qwe' }
    admin  { 'true' }
  end

  factory :second_user, class: User do
    name { '親' }
    email { 'oya@oya.com' }
    parent_or_child { 0 }
    password { '123qwe' }
    password_confirmation { '123qwe' }
    admin  { 'false' }
  end

  factory :third_user, class: User do
    name { '子供' }
    email { 'kodomo@kodomo.com' }
    parent_or_child { 1 }
    password { '123qwe' }
    password_confirmation { '123qwe' }
    admin  { 'false' }
  end

  factory :fourth_user, class: User do
    name { 'ゲストユーザ(親)' }
    email { 'haha@haha.com' }
    parent_or_child { 0 }
    password { '123qwe' }
    password_confirmation { '123qwe' }
    admin  { 'false' }
  end

  factory :fifth_user, class: User do
    name { 'ゲストユーザ(子)' }
    email { 'guest@guest.com' }
    parent_or_child { 1 }
    password { '123qwe' }
    password_confirmation { '123qwe' }
    admin  { 'false' }
  end
end
