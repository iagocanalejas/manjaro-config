:: [ Source ]: https://stackoverflow.com/questions/20490534/batch-file-get-list-value-using-index-key
:: [ Source ]: https://gist.github.com/mlocati/fdabcaeb8071d5c75a2d51712db24011#file-win10colors-cmd
:: [ Source ]: https://community.spiceworks.com/topic/1726309-batch-findstr-not-working-as-expected
:: [ Source ]: https://stackoverflow.com/questions/2541767/what-is-the-proper-way-to-test-if-a-parameter-is-empty-in-a-batch-file


@echo off

setlocal enableextensions enabledelayedexpansion

setlocal 
set "service_name[0]=SysMain"
set "service_name[1]=AJRouter"
set "service_name[2]=ALG"
set "service_name[3]=AppVClient"
set "service_name[4]=autotimesvc"
:set "service_name[5]=BDESVC"
set "service_name[6]=CscService"
set "service_name[7]=diagnosticshub.standardcollector.service"
set "service_name[8]=DiagTrack"
set "service_name[9]=DialogBlockingService"
set "service_name[10]=Fax"
set "service_name[11]=HvHost"
set "service_name[12]=icssvc"
set "service_name[13]=iphlpsvc"
set "service_name[14]=IpxlatCfgSvc"
set "service_name[15]=lfsvc"
set "service_name[16]=MapsBroker"
set "service_name[17]=MixedRealityOpenXRSvc"
set "service_name[18]=MsKeyboardFilter"
set "service_name[19]=NaturalAuthentication"
set "service_name[20]=NcdAutoSetup"
set "service_name[21]=Netlogon"
set "service_name[22]=NetTcpPortSharing"
set "service_name[23]=PeerDistSvc"
set "service_name[24]=PhoneSvc"
set "service_name[25]=RemoteAccess"
set "service_name[26]=RemoteRegistry"
set "service_name[27]=RetailDemo"
set "service_name[28]=RpcLocator"
:set "service_name[29]=SCardSvr"
:set "service_name[30]=ScDeviceEnum"
:set "service_name[31]=SCPolicySvc"
:set "service_name[32]=SEMgrSvc"
set "service_name[33]=SensorDataService"
set "service_name[34]=SensorService"
set "service_name[35]=SensrSvc"
set "service_name[36]=SharedRealitySvc"
set "service_name[37]=shpamsvc"
:set "service_name[38]=SmsRouter"
set "service_name[39]=SNMPTRAP"
set "service_name[40]=ssh-agent"
set "service_name[41]=tzautoupdate"
set "service_name[42]=UevAgentService"
set "service_name[43]=vmicguestinterface"
set "service_name[44]=vmicheartbeat"
set "service_name[45]=vmickvpexchange"
set "service_name[46]=vmicrdv"
set "service_name[47]=vmicshutdown"
set "service_name[48]=vmictimesync"
set "service_name[49]=vmicvmsession"
set "service_name[50]=vmicvss"
set "service_name[51]=WalletService"
set "service_name[52]=WbioSrvc"
set "service_name[53]=wcncsvc"
set "service_name[54]=WebClient"
set "service_name[55]=WerSvc"
set "service_name[56]=WFDSConMgrSvc"
set "service_name[57]=WinRM"
set "service_name[58]=wisvc"
set "service_name[59]=WMPNetworkSvc"
set "service_name[60]=WpcMonSvc"
:set "service_name[61]=TabletInputService"
@REM set "service_name[61]=XblAuthManager"
@REM set "service_name[62]=XblGameSave"
@REM set "service_name[63]=XboxGipSvc"
@REM set "service_name[64]=XboxNetApiSvc"

: Los comentados solo pueden ser deshabilitados, windows no deja borrarlos.

echo -------------------------------------------------
echo REMOVING SERVICES
echo -------------------------------------------------
for /l %%n in (0,1,64) do (
	set "current_service_name=!service_name[%%n]!"
	if "!current_service_name!" NEQ "" (
		call .\disable_stop_remove_service_method.cmd !current_service_name!
	)
)
echo -------------------------------------------------
  
endlocal