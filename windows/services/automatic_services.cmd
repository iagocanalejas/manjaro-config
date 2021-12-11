:: [ Source ]: https://stackoverflow.com/questions/20490534/batch-file-get-list-value-using-index-key
:: [ Source ]: https://gist.github.com/mlocati/fdabcaeb8071d5c75a2d51712db24011#file-win10colors-cmd
:: [ Source ]: https://community.spiceworks.com/topic/1726309-batch-findstr-not-working-as-expected
:: [ Source ]: https://stackoverflow.com/questions/2541767/what-is-the-proper-way-to-test-if-a-parameter-is-empty-in-a-batch-file


@echo off

setlocal enableextensions enabledelayedexpansion

setlocal 
set "service_name[0]=AudioEndpointBuilder"
set "service_name[1]=Audiosrv"
set "service_name[2]=BFE"
set "service_name[3]=BrokerInfrastructure"
set "service_name[4]=CDPUserSvc_e7cea"
set "service_name[5]=CoreMessagingRegistrar"
set "service_name[6]=CryptSvc"
set "service_name[7]=DcomLaunch"
set "service_name[8]=DeviceAssociationService"
set "service_name[9]=Dhcp"
set "service_name[10]=DPS"
set "service_name[11]=DusmSvc"
set "service_name[12]=EventLog"
set "service_name[13]=EventSystem"
set "service_name[14]=FA_Scheduler"
set "service_name[15]=FontCache"
set "service_name[16]=LanmanWorkstation"
set "service_name[17]=LSM"
set "service_name[18]=mpssvc"
set "service_name[19]=NlaSvc"
set "service_name[20]=nsi"
set "service_name[21]=NVDisplay.ContainerLocalSystem"
set "service_name[22]=Power"
set "service_name[23]=ProfSvc"
set "service_name[24]=RasMan"
set "service_name[25]=RpcEptMapper"
set "service_name[26]=RpcSs"
set "service_name[27]=RtkAudioUniversalService"
set "service_name[28]=SamSs"
set "service_name[29]=Schedule"
set "service_name[30]=SENS"
set "service_name[31]=ShellHWDetection"
set "service_name[32]=sppsvc"
set "service_name[33]=stisvc"
set "service_name[34]=Themes"
set "service_name[35]=TrkWks"
set "service_name[36]=VMAuthdService"
set "service_name[37]=VMnetDHCP"
set "service_name[38]=VMUSBArbService"
set "service_name[39]=VMware"
set "service_name[40]=vpnagent"
set "service_name[41]=WinDefend"
set "service_name[42]=Winmgmt"
set "service_name[43]=WpnService"
set "service_name[44]=WpnUserService_e7cea"

: Los comentados solo pueden ser deshabilitados, windows no deja borrarlos.

echo -------------------------------------------------
echo MANUAL SERVICES
echo -------------------------------------------------
for /l %%n in (0,1,94) do (
	set "current_service_name=!service_name[%%n]!"
	if "!current_service_name!" NEQ "" (
		call .\automatic_service_method.cmd !current_service_name!
	)
)
echo -------------------------------------------------
  
endlocal