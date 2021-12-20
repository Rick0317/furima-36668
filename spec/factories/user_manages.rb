FactoryBot.define do
  factory :user_manage do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'abcd00'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'陸'}
    kana_last_name        {'ヤマダ'}
    kana_first_name       {'リク'}
  end
end