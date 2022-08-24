FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'太朗'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birth_date            {'19900101'}
  end
end