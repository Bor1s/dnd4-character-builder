FactoryGirl.define do
  factory :first_level_advancement_rule, parent: :rule do
    name :first_level_advancement_rule
    performs [
      {
        what: [:atwill_powers_known, 1],
        how: :+,
        keep_in: :atwill_powers_known
      },
      {
        what: [:encounter_powers_known, 1],
        how: :+,
        keep_in: :encounter_powers_known
      },
      {
        what: [:daily_powers_known, 1],
        how: :+,
        keep_in: :daily_powers_known
      },
      {
        what: [:feats_known, 1],
        how: :+,
        keep_in: :feats_known
      }
    ]

    as_soon_as [
      level: { is: 1 }
    ]

    root true
  end
end
