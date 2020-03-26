FactoryBot.define do
    factory :item do
        name {Faker::StarWars.Character}
        done {false}
        todo_id {nil}
    end
end