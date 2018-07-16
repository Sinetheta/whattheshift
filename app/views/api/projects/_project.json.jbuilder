json.merge! project.attributes

json.scenarios project.scenarios, partial: 'api/scenarios/scenario', as: :scenario
