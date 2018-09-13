FactoryGirl.define do
  factory :game do
    rows 3
    cols 3
    mines [6,2]
    cells [{"has_mine":true,"has_flag":false,"exposed":false},{"has_mine":false,"has_flag":false,"exposed":true},{"has_mine":false,"has_flag":false,"exposed":false},{"has_mine":false,"has_flag":false,"exposed":false},{"has_mine":false,"has_flag":false,"exposed":false},{"has_mine":true,"has_flag":false,"exposed":true},{"has_mine":false,"has_flag":false,"exposed":false},{"has_mine":false,"has_flag":false,"exposed":false},{"has_mine":false,"has_flag":false,"exposed":false}]

    trait :init do
      status :init
    end
    
    trait :win do
      status :win
    end

    trait :lose do
      status :lose
    end

    trait :in_progress do
      status :in_progress
    end
  end
end
