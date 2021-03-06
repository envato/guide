class Guide::Simulator
  def initialize(structure, bouncer)
    @structure = structure
    @bouncer = bouncer
  end

  def fetch_scenario(scenario_id)
    scenario(scenario_id).tap do |scenario|
      ensure_user_can_access(scenario)
    end
  end

  private

  def scenario(scenario_id)
    @structure.scenarios[scenario_id].tap do |scenario|
      raise Guide::Errors::InvalidScenario unless scenario.present?
    end
  end

  def ensure_user_can_access(scenario)
    unless @bouncer.user_can_access?(scenario)
      raise Guide::Errors::PermissionDenied
    end
  end
end
