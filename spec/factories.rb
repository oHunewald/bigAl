FactoryGirl.define do

  factory :user do |user|
    sequence(:name){|n| "user#{n}"}
    sequence(:email){|n| "user#{n}@example.com"}
    password "abcd1234"
    password_confirmation "abcd1234"
  end

  factory :project do
  	name 	"my pject"
  	user
  end

  factory :miane do
  	aims	"my aim"
  	expected_result "bla"
  	why_ngs "bla"
  	possible_alternative "no"
  	approach "genome"
  	positive_control "no"
  	negative_control "no"
  	replicates "no"
  	reference_dataset "n/a"
  	possible_pittfalls "don't know"
  	needs_qc "no needs"

  	project
  end

  factory :miane_empty do

  	project
  end

end