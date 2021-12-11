@echo off
call .\windows\services\setup_services.cmd
call .\windows\task_scheduler\disable_remove_task_scheduler.cmd
call .\windows\power_management\disable_hibernate.bat
call .\windows\memory\disable_memory_compresion.bat
REG IMPORT .\windows\boot\disable_startup_delay.reg
REG IMPORT .\windows\keyboard\mouse_keyboard.reg
REG IMPORT .\windows\perimetral_security\disable_f1_help_key.reg