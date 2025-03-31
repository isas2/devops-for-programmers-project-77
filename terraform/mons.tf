resource "datadog_monitor" "healthcheck_local" {
  name    = "Webservers localhost http healthcheck"
  type    = "service check"
  query   = "\"http.can_connect\".over(\"instance:redmine_local_check\").by(\"host\").last(4).count_by_status()"
  message = "{{#is_alert}}\nHost {{host.name}} is not available port 80. Level: {{threshold}} \n{{/is_alert}} \n{{#is_alert_recovery}}\nHost {{host.name}} is available\n{{/is_alert_recovery}} @all"

  monitor_thresholds {
    critical = 3
    warning  = 2
    ok       = 1
  }

  priority = 2
  notify_audit      = false
  notify_no_data    = true
  no_data_timeframe = 2
  renotify_interval = 0
  timeout_h         = 0
  include_tags      = true
  new_group_delay   = 60
}

resource "datadog_monitor" "healthcheck_remote" {
  name    = "Webservers publuc https healthcheck"
  type    = "service check"
  query   = "\"http.ssl_cert\".over(\"instance:redmine_remote_check\").by(\"host\").last(4).count_by_status()"
  message = "{{#is_alert}}\nHost {{host.name}} is not available over https. Level: {{threshold}} \n{{/is_alert}} \n{{#is_alert_recovery}}\nHost {{host.name}} is available\n{{/is_alert_recovery}} @all"

  monitor_thresholds {
    critical = 3
    warning  = 2
    ok       = 1
  }

  priority = 2
  notify_audit      = false
  notify_no_data    = true
  no_data_timeframe = 2
  renotify_interval = 0
  timeout_h         = 0
  include_tags      = true
  new_group_delay   = 60
}
