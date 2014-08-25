require 'query_with_version/hooks'

Rails.configuration.to_prepare do
  require 'query_with_version/queries_helper_patch'
  require 'query_with_version/issues_controller_patch'
end

module QueryWithVersion
end
