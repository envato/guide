class Guide::Structure < Guide::Node
  def template
    partial
  end

  def partial
  end

  def cell
    nil
  end

  def layout_css_classes
    {}
  end

  def formats
    [:html]
  end

  def stylesheets
    Guide.configuration.default_stylesheets_for_structures
  end

  def javascripts
    Guide.configuration.default_javascripts_for_structures
  end

  def self.scenario(id, **options, &block)
    private define_method(id, block)

    scenario_definitions[id] = OpenStruct.new(
      :name => id.to_s.titleize,
      :options => OpenStruct.new(**options),
    )
  end

  class_attribute :scenario_definitions

  def self.inherited(sub_class)
    sub_class.scenario_definitions = {}
    super(sub_class)
  end

  def scenarios
    @scenarios ||=
    scenario_definitions.each.with_object({}) do |(id, scenario_definition), scenario_hash|
      scenario_hash[id] = OpenStruct.new(
        :name => scenario_definition.name,
        :view_model => send(id),
        :options => scenario_definition.options,
      )
    end
  end

  def layout_templates
    {
      :html => default_layout_template
    }
  end

  def layout_view_model
    Guide::ViewModel.new
  end

  def can_be_rendered?
    true
  end

  private

  def default_layout_template
    Guide.configuration.default_layout_for_scenarios
  end
end
