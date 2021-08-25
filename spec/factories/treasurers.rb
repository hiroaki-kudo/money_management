FactoryBot.define do
  factory :treasurer do
    use_date_at { '2021-07-01' }
    category_id { 2 }
    use_what { 'うまい棒' }
    use_money { 10 }
    get_money { 0 }
    # association :user ,factory: :third_user
    # association :management

    # trait :with_a_task_and_title_labels do
    #   after(:build) do |task|
    #    task.task_labels << FactoryBot.build(:task_labels, :with_labels)
    #   end
    # end

  end

  factory :second_treasurer, class: Treasurer do
    use_date_at { '2021-07-20' }
    category_id { 4 }
    use_what { '消しゴム' }
    use_money { 100 }
    get_money { 0 }
    # association :user ,factory: :third_user
    # association :management

  end

  factory :third_treasurer, class: Treasurer do
    use_date_at { '2021-07-27' }
    category_id { 3 }
    use_what { 'バス代' }
    use_money { 300 }
    get_money { 0 }
    # association :user ,factory: :third_user
    # association :management
  end
end
