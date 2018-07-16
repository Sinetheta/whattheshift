json.merge! scenario.attributes

json.script scenario.script, partial: 'api/scripts/script', as: :script
