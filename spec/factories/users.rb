FactoryBot.define do

  factory :user do
    id                    {0}
    email                 {"test@test.com"}
    password              {"12345678"}
    password_confirmation {"12345678"}
    name                  {"Test_Name"}
    dc                    {"Test_Dc"}
    server                {"Test_Server"}
    url                   {"Test_url"}
  end

end