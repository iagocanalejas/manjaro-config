@echo off
REM *** SCHEDULED TASKS tweaks ***
schtasks /Delete /TN "Microsoft\Windows\AppID\SmartScreenSpecific" /f
REM Microsoft Experience
schtasks /Delete /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /f
schtasks /Delete /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /f
schtasks /Delete /TN "Microsoft\Windows\Application Experience\StartupAppTask" /f
schtasks /Delete /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /f
schtasks /Delete /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /f
schtasks /Delete /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /f
schtasks /Delete /TN "Microsoft\Windows\Customer Experience Improvement Program\Uploader" /f
REM Telemetry
schtasks /Delete /TN "Microsoft\Office\OfficeTelemetryAgentLogOn" /f
schtasks /Delete /TN "Microsoft\Office\OfficeTelemetryAgentFallBack" /f
schtasks /Delete /TN "Microsoft\Office\Office 15 Subscription Heartbeat" /f
schtasks /Delete /TN "Microsoft\Windows\Autochk\Proxy" /f
REM Maintenance
schtasks /Delete /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /f
schtasks /Delete /TN "Microsoft\Windows\Maintenance\WinSAT" /f
schtasks /Delete /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /f
schtasks /Delete /TN "Microsoft\Windows\PI\Sqm-Tasks" /f 
REM APP
schtasks /Delete /TN "Microsoft\Windows\WindowsUpdate\Automatic App Update" /f
schtasks /Delete /TN "Microsoft\Windows\AppxDeploymentClient\Pre-staged app cleanup" /f
REM Bluetooth
schtasks /Delete /TN "Microsoft\Windows\Bluetooth\UninstallDeviceTask" /f
REM DirectX
schtasks /Delete /TN "Microsoft\Windows\DirectX\DirectXDatabaseUpdater" /f
schtasks /Delete /TN "Microsoft\Windows\DirectX\DXGIAdapterCache" /f
REM Diagnostic
schtasks /Delete /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /f
schtasks /Delete /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /f
schtasks /Delete /TN "Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange" /f
schtasks /Delete /TN "Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /f
schtasks /Delete /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /f
schtasks /Delete /TN "Microsoft\Windows\Chkdsk\ProactiveScan" /f
schtasks /Delete /TN "Microsoft\Windows\Chkdsk\SyspartRepair" /f
schtasks /Delete /TN "Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /f
schtasks /Delete /TN "Microsoft\Windows\Diagnosis\Scheduled" /f
schtasks /Delete /TN "Microsoft\Windows\DiskCleanup\SilentCleanup" /f
schtasks /Delete /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataColl" /f
schtasks /Delete /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /f
schtasks /Delete /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /f
schtasks /Delete /TN "Microsoft\Windows\SpacePort\SpaceAgentTask" /f
schtasks /Delete /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /f
REM Subscription
schtasks /Delete /TN "Microsoft\Windows\DUSM\dusmtask" /f
REM Equipos Moviles
schtasks /Delete /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /f
schtasks /Delete /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /f
REM Flighting
schtasks /Delete /TN "Microsoft\Windows\Flighting\FeatureConfig\ReconcileFeatures" /f
schtasks /Delete /TN "Microsoft\Windows\Flighting\FeatureConfig\UsageDataFlushing" /f
schtasks /Delete /TN "Microsoft\Windows\Flighting\FeatureConfig\UsageDataReporting" /f
schtasks /Delete /TN "Microsoft\Windows\Flighting\OneSettings\RefreshCache" /f
REM Language
schtasks /Delete /TN "Microsoft\Windows\International\Synchronize Language Settings" /f
schtasks /Delete /TN "Microsoft\Windows\LanguageComponentsInstaller\Installation" /f
schtasks /Delete /TN "Microsoft\Windows\LanguageComponentsInstaller\ReconcileLanguageResources" /f
REM Locations
schtasks /Delete /TN "Microsoft\Windows\Location\Notifications" /f
schtasks /Delete /TN "Microsoft\Windows\Location\WindowsActionDialog" /f
REM Inalambric Network
schtasks /Delete /TN "Microsoft\Windows\Management\Provisioning\Cellular" /f
schtasks /Delete /TN "Microsoft\Windows\Management\Provisioning\Logon" /f
schtasks /Delete /TN "Microsoft\Windows\Management\Provisioning\Retry" /f
schtasks /Delete /TN "Microsoft\Windows\Management\Provisioning\RunOnReboot" /f
schtasks /Delete /TN "Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /f
schtasks /Delete /TN "Microsoft\Windows\NlaSvc\WiFiTask" /f
schtasks /Delete /TN "Microsoft\Windows\WCM\WiFiTask" /f
schtasks /Delete /TN "Microsoft\Windows\SettingSync\NetworkStateChangeTask" /f
REM Maps
schtasks /Delete /TN "Microsoft\Windows\Maps\MapsToastTask" /f
schtasks /Delete /TN "Microsoft\Windows\Maps\MapsUpdateTask" /f
REM Memory Diagnostic
schtasks /Delete /TN "Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" /f
schtasks /Delete /TN "Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" /f
REM Offline Files
schtasks /Delete /TN "Microsoft\Windows\Offline Files\Background Synchronization" /f
schtasks /Delete /TN "Microsoft\Windows\Offline Files\Logon Synchronization" /f
REM Sync
schtasks /Delete /TN "Microsoft\Windows\Windows Media Sharing\UpdateLibrary" /f
schtasks /Delete /TN "Microsoft\Windows\Wininet\CacheTask" /f
schtasks /Delete /TN "Microsoft\Windows\WlanSvc\CDSSync" /f
schtasks /Delete /TN "Microsoft\Windows\SettingSync\BackgroundUploadTask" /f
schtasks /Delete /TN "Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /f
schtasks /Delete /TN "Microsoft\Windows\Time Synchronization\SynchronizeTime" /f
REM Workplace
schtasks /Delete /TN "Microsoft\Windows\Workplace Join\Automatic-Device-Join" /f
schtasks /Delete /TN "Microsoft\Windows\Workplace Join\Device-Sync  " /f
schtasks /Delete /TN "Microsoft\Windows\Workplace Join\Recovery-Check " /f
REM Family
schtasks /Delete /TN "Microsoft\Windows\Shell\FamilySafetyMonitor" /f
schtasks /Delete /TN "Microsoft\Windows\Shell\FamilySafetyRefresh" /f
schtasks /Delete /TN "Microsoft\Windows\Shell\FamilySafetyUpload" /f
REM Windows Defender
schtasks /Delete /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /f
schtasks /Delete /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /f
schtasks /Delete /TN "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /f
schtasks /Delete /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /f
@REM REM XboxLive
@REM schtasks /Delete /TN "Microsoft\XblGameSave\XblGameSaveTask" /f
REM TMP
schtasks /Delete /TN "Microsoft\Windows\TPM\Tpm-HASCertRetr" /f
schtasks /Delete /TN "Microsoft\Windows\TPM\Tpm-Maintenance" /f
REM App
schtasks /Delete /TN "Microsoft\Windows\Application Experience\PcaPatchDbTask" /f
REM Defrag
schtasks /Delete /TN "Microsoft\Windows\Defrag\ScheduledDefrag" /f
REM SysMain
schtasks /Delete /TN "Microsoft\Windows\SharedPC\Account Cleanup" /f
schtasks /Delete /TN "Microsoft\Windows\Sysmain\HybridDriveCachePrepopulate" /f
schtasks /Delete /TN "Microsoft\Windows\Sysmain\HybridDriveCacheRebalance" /f
schtasks /Delete /TN "Microsoft\Windows\Sysmain\ResPriStaticDbSync" /f
schtasks /Delete /TN "Microsoft\Windows\Sysmain\WsSwapAssessmentTask" /f
REM .NET Framework
schtasks /Delete /TN "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319" /f
schtasks /Delete /TN "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64" /f
schtasks /Delete /TN "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64 Critical" /f
schtasks /Delete /TN "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 Critical" /f



