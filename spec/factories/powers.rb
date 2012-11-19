# --- Character powers: at_will, encounter, daily (utilities and attacks)

FactoryGirl.define do
  factory :power do
    # @type [:utility, :attack] Type of power
    type
  end

  factory :at_will, parent: :power do
  end

  factory :encounter, parent: :power do
  end

  factory :daily, parent: :power do
  end

end
