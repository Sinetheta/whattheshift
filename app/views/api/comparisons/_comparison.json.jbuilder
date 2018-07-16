json.merge! comparison.attributes

json.from_revision comparison.from_revision, partial: 'api/revisions/revision', as: :revision
json.to_revision   comparison.to_revision,   partial: 'api/revisions/revision', as: :revision

json.image_diffs comparison.image_diffs, partial: 'api/image_diffs/image_diff', as: :image_diff

json.project comparison.project, partial: 'api/projects/project', as: :project
