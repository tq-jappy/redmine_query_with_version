require 'query_with_version/hooks'

require 'query_with_version/queries_helper_patch'

Rails.configuration.to_prepare do
  require 'query_with_version/queries_helper_patch'
end
