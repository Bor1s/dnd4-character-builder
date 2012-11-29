class Rules::HitPointsByLevel < Rules::Base
  def result
    if condition_satisfied?
      # Get hit points by level from character class
    else
      0
    end 
  end

  def condition_satisfied?
    # Character level > 0
  end
end
