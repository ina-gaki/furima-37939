FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'test11'}
    password_confirmation {password}
    family_name           {'仮'}
    first_name            {'太郎'}
    family_name_kana      {'カリ'}
    first_name_kana       {'タロウ'}
    birthday              {"'2000/01/01'"}
  end
end