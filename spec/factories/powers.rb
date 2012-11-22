# --- Character powers: at_will, encounter, daily (utilities and attacks)

FactoryGirl.define do
  factory :power do
    # @power_type [:utility, :attack] Type of power
    power_type
  end

  factory :at_will, parent: :power do
  end

  factory :encounter, parent: :power do
  end

  factory :daily, parent: :power do
  end

end
