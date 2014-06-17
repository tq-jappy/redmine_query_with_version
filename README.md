Redmine Query with Version
==========================

[Redmine](http://www.redmine.org/) plugin to search issues by a custom query and any version.

![screenshot](https://raw.github.com/tq-jappy/redmine_query_with_version/master/screenshots/screenshot.png)

## Installation

```
$ cd {REDMINE_ROOT}/plugins
$ git clone https://github.com/tq-jappy/redmine_query_with_version.git
```

Start Redmine!

## Uninstallation

```
$ rm -f {REDMINE_ROOT}/plugins/redmine_query_with_version
```

## How to Use

1. Go to an project issues page: ``/project/{project_identifier}/issues``
2. Select any one of versions, and click custom query name link in the sidebar.   
NOTE: If you choose blank version (default), this plugin do nothing.

## How to Run Tests

```
$ cd {REDMINE_ROOT}
$ bundle exec rake redmine:plugins:test NAME=redmine_query_with_version
```

## Contributions

All feedback and contributions are welcome. Simply issue a pull request or create a new issue.

## Change Log

### 0.1.0

- Initial version

### 0.1.1

- Hide a version select box when project or custom query is empty.

## License

This plugin is open source and released under the terms of the [GNU General Public License v2](http://www.gnu.org/licenses/gpl-2.0.txt) (GPL).
