# coding: utf-8

require_dependency 'issues_controller'

module QueryWithVersion
  module IssuesControllerPatch
    def self.included(base)
      base.class_eval do
        include QueriesHelper
      end
    end
  end
end

unless IssuesController.included_modules.include?(QueryWithVersion::IssuesControllerPatch)
  IssuesController.send(:include, QueryWithVersion::IssuesControllerPatch)
end
