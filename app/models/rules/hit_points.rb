class Rules::HitPoints < Rules::Base
  def result
    Rules::StartHitPoints.new.result + Rules::HitPointsByLevel.new.result
  end
end
