#NOTE most feats will not have any rule, because they provides only txt info
#used on character sheet. But for other feats I have to create some custom rules.

FactoryGirl.define do
  factory :alterness_availability_rule, parent: :rule do
    name :alterness_availability_rule
    todo Hash[
      what: "{grant_alterness_feat}"
    ]
  end

  factory :chainmail_armor_proficiency_rule, parent: :rule do
    name :chainmail_armor_proficiency
    todo Hash[
      what: "{grant_chainmail_armor_proficiency_feat}"
      #TODO implement :if
    ]
  end
end
