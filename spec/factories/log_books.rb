FactoryBot.define do
  factory :log_book do
    place { Gimei.city.kanji }
    temperature { '1' }
    water_temperature { '1' }
    transparency { '1' }
    en_time { '1' }
    ex_time { '1' }
    deep_avg { '1' }
    deep_max { '1' }
    weight { '1' }
    wear { '1' }
    free_space { '1' }
    member { '1' }
    association :user
  end
end
