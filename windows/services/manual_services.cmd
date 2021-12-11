:: [ Source ]: https://stackoverflow.com/questions/20490534/batch-file-get-list-value-using-index-key
:: [ Source ]: https://gist.github.com/mlocati/fdabcaeb8071d5c75a2d51712db24011#file-win10colors-cmd
:: [ Source ]: https://community.spiceworks.com/topic/1726309-batch-findstr-not-working-as-expected
:: [ Source ]: https://stackoverflow.com/questions/2541767/what-is-the-proper-way-to-test-if-a-parameter-is-empty-in-a-batch-file


@echo off

setlocal enableextensions enabledelayedexpansion

setlocal 
set "service_name[0]=AarSvc_e7cea"
set "service_name[1]=AppMgmt"
set "service_name[2]=AppReadiness"
set "service_name[3]=AxInstSV"
set "service_name[4]=BcastDVRUserService_e7cea"
set "service_name[5]=BEService"
set "service_name[6]=camsvc"
set "service_name[7]=CaptureService_e7cea"
set "service_name[8]=cbdhsvc_e7cea"
set "service_name[9]=COMSysApp"
set "service_name[10]=ConsentUxUserSvc_e7cea"
set "service_name[11]=CredentialEnrollmentManagerUserSvc_e7cea"
set "service_name[12]=defragsvc"
set "service_name[13]=DeviceAssociationBrokerSvc_e7cea"
set "service_name[14]=DevicePickerUserSvc_e7cea"
set "service_name[15]=DevicesFlowUserSvc_e7cea"
set "service_name[16]=DmEnrollmentSvc"
set "service_name[17]=dot3svc"
set "service_name[18]=Eaphost"
set "service_name[19]=edgeupdatem"
set "service_name[20]=EntAppSvc"
set "service_name[21]=EpicOnlineServices"
set "service_name[22]=fdPHost"
set "service_name[23]=FontCache3.0.0.0"
set "service_name[24]=GoogleChromeElevationService"
set "service_name[25]=gupdate"
set "service_name[26]=gupdatem"
set "service_name[27]=InstallService"
set "service_name[28]=lltdsvc"
set "service_name[29]=LxpSvc"
set "service_name[30]=MicrosoftEdgeElevationService"
set "service_name[31]=MozillaMaintenance"
set "service_name[32]=MSDTC"
set "service_name[33]=MSiSCSI"
set "service_name[34]=msiserver"
set "service_name[35]=Netman"
set "service_name[36]=netprofm"
set "service_name[37]=p2pimsvc"
set "service_name[38]=p2psvc"
set "service_name[39]=PcaSvc"
set "service_name[40]=perceptionsimulation"
set "service_name[41]=PerfHost"
set "service_name[42]=PimIndexMaintenanceSvc_e7cea"
set "service_name[43]=pla"
set "service_name[44]=PlugPlay"
set "service_name[45]=PNRPAutoReg"
set "service_name[46]=PNRPsvc"
set "service_name[47]=PrintNotify"
set "service_name[48]=PrintWorkflowUserSvc_e7cea"
set "service_name[49]=QWAVE"
set "service_name[50]=RasAuto"
set "service_name[51]=RmSvc"
set "service_name[52]=Rockstar"
set "service_name[53]=SDRSVC"
set "service_name[54]=seclogon"
set "service_name[55]=SecurityHealthService"
set "service_name[56]=Sense"
set "service_name[57]=SessionEnv"
set "service_name[58]=smphost"
set "service_name[59]=Spooler"
set "service_name[60]=SSDPSRV"
set "service_name[61]=SstpSvc"
set "service_name[62]=StateRepository"
set "service_name[63]=Steam"
set "service_name[64]=swprv"
set "service_name[65]=TapiSrv"
set "service_name[66]=TermService"
set "service_name[67]=TieringEngineService"
set "service_name[68]=TokenBroker"
set "service_name[69]=TroubleshootingSvc"
set "service_name[70]=TrustedInstaller"
set "service_name[71]=UdkUserSvc_e7cea"
set "service_name[72]=UmRdpService"
set "service_name[73]=UnistoreSvc_e7cea"
set "service_name[74]=upnphost"
set "service_name[75]=UserDataSvc_e7cea"
set "service_name[76]=VacSvc"
set "service_name[77]=VaultSvc"
set "service_name[78]=VBoxSDS"
set "service_name[79]=vds"
set "service_name[80]=VSS"
set "service_name[81]=VSStandardCollectorService150"
set "service_name[82]=WaaSMedicSvc"
set "service_name[83]=wbengine"
set "service_name[84]=WdiServiceHost"
set "service_name[85]=WdiSystemHost"
set "service_name[86]=WdNisSvc"
set "service_name[87]=Wecsvc"
set "service_name[88]=wercplsupport"
set "service_name[89]=WiaRpc"
set "service_name[90]=WinHttpAutoProxySvc"
set "service_name[91]=WlanSvc"
set "service_name[92]=WManSvc"
set "service_name[93]=wmiApSrv"
set "service_name[94]=WwanSvc"

: Los comentados solo pueden ser deshabilitados, windows no deja borrarlos.

echo -------------------------------------------------
echo MANUAL SERVICES
echo -------------------------------------------------
for /l %%n in (0,1,94) do (
	set "current_service_name=!service_name[%%n]!"
	if "!current_service_name!" NEQ "" (
		call .\manual_service_method.cmd !current_service_name!
	)
)
echo -------------------------------------------------
  
endlocal