Delayed::Worker.default_queue_name = "default"
Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.max_attempts = 25
Delayed::Worker.max_run_time = 4.hours
Delayed::Worker.read_ahead = 5
Delayed::Worker.sleep_delay = 60
