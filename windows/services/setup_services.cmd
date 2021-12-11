@echo off
call .\automatic_services.cmd
call .\automatic_delayed_services.cmd
call .\manual_services.cmd
call .\disable_stop_remove_services.cmd