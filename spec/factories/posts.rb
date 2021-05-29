FactoryBot.define do
    factory :post do
        rate { '1.0' }
        title { '良いです' }
        content { '使いやすいです' }
        user
    end
end