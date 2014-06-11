# coding: utf-8

Redmine::Plugin.register :redmine_query_with_version do
  name 'Redmine Query with Version plugin'
  author 'Author name'
  description 'Plugin to search issues by a custom query and any version.'
  version '0.0.1'
  url 'https://github.com/tq-jappy/redmine_query_with_version'
  author_url 'https://github.com/tq-jappy/redmine_query_with_version'

  requires_redmine :version_or_higher => '2.3'

  project_module :query_with_version do
    # permission :select_version, :query_with_version => [:select_version]
  end
end

require 'query_with_version'
