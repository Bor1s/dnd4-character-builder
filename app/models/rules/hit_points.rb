class Rules::HitPoints < Rules::Base
  def process
    Rules::StartHitPoints.new.process + Rules::HitPointsByLevel.new.process
  end
end
