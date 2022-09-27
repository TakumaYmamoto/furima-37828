FactoryBot.define do
  factory :purchase_records_address do
    token                  { 'tok_abcdefghijk00000000000000000' }
    postal_code            { '012-3456' }
    prefecture_id          { '1' }
    city                   { '千代田区永田町' }
    street_address         { '永田町1-7-1' }
    name_of_the_building	 { '国会議事堂' }
    telephone_number	     { '09012345678' }
  end
end
