unit frmMain;
 // Description:
 // By Sarah Dean
 // Email: sdean12@sdean12.org
 // WWW:   http://www.FreeOTFE.org/
 //
 // -----------------------------------------------------------------------------
 //

interface

uses

  //delphi / libs
  ActnList,
  Buttons, Classes, ComCtrls, Controls, Dialogs,
  ExtCtrls, Forms, Graphics, Grids, ImgList, Menus, Messages, Spin64, StdCtrls,
  SysUtils, ToolWin, Windows, XPMan,
  //sdu & LibreCrypt utils
  SDUSystemTrayIcon, Shredder,
  lcTypes, OTFE_U, MainSettings, CommonSettings,
  DriverControl,
  OTFEFreeOTFE_U, OTFEFreeOTFEBase_U,
  pkcs11_library, lcDialogs, SDUForms, SDUGeneral, SDUMRUList,
  //  SDUMultimediaKeys,
  SDUDialogs,
  // LibreCrypt forms
  frmCommonMain, SDUMultimediaKeys;

type
  TPortableModeAction = (pmaStart, pmaStop, pmaToggle);

  TfrmMain = class (TfrmCommonMain)
    ToolBar1:     TToolBar;
    pnlTopSpacing: TPanel;
    ilDriveIcons: TImageList;
    lvDrives:     TListView;
    pmDrives:     TPopupMenu;
    miPopupDismount: TMenuItem;
    N2:           TMenuItem;
    miPopupProperties: TMenuItem;
    miProperties: TMenuItem;
    N1:           TMenuItem;
    miDismountAllMain: TMenuItem;
    miPopupDismountAll: TMenuItem;
    miFreeOTFEDrivers: TMenuItem;
    miOverwriteFreeSpace: TMenuItem;
    miFormat:     TMenuItem;
    N6:           TMenuItem;
    miPopupFormat: TMenuItem;
    miPopupOverwriteFreeSpace: TMenuItem;

    N7:           TMenuItem;
    miPortableModeDrivers: TMenuItem;
    N8:           TMenuItem;
    actDismountAll: TAction;
    actProperties: TAction;
    pmSystemTray: TPopupMenu;
    open1:        TMenuItem;
    open2:        TMenuItem;
    mountfile1:   TMenuItem;
    mountpartition1: TMenuItem;
    dismountall1: TMenuItem;
    N10:          TMenuItem;
    miOptions:    TMenuItem;
    actConsoleDisplay: TAction;
    N11:          TMenuItem;
    N12:          TMenuItem;
    SDUSystemTrayIcon1: TSDUSystemTrayIcon;
    tbbNew:       TToolButton;
    tbbMountFile: TToolButton;
    tbbMountPartition: TToolButton;
    tbbDismount:  TToolButton;
    tbbDismountAll: TToolButton;
    actTogglePortableMode: TAction;
    actFormat:    TAction;
    actOverwriteFreeSpace: TAction;
    tbbTogglePortableMode: TToolButton;
    actDrivers:   TAction;
    ilDriveIconOverlay: TImageList;
    actOverwriteEntireDrive: TAction;
    Overwriteentiredrive1: TMenuItem;
    Overwriteentiredrive2: TMenuItem;
    N17:          TMenuItem;
    mmRecentlyMounted: TMenuItem;
    actFreeOTFEMountPartition: TAction;
    actLinuxMountPartition: TAction;
    miFreeOTFEMountPartition: TMenuItem;
    miLinuxMountPartition: TMenuItem;
    actConsoleHide: TAction;
    actInstall:   TAction;
    InstallDoxBox1: TMenuItem;
    actTestModeOn: TAction;
    SetTestMode1: TMenuItem;
    actTestModeOff: TAction;
    DisallowTestsigneddrivers1: TMenuItem;
    tbbSettings:  TToolButton;
    pmOpen:       TPopupMenu;
    miMountfile:  TMenuItem;
    miOpenpartition: TMenuItem;
    miOpenLUKSBox: TMenuItem;
    miOpenBoxforcedmcrypt: TMenuItem;
    pmNew:        TPopupMenu;
    miNew:        TMenuItem;
    Newdmcryptcontainer1: TMenuItem;
    actLUKSNew:   TAction;
    NewLUKS1:     TMenuItem;
    estLuks1:     TMenuItem;
    NewLUKS2:     TMenuItem;
    Newhiddendmcryptfilecontainer1: TMenuItem;
    NewHidden1:   TMenuItem;
    OpenLUKScontainer2: TMenuItem;
    Openhiddendmcryptfile1: TMenuItem;
    OpenLUKScontainer1: TMenuItem;
    Newhiddendmcryptfilecontainer2: TMenuItem;

    procedure actDriversExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure lvDrivesResize(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure lvDrivesClick(Sender: TObject);
    procedure lvDrivesDblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actDismountExecute(Sender: TObject);
    procedure actDismountAllExecute(Sender: TObject);
    procedure actPropertiesExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actConsoleDisplayExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actTogglePortableModeExecute(Sender: TObject);
    procedure lvDrivesSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure actFormatExecute(Sender: TObject);
    procedure actOverwriteFreeSpaceExecute(Sender: TObject);
    procedure tbbTogglePortableModeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure actOverwriteEntireDriveExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actFreeOTFEMountPartitionExecute(Sender: TObject);
    procedure actLinuxMountPartitionExecute(Sender: TObject);
    procedure actOptionsExecute(Sender: TObject);
    procedure SDUSystemTrayIcon1DblClick(Sender: TObject);
    procedure SDUSystemTrayIcon1Click(Sender: TObject);
    procedure actConsoleHideExecute(Sender: TObject);
    procedure actInstallExecute(Sender: TObject);
    procedure actTestModeOnExecute(Sender: TObject);
    procedure actTestModeOffExecute(Sender: TObject);
    procedure miToolsClick(Sender: TObject);

    procedure actLUKSNewExecute(Sender: TObject);
    procedure actFreeOTFENewNotHiddenExecute(Sender: TObject);
    procedure actFreeOTFENewHiddenExecute(Sender: TObject);
  private
    function IsTestModeOn: Boolean;
    function DoAdHocTests: Boolean;
    function DoLuksTestsOnVol(vol_file: string): Boolean;
    function DoSDCardTests: Boolean;


  protected
    //    fTempCypherDriver:     Ansistring;
    //    ftempCypherGUID:       TGUID;


    //    ftempCypherEncBlockNo: Int64;

    fIconMounted:   TIcon;
    fIconUnmounted: TIcon;

    // We cache this information as it takes a *relatively* long time to get it
    // from the OTFE component.
    fcountPortableDrivers: Integer;

    fallowUACEscalation: Boolean;
    //    fCanSaveSettings : Boolean;

    function HandleCommandLineOpts_Portable(): eCmdLine_Exit;
    function HandleCommandLineOpts_DriverControl(): eCmdLine_Exit;
    function HandleCommandLineOpts_DriverControl_GUI(): eCmdLine_Exit;
    function HandleCommandLineOpts_DriverControl_Install(driverControlObj:
      TDriverControl): eCmdLine_Exit;
    function HandleCommandLineOpts_DriverControl_Uninstall(driverControlObj:
      TDriverControl): eCmdLine_Exit;
    function HandleCommandLineOpts_DriverControl_Count(driverControlObj:
      TDriverControl): Integer;
    function HandleCommandLineOpts_Count(): eCmdLine_Exit;
    function HandleCommandLineOpts_Create(): eCmdLine_Exit; override;
    function HandleCommandLineOpts_Dismount(): eCmdLine_Exit;
    function HandleCommandLineOpts_SetTestMode(): eCmdLine_Exit;
    //    function HandleCommandLineOpts_SetInstalled(): eCmdLine_Exit;

    //true = set OK
    function SetTestMode(silent, SetOn: Boolean): Boolean;
    //sets 'installed' flag in ini file - returns false if fails (ini file must exist or be set as custom)
    //    function SetInstalled(): Boolean;
    function InstallAllDrivers(driverControlObj: TDriverControl;
      silent: Boolean): eCmdLine_Exit;

    procedure ReloadSettings(); override;

    function ActivateFreeOTFEComponent(suppressMsgs: Boolean): Boolean; override;
    procedure DeactivateFreeOTFEComponent(); override;
    procedure ShowOldDriverWarnings(); override;

    procedure PKCS11TokenRemoved(SlotID: Integer); override;

    procedure RefreshMRUList(); override;
    procedure MRUListItemClicked(mruList: TSDUMRUList; idx: Integer); override;

    procedure InitializeDrivesDisplay();
    procedure RefreshDrives();
    function DetermineDriveOverlay(volumeInfo: TOTFEFreeOTFEVolumeInfo): Integer;
    function AddIconForDrive(driveLetter: DriveLetterChar; overlayIdx: Integer): Integer;

    procedure SetStatusBarTextNormal();
    procedure EnableDisableControls(); override;
    function GetDriveLetterFromLVItem(listItem: TListItem): DriveLetterChar;

    procedure ResizeWindow();

    function GetSelectedDrives(): DriveLetterString;
    procedure OverwriteDrives(drives: DriveLetterString; overwriteEntireDrive: Boolean);

    procedure _MountFile(mountAsSystem: TVolumeType; filename: String;
      ReadOnly, isHidden, createVol: Boolean{only applicable for dmcrypt}); overload; override;

    procedure DriveProperties();

    function DismountSelected(): Boolean;
    function DismountAll(isEmergency: Boolean = False): Boolean;
    function DismountDrives(dismountDrives: DriveLetterString; isEmergency: Boolean): Boolean;
    procedure ReportDrivesNotDismounted(drivesRemaining: DriveLetterString; isEmergency: Boolean);

    procedure GetAllDriversUnderCWD(driverFilenames: TStringList);
    procedure _PromptCreateFreeOTFEVolume(isHidden: Boolean);

    function _PortableModeSet(setTo: TPortableModeAction; suppressMsgs: Boolean): Boolean;
    function _PortableModeStart(suppressMsgs: Boolean): Boolean;
    function _PortableModeStop(suppressMsgs: Boolean): Boolean;
    function _PortableModeToggle(suppressMsgs: Boolean): Boolean;

    // System tray icon related...
    procedure SystemTrayIconDismount(Sender: TObject);
    procedure DestroySysTrayIconMenuitems();

    // Hotkey related...
    procedure SetupHotKeys();
    procedure EnableHotkey(hotKey: TShortCut; hotKeyIdent: Integer);
    procedure DisableHotkey(hotKeyIdent: Integer);

    //    procedure RecaptionToolbarAndMenuIcons(); override;
    //    procedure SetIconListsAndIndexes(); override;
    //    procedure SetupToolbarFromSettings(); override;

    procedure DoSystemTrayAction(Sender: TObject; doAction: TSystemTrayClickAction);

    procedure UACEscalateForDriverInstallation();
    procedure UACEscalateForPortableMode(portableAction: TPortableModeAction;
      suppressMsgs: Boolean);
    procedure UACEscalate(cmdLineParams: String; suppressMsgs: Boolean);
    function DoFullTests: Boolean; override;
    function DoLuksTests: Boolean; override;


  public

    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
    procedure WMDeviceChange(var Msg: TMessage); message WM_DEVICECHANGE;
    procedure WMQueryEndSession(var msg: TWMQueryEndSession); message WM_QUERYENDSESSION;
    procedure WMEndSession(var msg: TWMEndSession); message WM_ENDSESSION;

    //    procedure GenerateOverwriteData(Sender: TObject; passNumber: Integer;
    //          bytesRequired: Cardinal; var generatedOK: Boolean; var outputBlock: TShredBlock);

    procedure InitApp(); override;

    function MessageHook(var msg: TMessage): Boolean;

    procedure DisplayDriverControlDlg();

    // Handle any command line options; returns exit code
    function HandleCommandLineOpts(): eCmdLine_Exit; override;

  end;

var
  GfrmMain: TfrmMain;
  GLOBAL_VAR_WM_FREEOTFE_RESTORE: Cardinal;
  GLOBAL_VAR_WM_FREEOTFE_REFRESH: Cardinal;

implementation

{$R *.DFM}

{ TODO -otdk -crefactor : editing dcr files is awkward - use imagelist instead }
{$R FreeOTFESystemTrayIcons.dcr}

uses
  //delphi & libs

  ShellApi,  // Required for SHGetFileInfo
  Commctrl,  // Required for ImageList_GetIcon
  ComObj,    // Required for StringToGUID
  Math,      // Required for min
  strutils,
  //sdu & LibreCrypt utils
  pkcs11_slot,
  SDUFileIterator_U,
  SDUi18n,
  sdusysutils,//for format drive
  SDUGraphics,
  PKCS11Lib,
  LUKSTools, MouseRNGDialog_U, lcConsts, OTFEConsts_U,
  DriverAPI, lcCommandLine,
  // LibreCrypt forms
  frmAbout,
  frmHdrBackupRestore,
  frmOptions,
  frmSelectOverwriteMethod,
  frmVolProperties,
  frmWizardCreateVolume, frmCreateLUKSVolumeWizard,
  frmKeyEntryFreeOTFE //for MountFreeOTFE
  , frmKeyEntryLinux, frmSelectVolumeType, frmWizardChangePasswordCreateKeyfile,
  frmSelectPartition, frmDriverControl;

{$IFDEF _NEVER_DEFINED}
// This is just a dummy const to fool dxGetText when extracting message
// information
// This const is never used; it's #ifdef'd out - SDUCRLF in the code refers to
// picks up SDUGeneral.SDUCRLF
const
  SDUCRLF = ''#13#10;
{$ENDIF}

resourcestring
  AUTORUN_POST_MOUNT    = 'post mount';
  AUTORUN_PRE_MOUNT     = 'pre dismount';
  AUTORUN_POST_DISMOUNT = 'post dismount';

const
  AUTORUN_TITLE: array [TAutorunType] of String = (
    AUTORUN_POST_MOUNT,
    AUTORUN_PRE_MOUNT,
    AUTORUN_POST_DISMOUNT
    );

resourcestring

  // Toolbar captions...
  //  RS_TOOLBAR_CAPTION_MOUNTPARTITION = 'Open partition container';
  //  RS_TOOLBAR_CAPTION_DISMOUNTALL    = 'Lock all';
  //  RS_TOOLBAR_CAPTION_PORTABLEMODE   = 'Portable mode';
  // Toolbar hints...
  //  RS_TOOLBAR_HINT_MOUNTPARTITION    = 'Open a partition based container';
  //  RS_TOOLBAR_HINT_DISMOUNTALL       = 'Lock all open containers';
  //  RS_TOOLBAR_HINT_PORTABLEMODE      = 'Toggle portable mode on/off';

  POPUP_DISMOUNT = 'Dismount %s: %s';

const

  R_ICON_MOUNTED   = 'MOUNTED';
  R_ICON_UNMOUNTED = 'UNMOUNTED';

  TAG_SYSTRAYICON_POPUPMENUITEMS           = $5000; // Note: LSB will be the drive letter
  TAG_SYSTRAYICON_POPUPMENUITEMS_DRIVEMASK = $FF;   // LSB mask for drive letter

  HOTKEY_TEXT_NONE           = '(None)';
  HOTKEY_IDENT_DISMOUNT      = 1;
  HOTKEY_IDENT_DISMOUNTEMERG = 2;

  // Overlay icons; these MUST be kept in sync with the icons in
  // ilDriveIconOverlay
  OVERLAY_IMGIDX_NONE        = -1;
  OVERLAY_IMGIDX_PKCS11TOKEN = 0;
  OVERLAY_IMGIDX_LINUX       = 1;

  AUTORUN_SUBSTITUTE_DRIVE = '%DRIVE';


  // Online user manual URL...
  { DONE -otdk -cenhancement : set project homepage }
  URL_USERGUIDE_MAIN = 'http://LibreCrypt.eu/LibreCrypt/getting_started.html';
  // PAD file URL...
  URL_PADFILE_MAIN   = 'https://raw.githubusercontent.com/t-d-k/LibreCrypt/master/PAD.xml';
// Download URL...


 // This procedure is called after OnCreate, and immediately before the
 // Application.Run() is called
procedure TfrmMain.InitApp();
var
  goForStartPortable, errLastRun: Boolean;
begin
  inherited;
  //  {$IFDEF DEBUG}
  //    actLUKSNew.Enabled := true;
  //    actLUKSNew.visible := true;
  //  {$ENDIF}

  // if appRunning set when app started, that means it didnt shut down properly last time

  errLastRun               := GetSettings.feAppRunning = arRunning;
  GetSettings.feAppRunning := arRunning;
  // save immediately in case any errors starting drivers etc.
  //  fCanSaveSettings :=
  GetSettings.Save(False); // don't show warnings as user hasn't changed settings


  // Hook Windows messages first; if we're running under Vista and the user UAC
  // escalates to start portable mode (below), we don't want to miss any
  // refresh messages the escalated process may send us!
  Application.HookMainWindow(MessageHook);

  InitializeDrivesDisplay();

  // We call EnableDisableControls(...) at this point, to display the
  // toolbar/statusbar as needed
  EnableDisableControls();


  // EnableDisableControls(...) calls SetupToolbarFromSettings(...) which can
  // change the window's width if large icons are being used
  // We recenter the window here so it looks right
  //
  // !!! WARNING !!!
  // DON'T USE self.Position HERE!
  // This causes the Window to be destroyed and recreated - which messes up
  // the system tray icon code as it's monitoring the window's messages
  //  self.Position := poScreenCenter;
  // Instead, position window manually...
  //  self.Top  := ((Screen.Height - self.Height) div 2);
  //  self.Left := ((Screen.Width - self.Width) div 2);

  if not (ActivateFreeOTFEComponent(True)) then begin
    goForStartPortable := GetMainSettings().OptAutoStartPortable;
    if not (goForStartPortable) then begin
      // if 'installed' then install drivers and prompt reboot else prompt portable as below
      //      if not GetSettings().OptInstalled then
      goForStartPortable := SDUConfirmYN(
        _('The main LibreCrypt driver does not appear to be installed and running on this computer') +
        SDUCRLF + SDUCRLF + _('Would you like to start LibreCrypt in portable mode?'));
    end;

    if goForStartPortable then begin
      if errLastRun then
        MessageDlg(_(
          'Portable mode will not be started automatically because LibreCrypt shut down last time it was run.'),
          mtWarning, [mbOK], 0)
      else
        _PortableModeSet(pmaStart, False);
    end else begin

      if not errLastRun then begin
        actInstallExecute(nil);
      end else begin

        if errLastRun {and GetSettings().OptInstalled} then
          MessageDlg(_(
            'The drivers will not be installed automatically because LibreCrypt shut down last time it was run.'),
            mtWarning, [mbOK], 0);
        SDUMessageDlg(_(
          'Please see the "installation" section of the accompanying documentation for instructions on how to install the LibreCrypt drivers.'),
          mtInformation, [mbOK], 0);
      end;
    end;

  end;

  RefreshDrives();
  EnableDisableControls();
  SetupHotKeys();
  SetupPKCS11(False);
  //      actLUKSNewExecute(nil);
  //  aLuksTestExecute(nil);
  //actTestExecute(nil);
  //  DoLuksTests;
  //  if SDUCommandLineSwitch(CMDLINE_ENABLE_DEV_MENU) then
  //    DoLuksTests;
  //     DoFullTests;
  //    DoAdHocTests
  //  ;
  // Format_Drive('G', self);
//  DoSDCardTests;
end;


procedure TfrmMain.RefreshDrives();
var
  ListItem:     TListItem;
  driveIconNum: Integer;
  i:            Integer;
  volumeInfo:   TOTFEFreeOTFEVolumeInfo;
  mounted:      DriveLetterString;
  miTmp:        TMenuItem;
  strVolID:     String;
  overlayIdx:   Integer;
begin
  // Flush any caches in case a separate instance of FreeOTFE running from the
  // commandline, with escalated UAC changed the drivers installed/running
  GetFreeOtfeBase.CachesFlush();

  // Cleardown all...

  // ...Main FreeOTFE window list...
  lvDrives.Items.Clear();
  ilDriveIcons.Clear();

  // ...System tray icon drives list...
  DestroySysTrayIconMenuitems();

  // In case the drivers have been stopped/started recently, we bounce the
  // FreeOTFE component up and down (silently!)
  DeactivateFreeOTFEComponent();
  ActivateFreeOTFEComponent(True);

  /// ...and repopulate
  if GetFreeOTFE().Active then begin
    mounted := GetFreeOTFE().DrivesMounted();

    for i := 1 to length(mounted) do begin
      // ...Main FreeOTFE window list...
      if GetFreeOTFE().GetVolumeInfo(mounted[i], volumeInfo) then begin
        ListItem         := lvDrives.Items.Add;
        ListItem.Caption := '     ' + mounted[i] + ':';
        ListItem.SubItems.Add(volumeInfo.Filename);
        overlayIdx   := DetermineDriveOverlay(volumeInfo);
        driveIconNum := AddIconForDrive(mounted[i], overlayIdx);
        if (driveIconNum >= 0) then begin
          ListItem.ImageIndex := driveIconNum;
        end;
      end else begin
        // Strange... The drive probably got dismounted between getting the
        // list of mounted drives, and querying them for more information...
      end;


      // The volume ID/label
      // Cast to prevent compiler error
      strVolID := SDUVolumeID(DriveLetterChar(mounted[i]));
      if strVolID <> '' then begin
        strVolID := '[' + strVolID + ']';
      end;

      // ...System tray icon popup menu...
      miTmp             := TMenuItem.Create(nil);
      miTmp.Tag         := TAG_SYSTRAYICON_POPUPMENUITEMS or Ord(mounted[i]);
      // We tag our menuitems
      // in order that we can
      // know which ones to
      // remove later
      miTmp.OnClick     := SystemTrayIconDismount;
      miTmp.AutoHotkeys := maManual;  // Otherwise the hotkeys added
      // automatically can interfere with
      // examing the caption to get the drive
      // letter when clicked on
      miTmp.Caption     := Format(POPUP_DISMOUNT, [mounted[i], strVolID]);
      pmSystemTray.Items.Insert((i - 1), miTmp);
    end;

    // Insert a divider into the system tray icon's popup menu after the
    // drives are listed
    if (length(mounted) > 0) then begin
      miTmp         := TMenuItem.Create(nil);
      miTmp.Caption := '-';
      pmSystemTray.Items.Insert(length(mounted), miTmp);
    end;

  end;


  fcountPortableDrivers := GetFreeOTFE().DriversInPortableMode();
  EnableDisableControls();

end;


// Tear down system tray icon popup menu menuitems previously added
procedure TfrmMain.DestroySysTrayIconMenuitems();
var
  i:     Integer;
  miTmp: TMenuItem;
begin
  for i := (pmSystemTray.Items.Count - 1) downto 0 do begin
    if ((pmSystemTray.Items[i].Tag and TAG_SYSTRAYICON_POPUPMENUITEMS) =
      TAG_SYSTRAYICON_POPUPMENUITEMS) then begin
      miTmp := pmSystemTray.Items[i];
      pmSystemTray.Items.Delete(i);
      miTmp.Free();
    end;
  end;
end;


procedure TfrmMain.SystemTrayIconDismount(Sender: TObject);
var
  miDismount: TMenuItem;
  drive:      DriveLetterChar;
begin
  miDismount := TMenuItem(Sender);

  drive := DriveLetterChar(miDismount.Tag and TAG_SYSTRAYICON_POPUPMENUITEMS_DRIVEMASK);

  DismountDrives(drive, False);
end;


function TfrmMain.DetermineDriveOverlay(volumeInfo: TOTFEFreeOTFEVolumeInfo): Integer;
begin
  Result := OVERLAY_IMGIDX_NONE;

  if volumeInfo.MetaDataStructValid then begin
    if (volumeInfo.MetaDataStruct.PKCS11SlotID <> PKCS11_NO_SLOT_ID) then begin
      Result := OVERLAY_IMGIDX_PKCS11TOKEN;
    end else
    if volumeInfo.MetaDataStruct.LinuxVolume then begin
      Result := OVERLAY_IMGIDX_LINUX;
    end;
  end;

end;

 { TODO : use diff icons for eg freeotfe/luks/dmcrypt , instead of overlays }
 // Add an icon to represent the specified drive
 // overlayIdx - Set to an image index within ilDriveIconOverlay, or -1 for no
 //              overlay
 // Returns: The icon's index in ilDriveIcons, or -1 on error
function TfrmMain.AddIconForDrive(driveLetter: DriveLetterChar;
  overlayIdx: Integer): Integer;
var
  iconIdx:       Integer;
  anIcon:        TIcon;
  shfi:          SHFileInfo;
  imgListHandle: THandle;
  iconHandle:    HICON;
  tmpDrivePath:  String;
  overlayIcon:   TIcon;
  listBkColor:   TColor;
begin
  iconIdx := -1;

  // Create a suitable icon to represent the drive
  tmpDrivePath  := driveLetter + ':\';
  imgListHandle := SHGetFileInfo(PChar(tmpDrivePath), 0, shfi, sizeof(shfi),
    SHGFI_SYSICONINDEX or SHGFI_LARGEICON);
  //                                 SHGFI_DISPLAYNAME

  if imgListHandle <> 0 then begin
    iconHandle := ImageList_GetIcon(imgListHandle, shfi.iIcon, ILD_NORMAL);
    if (iconHandle <> 0) then begin
      anIcon := TIcon.Create();
      try
        anIcon.ReleaseHandle();

        anIcon.handle := iconHandle;

        if (ilDriveIcons.Width < anIcon.Width) then begin
          ilDriveIcons.Width := anIcon.Width;
        end;
        if (ilDriveIcons.Height < anIcon.Height) then begin
          ilDriveIcons.Height := anIcon.Height;
        end;

        if (overlayIdx >= 0) then begin
          overlayIcon := TIcon.Create();
          try
            ilDriveIconOverlay.GetIcon(overlayIdx, overlayIcon);
            SDUOverlayIcon(anIcon, overlayIcon);
          finally
            overlayIcon.Free();
          end;
        end;

        // We switch the background colour so that (Under Windows XP, unthemed,
        // at least) the icons don't appear to have a black border around them
        listBkColor          := ilDriveIcons.BkColor;
        ilDriveIcons.BkColor := lvDrives.Color;
        iconIdx              := ilDriveIcons.addicon(anIcon);
        ilDriveIcons.BkColor := listBkColor;


        anIcon.ReleaseHandle();
        DestroyIcon(iconHandle);
      finally
        anIcon.Free();
      end;

    end;
  end;


  Result := iconIdx;

end;

procedure TfrmMain.InitializeDrivesDisplay();
var
  tmpColumn: TListColumn;
begin
  // Listview setup...
  lvDrives.SmallImages             := ilDriveIcons;
  lvDrives.RowSelect               := True;
  lvDrives.MultiSelect             := True;
  lvDrives.showcolumnheaders       := True;
  lvDrives.ReadOnly                := True;
  lvDrives.ViewStyle               := vsReport;
  //    lvDrives.ViewStyle := vsIcon;
  //    lvDrives.ViewStyle := vsList;
  lvDrives.IconOptions.Arrangement := TIconArrangement.iaTop;


  // Listview columns...
  tmpColumn         := lvDrives.Columns.Add;
  tmpColumn.Caption := _('Drive');
  tmpColumn.Width   := 100;

  //    tmpColumn.minwidth := lvDrives.width;
  tmpColumn         := lvDrives.Columns.Add;
  tmpColumn.Caption := _('Container');
  tmpColumn.Width   := lvDrives.clientwidth - lvDrives.columns[0].Width - ilDriveIcons.Width;


  // xxx - shouldn't this work?     NewColumn.autosize := TRUE;
  // xxx - shouldn't this work?     NewColumn.minwidth := lvDrives.clientwidth - lvDrives.columns[0].width - ilDriveIcons.width;


  // xxx - use destroyimage or whatever it was to cleardown the **imagelist**

end;



procedure TfrmMain.SDUSystemTrayIcon1Click(Sender: TObject);
begin
  inherited;
  DoSystemTrayAction(Sender, GetMainSettings().OptSystemTrayIconActionSingleClick);
end;

procedure TfrmMain.SDUSystemTrayIcon1DblClick(Sender: TObject);
begin
  inherited;
  DoSystemTrayAction(Sender, GetMainSettings().OptSystemTrayIconActionDoubleClick);
end;

procedure TfrmMain.DoSystemTrayAction(Sender: TObject; doAction: TSystemTrayClickAction);
begin
  case doAction of

    stcaDoNothing:
    begin
      // Do nothing...
    end;

    stcaDisplayConsole:
    begin
      actConsoleDisplay.Execute();
    end;

    stcaDisplayHideConsoleToggle:
    begin
      if self.Visible then begin
        actConsoleHide.Execute();
      end else begin
        actConsoleDisplay.Execute();
      end;
    end;

    stcaMountFile:
    begin
      actFreeOTFEMountFileNotHidden.Execute();
    end;

    stcaMountPartition:
    begin
      actFreeOTFEMountPartition.Execute();
    end;

    stcaMountLinuxFile:
    begin
      actMountDmcryptHidden.Execute();
    end;

    stcaMountLinuxPartition:
    begin
      actLinuxMountPartition.Execute();
    end;

    stcaDismountAll:
    begin
      actDismountAll.Execute();
    end;

  end;

end;


const
  IOCTL_DISK_GET_DRIVE_LAYOUT_EX = $00070050;

type
  TDriveLayoutInformationMbr = record
    Signature: DWORD;
  end;

  TDriveLayoutInformationGpt = record
    DiskId:               TGuid;
    StartingUsableOffset: Int64;
    UsableLength:         Int64;
    MaxPartitionCount:    DWORD;
  end;

  TPartitionInformationMbr = record
    PartitionType:       Byte;
    BootIndicator:       Boolean;
    RecognizedPartition: Boolean;
    HiddenSectors:       DWORD;
  end;

  TPartitionInformationGpt = record
    PartitionType: TGuid;
    PartitionId:   TGuid;
    Attributes:    Int64;
    Name:          array [0..35] of Widechar;
  end;

  TPartitionInformationEx = record
    PartitionStyle:   Integer;
    StartingOffset:   Int64;
    PartitionLength:  Int64;
    PartitionNumber:  DWORD;
    RewritePartition: Boolean;
    case Integer of
      0: (Mbr: TPartitionInformationMbr);
      1: (Gpt: TPartitionInformationGpt);
  end;

  TDriveLayoutInformationEx = record
    PartitionStyle: DWORD;
    PartitionCount: DWORD;
    DriveLayoutInformation: record
           case Integer of
        0: (Mbr: TDriveLayoutInformationMbr);
        1: (Gpt: TDriveLayoutInformationGpt);
    end;
    PartitionEntry: array [0..15] of TPartitionInformationGpt;
    //hard-coded maximum of 16 partitions
  end;

const
  PARTITION_STYLE_MBR = 0;
  PARTITION_STYLE_GPT = 1;
  PARTITION_STYLE_RAW = 2;
 //
 //const
 //  IOCTL_DISK_GET_DRIVE_LAYOUT_EX = $00070050;

//from http://stackoverflow.com/questions/17110543/how-to-retrieve-the-disk-signature-of-all-the-disks-in-windows-using-delphi-7
procedure get_layout;
const
  // Max number of drives assuming primary/secondary, master/slave topology
  MAX_IDE_DRIVES = 16;
var
  i:               Integer;
  Drive:           String;
  hDevice:         THandle;
  DriveLayoutInfo: TDriveLayoutInformationEx;
  BytesReturned:   DWORD;
  msg:             String;

begin
  for i := 0 to MAX_IDE_DRIVES - 1 do begin
    Drive   := '\\.\PHYSICALDRIVE' + IntToStr(i);
    hDevice := CreateFile(PChar(Drive), 0, FILE_SHARE_READ or FILE_SHARE_WRITE,
      nil, OPEN_EXISTING, 0, 0);
    if hDevice <> INVALID_HANDLE_VALUE then begin
      if DeviceIoControl(hDevice, IOCTL_DISK_GET_DRIVE_LAYOUT_EX, nil, 0,
        @DriveLayoutInfo, SizeOf(DriveLayoutInfo), BytesReturned, nil) then begin
        case DriveLayoutInfo.PartitionStyle of
          PARTITION_STYLE_MBR:
            msg := msg + Drive + ', MBR, ' + IntToHex(
              DriveLayoutInfo.DriveLayoutInformation.Mbr.Signature, 8);
          PARTITION_STYLE_GPT:
            msg := msg + (Drive + ', GPT, ' + GUIDToString(
              DriveLayoutInfo.DriveLayoutInformation.Gpt.DiskId));
          PARTITION_STYLE_RAW:
            msg := msg + (Drive + ', RAW');
        end;
      end;
      CloseHandle(hDevice);
    end;
  end;
end;

// ----------------------------------------------------------------------------
function get_from_device(driveDevice: String; dataLength: DWORD; var Data: Ansistring): Boolean;
var
  fileHandle:    THandle;
  //  DIOCBufferOut: TSDUDriveLayoutInformation;
  bytesReturned: DWORD;
  buffer:        PChar;
  msg:           String;
begin
  Result := False;

 (* fileHandle := CreateFile(PChar(driveDevice),
                   // pointer to name of the file
   GENERIC_READ  ,//  0,             // access (read-write) mode
    FILE_SHARE_WRITE ,
        // share mode
    nil,                      // pointer to security attributes
    OPEN_EXISTING,            // how to create
    FILE_ATTRIBUTE_NORMAL,  // file attributes
    0                         // handle to file with attributes to copy
    );  *)

  fileHandle := CreateFile(PChar(driveDevice), GENERIC_READ,
    (FILE_SHARE_READ or FILE_SHARE_WRITE), nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);

  bytesReturned := 0;
  buffer        := AllocMem(dataLength);
  if (fileHandle <> INVALID_HANDLE_VALUE) then begin

    if ReadFile(fileHandle, buffer[0], dataLength, bytesReturned, nil) then begin
      //  if DeviceIoControl(fileHandle, , nil, 0,
      //      @DriveLayoutInfo, SizeOf(DriveLayoutInfo), BytesReturned, nil) then begin
      //      driveLayout := DriveLayoutInfo;
  {
        case DriveLayoutInfo.PartitionStyle of
        PARTITION_STYLE_MBR:
          str :=  driveDevice + ', MBR, ' +
            IntToHex(DriveLayoutInfo.DriveLayoutInformation.Mbr.Signature, 8);
        PARTITION_STYLE_GPT:
         str := driveDevice + ', GPT, ' +
            GUIDToString(DriveLayoutInfo.DriveLayoutInformation.Gpt.DiskId);
        PARTITION_STYLE_RAW:
          str := driveDevice + ', RAW';
        end;
         ShowMessage(str);
         }
      msg    := 'success: ';
      Result := True;
    end else begin
      msg := SysErrorMessage(GetLastError) + '1';
    end;

    CloseHandle(fileHandle);
  end else begin
    msg := SysErrorMessage(GetLastError) + '2';
  end;

  ShowMessage(msg);
  exit;
end;

const
  // Max number of drives assuming primary/secondary, master/slave topology
  MAX_IDE_DRIVES = 16;

procedure get_sig;
var
  i:       Integer;
  RawMBR:  array[0..511] of Byte;
  btsIO:   DWORD;
  hDevice: THandle;
  s:       String;
begin
  s := '';
  for i := 0 to MAX_IDE_DRIVES - 1 do begin
    hDevice := CreateFile(PChar('\\.\PHYSICALDRIVE' + IntToStr(i)), GENERIC_READ,
      FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, 0, 0);
    if hDevice <> INVALID_HANDLE_VALUE then begin
      SetFilePointer(hDevice, 0, nil, FILE_BEGIN);  //MBR starts in sector 0
      if not ReadFile(hDevice, RawMBR[0], 512, btsIO, nil) then begin
        CloseHandle(hDevice);
        Continue;
      end;
      CloseHandle(hDevice);
      s := s + 'Disk ' + IntToStr(i) + ' = ' + AnsiChar(RawMBR[0]) + ' ' +
        AnsiChar(RawMBR[1]) + ' ' + AnsiChar(RawMBR[2]) + ' ' +
        AnsiChar(RawMBR[3]) + ' ' + IntToHex(RawMBR[4], 2) +
        ' ' + IntToHex(RawMBR[5], 2) + ' ' + IntToHex(RawMBR[6], 2) + #13#10;
    end;
  end;
  ShowMessage(s);
end;


function TfrmMain.DoAdHocTests: Boolean;
var
  res:        Ansistring;
  dataLength: DWORD;

  //function ReadRawVolumeData(filename: String;
  //  offsetWithinFile: Int64; dataLength: DWORD;
  //  // In bytes
  //  var Data: Ansistring): Boolean;
  //var
  //  fStream: TFileStream;
  //begin
  //  Result := False;
  //
  //  // Set data so that it has enough characters which can be
  //  // overwritten with StrMove
  //  data := StringOfChar(AnsiChar(#0), dataLength);
  //
  //  try
  //    fStream := TFileStream.Create(filename, fmOpenRead);
  //    try
  //      fStream.Position := offsetWithinFile;
  //      fStream.Read(data[1], dataLength);
  //      Result := True;
  //    finally
  //      fStream.Free();
  //    end;
  //  except
  //    // Just swallow exception; Result already set to FALSE
  //  end;
  //
  //end;

begin
  dataLength := 20;
  res        := StringOfChar(AnsiChar(#0), dataLength);
  //  result := get_from_device(
  //'\\.\PHYSICALDRIVE1'
  //  ,dataLength,res);
  //   get_layout;
  get_sig;
end;

{ tests
  system tests
  opens volumes created with old versions and checks contents as expected
  regression testing only
  see testing.jot for more details of volumes

  to test
  LUKS keyfile
  LUKS at offset (ever used?)
  creating vol
  creating keyfile
  creating .les file
  partition operations
  overwrite ops
  pkcs11 ops
  cdb at offset
  salt <> default value
}
function TfrmMain.DoFullTests: Boolean;
var
  //  mountList:       TStringList;
  mountedAs:       DriveLetterChar;
  vol_path, key_file, les_file, copy_file: String;
  vl:              Integer;
  arr, arrB, arrC: TSDUBytes;
  parr:            PByteArray;
  i:               Integer;
  buf:             Ansistring;
  mountFile, s:    String;
  val64:           Int64;
const

  MAX_TEST_VOL = 12;

  {this last dmcrypt_dx.box with dmcrypt_hid.les can cause BSoD - if force umounted }
  TEST_VOLS: array[0..MAX_TEST_VOL] of String =
    ('a.box', 'b.box', 'c.box', 'd.box', 'e.box', 'e.box', 'f.box', 'luks.box',
    'luks_essiv.box', 'a.box', 'b.box', 'dmcrypt_dx.box', 'dmcrypt_dx.box');
  PASSWORDS: array[0..MAX_TEST_VOL] of Ansistring =
    ('password', 'password', '!"�$%^&*()', 'password', 'password', '5ekr1t',
    'password', 'password', 'password', 'secret', 'secret', 'password', '5ekr1t');
  ITERATIONS: array[0..MAX_TEST_VOL] of Integer =
    (2048, 2048, 2048, 2048, 10240, 2048, 2048, 2048, 2048, 2048, 2048, 2048, 2048);
  OFFSET: array[0..MAX_TEST_VOL] of Integer =
    (0, 0, 0, 0, 0, 2097152, 0, 0, 0, 0, 0, 0, 0);
  KEY_FILES: array[0..MAX_TEST_VOL] of String =
    ('', '', '', '', '', '', '', '', '', 'a.cdb', 'b.cdb', '', '');
  LES_FILES: array[0..MAX_TEST_VOL] of String =
    ('', '', '', '', '', '', '', '', '', '', '', 'dmcrypt_dx.les', 'dmcrypt_hid.les');

 (*

  MAX_TEST_VOL = 0;
  TEST_VOLS: array[0..MAX_TEST_VOL] of String =   ('dmcrypt_dx.box');
  PASSWORDS: array[0..MAX_TEST_VOL] of String =   ( 'password');
  ITERATIONS: array[0..MAX_TEST_VOL] of Integer = ( 2048);
  OFFSET: array[0..MAX_TEST_VOL] of Integer =     (0);
  KEY_FILES: array[0..MAX_TEST_VOL] of String =   ('');
  LES_FILES: array[0..MAX_TEST_VOL] of String =   ('dmcrypt_dx.les');
       *)
  procedure CheckMountedOK;
  begin
    RefreshDrives();
    // Mount successful
    //        prettyMountedAs := prettyPrintDriveLetters(mountedAs);
    if (CountValidDrives(mountedAs) <> 1) then begin
      SDUMessageDlg(Format('The container %s has NOT been opened as drive: %s',
        [TEST_VOLS[vl], mountedAs]));
      Result := False;
    end else begin
      //done: test opened OK & file exists
      if not FileExists(mountedAs + ':\README.txt') then begin
        SDUMessageDlg(Format('File: %s:\README.txt not found', [mountedAs]));
        Result := False;
      end;
    end;
  end;

  procedure UnMountAndCheck;
  begin
    Application.ProcessMessages;
    DismountAll(True);
    Application.ProcessMessages;
    RefreshDrives();
    Application.ProcessMessages;
    if CountValidDrives(GetFreeOTFE().DrivesMounted) > 0 then begin
      SDUMessageDlg(Format('Drive(s) %s not unmounted', [GetFreeOTFE().DrivesMounted]));
      Result := False;
    end;
  end;

begin
  inherited;
  //todo: force isSilent in test
  Result := True;

  //test inttostr support 64 bit vals
  val64 := 1;
  s     := IntToStr(val64);
  if s <> '1' then
    Result := False;
  // The range for the Int64 type is from -2^63 through 2^63-1.
  val64 := $FFFFFFFFFFFFFFF;
  s := IntToStr(val64);
  if s <> '1152921504606846975' then
    Result := False;
  val64 := (-1 * val64) - 1;
  s := IntToStr(val64);
  if s <> '-1152921504606846976' then
    Result := False;

  if not Result then begin
    SDUMessageDlg('IntToStr fails');
    exit;
  end;

  (**********************************
    first some simple unit tests of sdu units to make sure are clearing memory
    main tests of operation is by functional tests, but we also need to check
    security features, e.g. that mem is cleared, separately
  *)
  // test fastMM4 clears mem, or SafeSetLength if AlwaysClearFreedMemory not defd


  {$IFDEF FullDebugMode}
   SDUMessageDlg('Freed memory wiping test will fail because FullDebugMode set');
   // could do this - but then fillbyte is $80
    //this overrides AlwaysClearFreedMemory
   {$IFDEF AlwaysClearFreedMemory}
    SDUMessageDlg('Freed memory wiping test will fail because FullDebugMode set');
    {$ENDIF}
  {$ENDIF}


  SafeSetLength(arr, 100);
  for i := low(arr) to High(arr) do
    arr[i] := i;
  parr := @arr[0];
 { setlength(arr,10);
    AlwaysClearFreedMemory doesnt clear this mem - make sure cleared in sduutils for TSDUBytes using SafeSetLength
  for i := 10 to 99 do if parr[i] <> 0 then result := false;
  -
  }
  SafeSetLength(arr, 0);
  for i := 0 to 99 do
    if parr[i] <> 0 then
      Result := False;   // memory can be reallocated - but unlikely to be same values
  SafeSetLength(arr, 100);
  for i := low(arr) to High(arr) do
    arr[i] := i;
  parr := @arr[0];
  // increasing size can reallocate
  // resize more till get new address
  // call SafeSetLength in case AlwaysClearFreedMemory not defed
  while parr = @arr[0] do
    SafeSetLength(arr, length(arr) * 2);

  for i := 0 to 99 do
    if parr[i] <> 0 then
      Result := False;

  //this will fail if AlwaysClearFreedMemory not set
  if not Result then begin
    SDUMessageDlg('Freed memory wiping failed');
    exit;
  end;

  // now test TSDUBytes fns for copying resizing etc. ...
  SafeSetLength(arr, 0);
  SafeSetLength(arr, 90);
  //this should zero any new data (done by delphi runtime)
  for i := low(arr) to high(arr) do
    if arr[i] <> 0 then
      Result := False;
  //and test if increasing size
  SafeSetLength(arr, 100);
  for i := 90 to high(arr) do
    if arr[i] <> 0 then
      Result := False;

  for i := low(arr) to High(arr) do
    arr[i] := i;
  SDUZeroBuffer(arr); // zeroises
  for i := 0 to 99 do
    if arr[i] <> 0 then
      Result := False;

  SafeSetLength(arr, 100);
  for i := low(arr) to High(arr) do
    arr[i] := i;
  parr := @arr[0];
  SDUInitAndZeroBuffer(1, arr);  // sets length and zeroises
  for i := 1 to 99 do
    if parr[i] <> 0 then
      Result := False;

  SafeSetLength(arr, 100);
  for i := low(arr) to High(arr) do
    arr[i] := i;
  parr := @arr[0];
  SafeSetLength(arr, 10);// changes len - what fastmm doesnt do
  for i := 10 to 99 do
    if parr[i] <> 0 then
      Result := False;

  setlength(buf, 100);
  for i := 1 to length(buf) do
    buf[i] := AnsiChar(i - 1);
  parr := @buf[1];
  SDUZeroString(buf);
  for i := 0 to 99 do
    if parr[i] <> 0 then
      Result := False;

  setlength(arr, 100);
  for i := low(arr) to High(arr) do
    arr[i] := i;
  parr := @arr[0];

  i := 100;
  // resize more till get new address
  while parr = @arr[0] do begin
    SDUAddByte(arr, i);
    Inc(i);
  end;
  //check old data zero
  for i := 0 to 99 do
    if parr[i] <> 0 then
      Result := False;
  //check added ok
  for i := low(arr) to High(arr) do
    if arr[i] <> i then
      Result := False;

  //test SDUAddArrays
  setlength(arr, 100);
  parr := @arr[0];
  setlength(arrB, 50);
  for i := low(arrB) to High(arrB) do
    arrB[i] := i + 100;
  SDUAddArrays(arr, arrB);
  // if reallocated - test zerod old array
  if parr <> @arr[0] then
    for i := 0 to 99 do
      if parr[i] <> 0 then
        Result := False;

  //check added ok
  if length(arr) <> 150 then
    Result := False;
  for i := low(arr) to High(arr) do
    if arr[i] <> i then
      Result := False;

  //test SDUAddLimit
  setlength(arr, 100);
  parr := @arr[0];
  SDUAddLimit(arr, arrB, 10);
  // if reallocated - test zerod old array
  if parr <> @arr[0] then
    for i := 0 to 99 do
      if parr[i] <> 0 then
        Result := False;
  //check added ok
  if length(arr) <> 110 then
    Result := False;
  for i := low(arr) to High(arr) do
    if arr[i] <> i then
      Result := False;

  // test SDUDeleteFromStart
  parr := @arr[0];
  SDUDeleteFromStart(arr, 5);
  // if reallocated - test zerod old array
  if parr <> @arr[0] then
    for i := 0 to 109 do
      if parr[i] <> 0 {= i+5} then
        Result := False;

  // check deleted
  if length(arr) <> 105 then
    Result := False;
  for i := low(arr) to High(arr) do
    if arr[i] <> i + 5 then
      Result := False;

  //  SDUCopy
  // as length increasing - likely to reallocate
  SafeSetLength(arr, 10);
  parr := @arr[0];
  setlength(arrB, 100);

  SDUCopy(arr, arrB);
  if parr <> @arr[0] then
    for i := 0 to 9 do
      if parr[i] <> 0{ i+100} then
        Result := False;
  // check worked
  if length(arr) <> length(arrB) then
    Result := False;
  for i := low(arr) to High(arr) do
    if arr[i] <> arrB[i] then
      Result := False;

  //check length decreasing, zeros unallocated bytes
  SafeSetLength(arr, 100);
  parr := @arr[0];
  setlength(arrB, 10);
  for i := low(arr) to High(arr) do
    arr[i] := i;
  SDUCopy(arr, arrB);

  //sets newly unused bytes to $80
  for i := 10 to 99 do
    if (parr[i] = i + 100) and (parr[i] <> $80) then
      Result := False;
  // check worked
  if length(arr) <> length(arrB) then
    Result := False;
  for i := low(arr) to High(arr) do
    if arr[i] <> arrB[i] then
      Result := False;

  // SDUCopyLimit is called from SDUCopy so no need to test directly

  if not Result then
    SDUMessageDlg('Freed memory wiping with TSDUBytes failed');

  if not Result then
    exit;

  // test SDUXOR using diverse implementation SDUXORStr
  Randomize;
  setlength(arr, 100);
  setlength(arrB, 100);
  for i := low(arr) to High(arr) do begin
    arr[i]  := Random(High(Byte) + 1);
    arrB[i] := Random(High(Byte) + 1);
  end;

  arrC := SDUXOR(arr, arrB);
  buf  := SDUXOrStr(SDUBytesToString(arr), SDUBytesToString(arrB));
  if SDUBytesToString(arrC) <> buf then
    Result := False;

  if not Result then
    SDUMessageDlg('SDUXOR test failed');
  //timing - uses freeotfe vol with 100K iterations
  Result := True;
  //test byte array fns
  assert('1234' = SDUBytesToString(SDUStringToSDUBytes('1234')));

  //  exit;
  Visible := False;

  //for loop is optimised into reverse order, but want to process forwards
  vl       := 0;
    {$IFDEF DEBUG}
        vol_path := ExpandFileName(ExtractFileDir(Application.ExeName) + '\..\..\..\..\test_vols\');
    {$ELSE}
  vol_path := ExpandFileName(ExtractFileDir(Application.ExeName) + '\..\..\test_vols\');
    {$ENDIF}
  while vl <= high(TEST_VOLS) do begin

    //test one at a time as this is normal use
    //      mountList.Clear;
    mountFile := vol_path + TEST_VOLS[vl];
    mountedAs := #0;
    key_file  := '';
    if KEY_FILES[vl] <> '' then
      key_file := vol_path + KEY_FILES[vl];
    if LES_FILES[vl] <> '' then
      les_file := vol_path + LES_FILES[vl];

    if IsLUKSVolume(mountFile) then begin
      if not LUKSTools.MountLUKS(mountFile, mountedAs, True,
        SDUStringToSDUBytes(PASSWORDS[vl]), key_file, False, nlLF, True) then
        Result := False;

    end else begin
      if (LES_FILES[vl] <> '') then begin
        if not frmKeyEntryLinux.MountPlainLinux(mountFile, mountedAs, True,
          les_file, SDUStringToSDUBytes(PASSWORDS[vl]), 0) then
          Result := False;

      end else begin
        //call silently
        if not MountFreeOTFE(mountFile, mountedAs, True, key_file,
          SDUStringToSDUBytes(PASSWORDS[vl]), OFFSET[vl], False, True, 256, ITERATIONS[vl]) then
          Result := False;
      end;
    end;

    if not Result then begin
      SDUMessageDlg(_('Unable to open ') + TEST_VOLS[vl] + '.', mtError);
      break;
    end else begin
      CheckMountedOK;
      UnMountAndCheck;
    end;
    Inc(vl);
  end;

  {test changing password
    backup freeotfe header ('cdb')
    change password
    open with new password
    restore header
    open with old password -tested on next test run
    this tests most of code for creating volume as well
  }

  //don't fail if doesn't exist
  SysUtils.DeleteFile(vol_path + 'a_test.cdbBackup');
  copy_file := vol_path + TEST_VOLS[0] + '.copy';
  SDUFileCopy(vol_path + TEST_VOLS[0], copy_file);

  //SET RW
  Result := Result and FileSetReadOnly(copy_file, False);

  if Result then
    BackupRestore(opBackup, copy_file, vol_path + 'a_test.cdbBackup', True);
  Result := Result and frmWizardChangePasswordCreateKeyfile.WizardChangePassword(
    copy_file, PASSWORDS[0], 'secret4', True);

  if Result then begin
    if not MountFreeOTFE(copy_file, mountedAs, True, '', SDUStringToSDUBytes('secret4'),
      0, False, True, 256, 2048) then
      Result := False;
  end;
  if Result then
    CheckMountedOK;
  UnmountAndCheck;
  if Result then
    BackupRestore(opRestore, copy_file, vol_path + 'a_test.cdbBackup', True);
  if Result then begin
    if not MountFreeOTFE(copy_file, mountedAs, True, '', SDUStringToSDUBytes(PASSWORDS[0]),
      0, False, True, 256, 2048) then
      Result := False;
  end;
  UnmountAndCheck;

  SysUtils.DeleteFile(copy_file);
  { TODO -otdk -cenhance : use copied file to check is same as orig file }
  // no need to check mount again as will be checked with next test run
  SysUtils.DeleteFile(vol_path + 'a_test.cdbBackup');

  if Result then
    SDUMessageDlg('All functional tests passed')
  else
    SDUMessageDlg('At least one functional test failed');

  Visible := True;
end;


{ tests
  luks tests
  creates luks volume,
  writes file to it
  dismounts
  mounts
  checks file is there
  deltes file

  to test
  LUKS keyfile
  LUKS at offset (ever used?)
  creating vol
  creating keyfile
  creating .les file
  partition operations
  overwrite ops
  pkcs11 ops
  cdb at offset
  salt <> default value
}
function TfrmMain.DoLuksTests: Boolean;
var
  vol_dir: String;
  vol_file  : string;
begin
  vol_dir  := ExtractFileDir(Application.ExeName) + '\..\..\';
    {$IFDEF DEBUG}
        vol_dir := vol_dir + '..\..\';
    {$ENDIF}
  vol_dir  := ExpandFileName(vol_dir + 'test_vols\');
  vol_file := vol_dir + 'luks.new.vol';
  SysUtils.DeleteFile(vol_file);

 DoLuksTestsOnVol(vol_file);
end;

function TfrmMain.DoSDCardTests: Boolean;
begin
  // sd card must be on '' for this to work
  // MAY TRASH DISCS OTHERWISE
  DoLuksTestsOnVol('\Device\Harddisk1\Partition1');
end;

function TfrmMain.DoLuksTestsOnVol(vol_file  : string   ): Boolean;
var
  //  mountList: TStringList;
  mountedAs:      DriveLetterChar;
  vol_dir, key_file, err_msg: String;
  drive:          DriveLetterChar;
  refresh_drives: Boolean;

const
//  TEST_VOL: String     = 'luks.new.vol';
  PASSWORD: Ansistring = 'password';

  procedure CheckMountedOK;
  begin
    RefreshDrives();
    // Mount successful
    if (CountValidDrives(mountedAs) <> 1) then begin
      SDUMessageDlg(Format('The container %s has NOT been opened as drive: %s',
        [vol_file, mountedAs]));
      Result := False;
    end else begin
      //done: test opened OK & file exists
      if not FileExists(mountedAs + ':\README.txt') then begin
        SDUMessageDlg(Format('File: %s:\README.txt not found', [mountedAs]));
        Result := False;
      end;
    end;
  end;

  procedure UnMountAndCheck;
  begin
    Application.ProcessMessages;
    DismountAll(True);
    Application.ProcessMessages;
    RefreshDrives();
    Application.ProcessMessages;
    if CountValidDrives(GetFreeOTFE().DrivesMounted) > 0 then begin
      SDUMessageDlg(Format('Drive(s) %s not unmounted', [GetFreeOTFE().DrivesMounted]));
      Result := False;
    end;
  end;

begin

  inherited;
  Result   := True;
  //  mountList := TStringList.Create();
  //  try
  vol_dir  := ExtractFileDir(Application.ExeName) + '\..\..\';
    {$IFDEF DEBUG}
        vol_dir := vol_dir + '..\..\';
    {$ENDIF}
  vol_dir  := ExpandFileName(vol_dir + 'test_vols\');
//  vol_file := vol_dir + TEST_VOL;



  Result := CreateNewLUKS(vol_file, SDUStringToSDUBytes(PASSWORD), 4 * 1024 *
    1024, 'SHA256', err_Msg, drive, refresh_drives);

  if not Result then begin
    SDUMessageDlg(_('Unable to create ') + vol_file + '. :' + err_msg, mtError);
    exit;
  end;
  Application.ProcessMessages;
  // copy readme to disc
  SDUFileCopy(vol_dir + 'readme.txt', drive + ':\');
  Application.ProcessMessages;
  if not FileExists(drive + ':\README.txt') then begin
    SDUMessageDlg(Format('File: %s:\README.txt not found', [drive]));
    Result := False;
  end;

  Application.ProcessMessages;
  Sleep(1000);
  Application.ProcessMessages;
  DismountAll(False);
  Application.ProcessMessages;
  Sleep(1000);
  Application.ProcessMessages;
  DismountAll(True);
  RefreshDrives();

  //test one at a time as this is normal use
  //    mountList.Clear;
  //    mountList.Add(vol_file);
  mountedAs := #0;
  key_file  := '';

  if IsLUKSVolume(vol_file) then begin
    if not LUKSTools.MountLUKS(vol_file, mountedAs, True, SDUStringToSDUBytes(PASSWORD),
      key_file, False, nlLF, True) then
      Result := False;
  end else begin
    Result := False;
  end;

  if not Result then begin
    SDUMessageDlg(_('Unable to open ') + vol_file + '.', mtError);

  end else begin
    CheckMountedOK;
    UnMountAndCheck;
  end;

  Result := Result and LUKSTools.DumpLUKSDataToFile(vol_file, SDUStringToSDUBytes(PASSWORD),
    '', False, nlCRLF, False, vol_file + '.dump.txt');

  if Result then
    SDUMessageDlg('All LUKS functional tests passed')
  else
    SDUMessageDlg('At least one LUKS functional test failed');
end;


procedure TfrmMain.FormCreate(Sender: TObject);
begin

  // Prevent endless loops of UAC escalation...
  fallowUACEscalation := False;

  inherited;

  fendSessionFlag    := False;
  fIsAppShuttingDown := False;

  fIconMounted          := TIcon.Create();
  fIconMounted.Handle   := LoadImage(hInstance, PChar(R_ICON_MOUNTED), IMAGE_ICON,
    16, 16, LR_DEFAULTCOLOR);
  fIconUnmounted        := TIcon.Create();
  fIconUnmounted.Handle := LoadImage(hInstance, PChar(R_ICON_UNMOUNTED),
    IMAGE_ICON, 16, 16, LR_DEFAULTCOLOR);

  fcountPortableDrivers := -1;

  StatusBar_Status.SimplePanel := True;

  // We set these to invisible so that if they're disabled by the user
  // settings, it doens't flicker on them off
  //  ToolBar1.Visible := False;

  // Give the user a clue
  //  ToolBar1.ShowHint := True;

  //  ToolBar1.Indent := 5;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  inherited;

  // Note: If Settings is *not* set, this will be free'd off
  //       in .dpr

  // dont need to call DestroyIcon
  fIconMounted.Free();
  fIconUnmounted.Free();
end;

procedure TfrmMain.actRefreshExecute(Sender: TObject);
begin
  RefreshDrives();
end;


procedure TfrmMain.lvDrivesResize(Sender: TObject);
begin
  ResizeWindow();
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  // Don't call ResizeWindow() here - it causes Windows 7 to give an error
  // ("System Error. Code 87") on startup if both FormResize(...) and
  // lvDrivesResize(...) call this, which prevents the application from
  // initializing properly (e.g. it won't accept drag dropped files on the GUI,
  // because it silently aborts before initializing that functionality)
  //  ResizeWindow();
end;


// Resize the columns in the drives list so the 2nd column fills out...
procedure TfrmMain.ResizeWindow();
var
  tmpColumn: TListColumn;
begin
  if lvDrives.columns.Count > 1 then begin
    tmpColumn       := lvDrives.columns[1];
    tmpColumn.Width := lvDrives.clientwidth - lvDrives.columns[0].Width - ilDriveIcons.Width;
  end;

end;



// Reload settings, setting up any components as needed
procedure TfrmMain.ReloadSettings();
begin
  inherited;

  SDUSystemTrayIcon1.Tip := Application.Title;

  SDUClearPanel(pnlTopSpacing);

  SDUSystemTrayIcon1.Active         := GetMainSettings().OptSystemTrayIconDisplay;
  SDUSystemTrayIcon1.MinimizeToIcon := GetMainSettings().OptSystemTrayIconMinTo;

  SetupHotKeys();

  RefreshMRUList();

  if GetSettings().OptDisplayToolbarLarge then begin
    ToolBar1.Images := ilToolbarIcons_Large;
  end else begin
    ToolBar1.Images := ilToolbarIcons_Small;
  end;

  // Set icons on menuitems
  if (FIconIdx_Small_VistaUACShield >= 0) then begin
    miFreeOTFEDrivers.ImageIndex     := FIconIdx_Small_VistaUACShield;
    miPortableModeDrivers.ImageIndex := FIconIdx_Small_VistaUACShield;
    actFormat.ImageIndex             := FIconIdx_Small_VistaUACShield;

    // Splat small Vista UAC shield icon onto large *portable mode* icon
    //  lplp - todo - Note: 22x22 "World" icon may be too small to have UAC icon on top of it?
  end;


  ToolBar1.Visible := GetSettings().OptDisplayToolbar;

  // Toolbar captions...
  if GetSettings().OptDisplayToolbarLarge then begin
    ToolBar1.ShowCaptions := GetSettings().OptDisplayToolbarCaptions;
  end else begin
    ToolBar1.ShowCaptions := False;
  end;

  // Set the toolbar size
  ToolBar1.Height       := ToolBar1.Images.Height + TOOLBAR_ICON_BORDER;
  ToolBar1.ButtonHeight := ToolBar1.Images.Height;
  ToolBar1.ButtonWidth  := ToolBar1.Images.Width;

  //  if GetSettings().OptDisplayToolbar then begin

  //    // Turning captions on can cause the buttons to wrap if the window isn't big
  //    // enough.
  //    // This looks pretty poor, so resize the window if it's too small
  //    toolbarWidth := 0;
  //    for i := 0 to (Toolbar1.ButtonCount - 1) do begin
  //      toolbarWidth := toolbarWidth + Toolbar1.Buttons[i].Width;
  //    end;

  //    if (toolbarWidth > self.Width) then begin

  //      self.Width := toolbarWidth;
  //    end;
  //    // Adjusting the width to the sum of the toolbar buttons doens't make it wide
  //    // enough to prevent wrapping (presumably due to window borders); nudge the
  //    // size until it does
  //    // (Crude, but effective)

  //    while (Toolbar1.RowCount > 1) do begin
  //      self.Width := self.Width + 10;
  //    end;

  //  end;

end;

procedure TfrmMain._MountFile(mountAsSystem: TVolumeType;
  filename: String; ReadOnly, isHidden, createVol: Boolean{only applicable for dmcrypt});
var
  mountedAs:       DriveLetterChar;
  msg:             String;
  mountedOK:       Boolean;
  prettyMountedAs: String;
begin
  // Why was this in here?!
  //  ReloadSettings();

  AddToMRUList(filename);

  if (mountAsSystem = vtFreeOTFE) then begin
    mountedOK := MountFreeOTFE(filename, mountedAs, ReadOnly);
  end else begin

    if (mountAsSystem = vtPlainLinux) then begin
      mountedOK := frmKeyEntryLinux.MountPlainLinux(filename, mountedAs,
        ReadOnly, '', nil, 0, createVol, isHidden);
    end else begin
      if (mountAsSystem = vtLUKS) then begin
        assert(not isHidden);
        if not IsLUKSVolume(filename) then begin
          SDUMessageDlg(Format(_('%s is not a LUKS container.'), [filename]), mtError);
          mountedOK := False;
        end else begin
          mountedOK := LUKSTools.MountLUKS(filename, mountedAs, ReadOnly, nil,
            '', False, LINUX_KEYFILE_DEFAULT_NEWLINE, False);
        end;

      end else begin
        mountedOK := frmSelectVolumeType.Mount(filename, mountedAs, ReadOnly);
      end;
    end;
  end;

  if not (mountedOK) then begin
    if (GetFreeOTFE().LastErrorCode <> OTFE_ERR_USER_CANCEL) then begin
      SDUMessageDlg(
        _('Unable to open container.') + SDUCRLF + SDUCRLF +
        _('Please check your keyphrase and settings, and try again.'),
        mtError
        );
    end;
  end else begin
    // Mount successful
    prettyMountedAs := PrettyPrintDriveLetters(mountedAs);
    if (CountValidDrives(mountedAs) = 1) then begin
      msg := Format(_('Your container has been opened as drive: %s'), [prettyMountedAs]);
    end else begin
      msg := Format(_('Your containers have been opened as drives: %s'), [prettyMountedAs]);
    end;

    RefreshDrives();

    if GetSettings().OptPromptMountSuccessful then begin
      SDUMessageDlg(msg, mtInformation);
    end;

    if (mountedAs <> #0) then begin
      if GetSettings().OptExploreAfterMount then begin
        _ExploreDrive(mountedAs);
      end;

      _AutoRunExecute(arPostMount, mountedAs, False);
    end;
  end;

end;


procedure TfrmMain.RefreshMRUList();
begin
  inherited;

  // Refresh menuitems...
  GetSettings().OptMRUList.RemoveMenuItems(mmMain);
  GetSettings().OptMRUList.InsertAfter(miFreeOTFEDrivers);

  GetSettings().OptMRUList.RemoveMenuItems(pmSystemTray);
  GetSettings().OptMRUList.InsertUnder(mmRecentlyMounted);

  mmRecentlyMounted.Visible := ((GetSettings().OptMRUList.MaxItems > 0) and
    (GetSettings().OptMRUList.Items.Count > 0));

end;

procedure TfrmMain.MRUListItemClicked(mruList: TSDUMRUList; idx: Integer);
begin
  _MountFilesDetectLUKS(mruList.Items[idx], False, GetSettings().OptDragDropFileType);
end;

 // Handle files being dropped onto the form from (for example) Windows Explorer.
 // Files dropped onto the form should be treated as though the user is trying
 // to mount them as volume files
procedure TfrmMain.WMDropFiles(var Msg: TWMDropFiles);
var
  buffer:   array[0..MAX_PATH] of Char;
  numFiles: Longint;
  i:        Integer;
  //  filesToMount: TStringList;
begin
  try
    // Bring our window to the foreground
    SetForeGroundWindow(self.handle);

    // Handle the dropped files
    numFiles := DragQueryFile(Msg.Drop, $FFFFFFFF, nil, 0);
    //    filesToMount := TStringList.Create();
    //    try
    for i := 0 to (numFiles - 1) do begin
      DragQueryFile(msg.Drop,
        i, @buffer,
        sizeof(buffer));
      //        filesToMount.Add(buffer);
      _MountFilesDetectLUKS(buffer, False, GetSettings().OptDragDropFileType);
    end;

    //      MountFilesDetectLUKS(filesToMount, False, GetSettings().OptDragDropFileType);

    Msg.Result := 0;
    //    finally
    //      filesToMount.Free();
    //    end;
  finally
    DragFinish(Msg.Drop);
  end;

end;


procedure TfrmMain.WMDeviceChange(var Msg: TMessage);
begin
  RefreshDrives();

end;


// Function required for close to system tray icon
procedure TfrmMain.WMQueryEndSession(var msg: TWMQueryEndSession);
begin
  // Default to allowing shutdown
  msg.Result      := 1;
  fendSessionFlag := (msg.Result = 1);
  inherited;
  fendSessionFlag := (msg.Result = 1);

end;


// Function required for close to system tray icon
procedure TfrmMain.WMEndSession(var msg: TWMEndSession);
begin
  fendSessionFlag := msg.EndSession;

end;


procedure TfrmMain.DriveProperties();
var
  propertiesDlg: TfrmVolProperties;
  i:             Integer;
  selDrives:     DriveLetterString;
begin
  selDrives := GetSelectedDrives();
  for i := 1 to length(selDrives) do begin
    propertiesDlg := TfrmVolProperties.Create(self);
    try
      propertiesDlg.DriveLetter := selDrives[i];
      propertiesDlg.ShowModal();
    finally
      propertiesDlg.Free();
    end;

  end;

end;


 // If "isEmergency" is TRUE, the user will *not* be informed of any drives
 // which couldn't be dismounted
function TfrmMain.DismountAll(isEmergency: Boolean = False): Boolean;
var
  drivesRemaining: DriveLetterString;
  initialDrives:   DriveLetterString;
  i:               Integer;
begin
  // Change CWD to anywhere other than a mounted drive
  ChangeCWDToSafeDir();

  // Launch any pre-dismount executable
  initialDrives := GetFreeOTFE().DrivesMounted;
  for i := 1 to length(initialDrives) do begin
    _AutoRunExecute(arPreDismount, initialDrives[i], isEmergency);
  end;

  GetFreeOTFE().DismountAll(isEmergency);

  // If it wasn't an emergency dismount, and drives are still mounted, report.
  drivesRemaining := GetFreeOTFE().DrivesMounted();

  for i := 1 to length(initialDrives) do begin
    // If the drive is no longer mounted, run any post-dismount executable
    if (Pos(initialDrives[i], drivesRemaining) <= 0) then begin
      _AutoRunExecute(arPostDismount, initialDrives[i], isEmergency);
    end;
  end;

  if (drivesRemaining <> '') then begin
    if not (isEmergency) then begin
      RefreshDrives();
      ReportDrivesNotDismounted(drivesRemaining, False);
    end else begin
      // Just give it another go... Best we can do.
      GetFreeOTFE().DismountAll(isEmergency);
    end;
  end;

  RefreshDrives();

  Result := (GetFreeOTFE().CountDrivesMounted <= 0);
end;


function TfrmMain.DismountSelected(): Boolean;
var
  toDismount: DriveLetterString;
begin
  // First we build up a list of drives to dismount, then we dismount them.
  // This is done since we can't just run through the lvDrives looking for
  // selected items, as they're getting removed while we walk though the list!
  toDismount := GetSelectedDrives();

  Result := DismountDrives(toDismount, False);
end;


 // Dismount the drives specified
 // This procedure *will* report drives which couldn't be mounted - regardless
 // of "isEmergency"
function TfrmMain.DismountDrives(dismountDrives: DriveLetterString;
  isEmergency: Boolean): Boolean;
var
  i:               Integer;
  j:               Integer;
  subVols:         DriveLetterString;
  tmpDrv:          DriveLetterChar;
  drivesRemaining: DriveLetterString;
begin
  Result          := True;
  drivesRemaining := '';

  // Change CWD to anywhere other than a mounted drive
  ChangeCWDToSafeDir();

  // Skip processing if no drives to dismount - otherwise it'll just flicker
  // the display
  if (dismountDrives <> '') then begin
    // Ensure that none of the drives to be dismounted contain one of the other
    // mounted drives
    // Although FreeOTFE wouldn't be able to dismount such a drive (it would
    // the mounted volume stored on it would have an open filehandles, so
    // preventing the dismount), it's clearly better to warn the user in a more
    // meaningful way than just "can't do it - files open"
    for i := 1 to length(dismountDrives) do begin
      tmpDrv := dismountDrives[i];

      subVols := GetFreeOTFE().VolsMountedOnDrive(tmpDrv);
      for j := 1 to length(subVols) do begin
        if (Pos(subVols[j], dismountDrives) = 0) then begin
          // At least one of the currently mounted drives is stored on one of
          // the drives to be dismounted - and we're not dismounting that drive
          SDUMessageDlg(
            Format(_(
            'The container currently opened as %s: must be locked before %s: can be locked'),
            [subVols[j], tmpDrv]), mtError);
          Result := False;
        end;
      end;
    end;

    if Result then begin
      // Sort out dismount order, in case one drive nested within another
      dismountDrives := GetFreeOTFE().DismountOrder(dismountDrives);


      for i := 1 to length(dismountDrives) do begin
        tmpDrv := dismountDrives[i];

        // Pre-dismount...
        _AutoRunExecute(arPreDismount, tmpDrv, isEmergency);

        if GetFreeOTFE().Dismount(tmpDrv, isEmergency) then begin
          // Dismount OK, execute post-dismount...
          _AutoRunExecute(arPostDismount, tmpDrv, isEmergency);
        end else begin
          drivesRemaining := drivesRemaining + tmpDrv;
          Result          := False;
        end;

      end;

      if (drivesRemaining <> '') then begin
        RefreshDrives();
        ReportDrivesNotDismounted(drivesRemaining, isEmergency);
      end;

      RefreshDrives();
    end;
  end;
end;


 // Warn the user that some drives remain mounted, and if the dismount attempted
 // wasn't an emergency dismount, then prompt the user if they want to attempt
 // an emergency dismount
procedure TfrmMain.ReportDrivesNotDismounted(drivesRemaining: DriveLetterString;
  isEmergency: Boolean);
var
  msg:       String;
  warningOK: Boolean;
  forceOK:   Boolean;
begin
  msg := SDUPluralMsg(length(drivesRemaining), Format(
    _('Unable to dismount drive: %s'), [PrettyPrintDriveLetters(drivesRemaining)]),
    Format(_('Unable to dismount drives: %s'), [PrettyPrintDriveLetters(drivesRemaining)]));

  // If the dismount attempted was a non-emergency dismount; prompt user if
  // they want to attempt an emergency dismount
  if not (isEmergency) then begin
    forceOK := False;
    if (GetMainSettings().OptOnNormalDismountFail = ondfPromptUser) then begin
      msg     := msg + SDUCRLF + SDUCRLF + SDUPluralMsg(
        length(drivesRemaining), _('Do you wish to force a dismount on this drive?'),
        _('Do you wish to force a dismount on these drives?'));
      forceOK := SDUConfirmYN(msg);
    end else
    if (GetMainSettings().OptOnNormalDismountFail = ondfForceDismount) then begin
      forceOK := True;
    end else  // ondfCancelDismount
    begin
      // Do nothing - forceOK already set to FALSE
    end;

    if forceOK then begin
      warningOK := True;
      if GetMainSettings().OptWarnBeforeForcedDismount then begin
        warningOK := SDUWarnYN(_('Warning: Emergency dismounts are not recommended') +
          SDUCRLF + SDUCRLF + _('Are you sure you wish to proceed?'));
      end;

      if warningOK then begin
        DismountDrives(drivesRemaining, True);
      end;

    end;
  end else begin
    // Dismount reporting on *was* an emergency dismount; just report remaining
    // drives still mounted
    SDUMessageDlg(msg, mtInformation, [mbOK], 0);
  end;

end;



procedure TfrmMain.lvDrivesClick(Sender: TObject);
begin
  EnableDisableControls();

end;

procedure TfrmMain.EnableDisableControls();
var
  drivesSelected: Boolean;
  drivesMounted:  Boolean;
begin
  inherited;

  // The FreeOTFE object may not be active...
  actFreeOTFEMountPartition.Enabled :=
    (GetFreeOTFE().Active and GetFreeOTFE().CanMountDevice());
  // Linux menuitem completely disabled if not active...
  actLinuxMountPartition.Enabled    :=
    (miLUKSDump.Enabled and GetFreeOTFE().CanMountDevice());

  // Flags used later
  drivesSelected := (lvDrives.selcount > 0);
  drivesMounted  := (lvDrives.Items.Count > 0);

  // Actions & menuitems to be enabled/disabled, depending on whether a drive
  // is selected
  actDismount.Enabled   := drivesSelected;
  actProperties.Enabled := drivesSelected;

  miFormat.Enabled                := drivesSelected;
  miPopupFormat.Enabled           := drivesSelected;
  actOverwriteFreeSpace.Enabled   := drivesSelected;  // Note: Implies FreeOTFE drivers are running
  actOverwriteEntireDrive.Enabled := drivesSelected;  // Note: Implies FreeOTFE drivers are running

  // Action item to be enabled/disabled, as long as one or more drives are
  // mounted
  actDismountAll.Enabled := drivesMounted;

  // Driver handling...
  actTogglePortableMode.Checked := (fcountPortableDrivers > 0);
  actTogglePortableMode.Enabled :=
    (GetFreeOTFE().CanUserManageDrivers() or
    // If we're on Vista, always allow the
    // toggle portable mode option; the
    // user can escalate UAC if needed
    SDUOSVistaOrLater());

  // If the portable mode control is enabled, but we don't know how many
  // drivers there are in portable mode, presumably we're running under
  // Vista without admin access - in which case this control just toggles the
  // portable mode status - and DOESN'T turn it on/off
  if (actTogglePortableMode.Enabled and (fcountPortableDrivers < 0)) then begin
    actTogglePortableMode.Caption := _('Toggle portable mode drivers');
  end else begin
    actTogglePortableMode.Caption := _('Use portable mode drivers');

    // Ensure NO ICON FOR PORTABLE MODE DRIVERS if the user is admin; it shows
    // a checkbox instead, depending on whether the drivers are running or not
    miPortableModeDrivers.ImageIndex := -1;
  end;


  // Misc display related...
  if drivesMounted then
    SDUSystemTrayIcon1.Icon := fIconMounted
  else
    SDUSystemTrayIcon1.Icon := fIconUnmounted;


  StatusBar_Status.Visible := GetSettings().OptDisplayStatusbar;
  StatusBar_Hint.Visible   := False;

  SetStatusBarTextNormal();
end;

procedure TfrmMain.SetStatusBarTextNormal();
var
  drvLetter:  DriveLetterChar;
  freeSpace:  Int64;
  totalSpace: Int64;
  statusText: String;
  selDrives:  DriveLetterString;
begin
  statusText := '';

  selDrives := GetSelectedDrives();

  // Update status bar text, if visible
  if (StatusBar_Status.Visible or StatusBar_Hint.Visible) then begin
    statusText := '';
    if not (GetFreeOTFE().Active) then begin
      statusText := _('FreeOTFE main driver not connected.');
    end else
    if (length(selDrives) = 0) then begin
      statusText := SDUPluralMsg(lvDrives.Items.Count,
        Format(_('%u drive mounted.'), [lvDrives.Items.Count]),
        Format(_('%u drives mounted.'), [lvDrives.Items.Count]));
    end else
    if (length(selDrives) > 0) then begin
      if (length(selDrives) = 1) then begin
        drvLetter  := selDrives[1];
        freeSpace  := DiskFree(Ord(drvLetter) - 64);
        totalSpace := DiskSize(Ord(drvLetter) - 64);

        if ((freeSpace > -1) and (totalSpace > -1)) then begin
          statusText := Format(_('%s: Free Space: %s; Total size: %s'),
            [drvLetter, SDUFormatUnits(freeSpace, SDUUnitsStorageToTextArr(),
            UNITS_BYTES_MULTIPLIER, 1), SDUFormatUnits(totalSpace,
            SDUUnitsStorageToTextArr(), UNITS_BYTES_MULTIPLIER, 1)]);
        end;
      end;

      if (statusText = '') then begin
        statusText := SDUPluralMsg(lvDrives.SelCount,
          Format(_('%d drive selected.'), [length(selDrives)]),
          Format(_('%d drives selected.'), [length(selDrives)]));
      end;

    end;

  end;

  SetStatusBarText(statusText);
end;



function TfrmMain.GetDriveLetterFromLVItem(listItem: TListItem): DriveLetterChar;
var
  tmpDrv: String;
begin
  // Trim the padding whitespace off the drive letter + colon
  tmpDrv := listItem.Caption;
  tmpDrv := TrimLeft(tmpDrv);

  // The first letter of the item's caption is the drive letter
  Result := DriveLetterChar(tmpDrv[1]);

end;

procedure TfrmMain.lvDrivesDblClick(Sender: TObject);
var
  driveLetter: DriveLetterChar;
begin
  if (lvDrives.selcount > 0) then begin
    driveLetter := GetDriveLetterFromLVItem(lvDrives.selected);
    _ExploreDrive(driveLetter);
  end;

end;


procedure TfrmMain.DisplayDriverControlDlg();
var
  UACEscalateAttempted: Boolean;
begin
  UACEscalateAttempted := False;

  DeactivateFreeOTFEComponent();
  try
    try
      // This is surrounded by a try...finally as it may throw an exception if
      // the user doesn't have sufficient privs to do this
      frmDriverControl.ShowDriverControlDlg();

      // Send out a message to any other running instances of FreeOTFE to
      // refresh; the drivers may have changed.
      // Note that if we had to UAC escalate (see exception below), the UAC
      // escalated process will send out this windows message
{$IF CompilerVersion >= 18.5}
      //SendMessage(HWND_BROADCAST, GLOBAL_VAR_WM_FREEOTFE_REFRESH, 0, 0);
      PostMessage(HWND_BROADCAST, GLOBAL_VAR_WM_FREEOTFE_REFRESH, 0, 0);
{$ELSE}
      SDUPostMessageExistingApp(GLOBAL_VAR_WM_FREEOTFE_REFRESH, 0, 0);
{$IFEND}
    except
      on EFreeOTFENeedAdminPrivs do begin
        UACEscalateForDriverInstallation();
        UACEscalateAttempted := True;
      end;
    end;

  finally
    // Note: We supress any messages that may be the result of failing to
    //       activate the GetFreeOTFE() component activating the if we had to
    //       UAC escalate.
    //       In that situation, the UAC escalated process will sent out a
    //       refresh message when it's done.
    ActivateFreeOTFEComponent(UACEscalateAttempted);

    EnableDisableControls();
  end;

end;

procedure TfrmMain.actDriversExecute(Sender: TObject);
begin
  DisplayDriverControlDlg();
end;

function TfrmMain.ActivateFreeOTFEComponent(suppressMsgs: Boolean): Boolean;
begin
  inherited ActivateFreeOTFEComponent(suppressMsgs);

  // Let Windows know whether we accept dropped files or not
  DragAcceptFiles(self.Handle, GetFreeOTFE().Active);

  Result := GetFreeOTFE().Active;
end;

procedure TfrmMain.ShowOldDriverWarnings();
begin
  { DONE 1 -otdk -cclean : dont support old drivers }
  // No warnings to be shown in base class
  if (GetFreeOTFE().Version() < FREEOTFE_ID_v03_00_0000) then begin
    SDUMessageDlg(
      Format(_('The main LibreCrypt driver installed on this computer is for FreeOTFE %s'),
      [GetFreeOTFE().VersionStr()]) + SDUCRLF + SDUCRLF + _(
      'This driver will not work with this version of LibreCrypt,' +
      ' please uninstall FreeOTFE and reinstall LibreCrypt.') + SDUCRLF +
      SDUCRLF + _('See documentation (installation section) for instructions on how to do this.'),
      mtWarning
      );
  end else
  if (GetFreeOTFE().Version() < FREEOTFE_ID_v04_30_0000) then begin
    SDUMessageDlg(
      Format(_('The main LibreCrypt driver installed on this computer dates is for FreeOTFE %s'),
      [GetFreeOTFE().VersionStr()]) + SDUCRLF + SDUCRLF + _(
      'It is highly recommended that you upgrade your LibreCrypt drivers to those included in v4.30 or later as soon as possible,'
      + ' due to improvements in the main driver.') + SDUCRLF + SDUCRLF +
      _('See documentation (installation section) for instructions on how to do this.'),
      mtWarning
      );
  end else begin
    inherited;
  end;

end;

procedure TfrmMain.DeactivateFreeOTFEComponent();
begin
  inherited;

  // Let Windows know we accept dropped files or not
  DragAcceptFiles(self.Handle, GetFreeOTFE().Active);

end;

(*
// The array passed in is zero-indexed; populate elements zero to "bytesRequired"
procedure TfrmMain.GenerateOverwriteData(Sender: TObject; passNumber: Integer;
  bytesRequired: Cardinal; var generatedOK: Boolean; var outputBlock: TShredBlock);
var
  i:              Integer;
  tempArraySize:  Cardinal;
  blocksizeBytes: Cardinal;
  plaintext:      Ansistring;
  cyphertext:     Ansistring;
  IV:             Ansistring;
  localIV:        Int64;
  sectorID:       LARGE_INTEGER;
begin
  // Generate an array of random data containing "bytesRequired" bytes of data,
  // plus additional random data to pad out to the nearest multiple of the
  // cypher's blocksize bits
  // Cater for if the blocksize was -ve or zero
  if (ftempCypherDetails.BlockSize < 1) then begin
    blocksizeBytes := 1;
  end else begin
    blocksizeBytes := (ftempCypherDetails.BlockSize div 8);
  end;
  tempArraySize := bytesRequired + (blocksizeBytes - (bytesRequired mod blocksizeBytes));

  // SDUInitAndZeroBuffer(tempArraySize, plaintext);
  plaintext := '';
  for i := 1 to tempArraySize do begin
    plaintext := plaintext + Ansichar(random(256));
    { DONE 2 -otdk -csecurity : This is not secure PRNG - but key is random, so result is CSPRNG -see faq }
  end;


  Inc(ftempCypherEncBlockNo);

  // Adjust the IV so that this block of encrypted pseudorandom data should be
  // reasonably unique
  IV := '';
  // SDUInitAndZeroBuffer(0, IV);
  if (ftempCypherDetails.BlockSize > 0) then begin
    // SDUInitAndZeroBuffer((ftempCypherDetails.BlockSize div 8), IV);
    IV := StringOfChar(AnsiChar(#0), (ftempCypherDetails.BlockSize div 8));

    localIV := ftempCypherEncBlockNo;

    for i := 1 to min(sizeof(localIV), length(IV)) do begin
      IV[i]   := Ansichar((localIV and $FF));
      localIV := localIV shr 8;
    end;

  end;

  // Adjust the sectorID so that this block of encrypted pseudorandom data
  // should be reasonably unique
  sectorID.QuadPart := ftempCypherEncBlockNo;

  // Encrypt the pseudorandom data generated
  if not (GetFreeOTFE().EncryptSectorData(ftempCypherDriver, ftempCypherGUID,
    sectorID, FREEOTFE_v1_DUMMY_SECTOR_SIZE, ftempCypherKey, IV, plaintext, cyphertext))   then begin
    SDUMessageDlg(
      _('Unable to encrypt pseudorandom data before using for overwrite buffer?!') +
      SDUCRLF + SDUCRLF + Format(_('Error #: %d'), [GetFreeOTFE().LastErrorCode]),
      mtError
      );

    generatedOK := False;
  end else begin
    // Copy the encrypted data into the outputBlock
    for i := 0 to (bytesRequired - 1) do
      outputBlock[i] := Byte(cyphertext[i + 1]);

    generatedOK := True;
  end;
end;
        *)

function TfrmMain._PortableModeSet(setTo: TPortableModeAction;
  suppressMsgs: Boolean): Boolean;
begin
  Result := False;

  if not (GetFreeOTFE().CanUserManageDrivers()) then begin
    // On Vista, escalate UAC
    if SDUOSVistaOrLater() then begin
      UACEscalateForPortableMode(setTo, suppressMsgs);
    end else begin
      // On pre-Vista, just let user know they can't do it
      if not (suppressMsgs) then begin
        SDUMessageDlg(
          TEXT_NEED_ADMIN,
          mtWarning,
          [mbOK],
          0
          );
      end;
    end;

  end else begin
    case setTo of
      pmaStart:
      begin
        Result := _PortableModeStart(suppressMsgs);
      end;

      pmaStop:
      begin
        Result := _PortableModeStop(suppressMsgs);
      end;

      pmaToggle:
      begin
        Result := _PortableModeToggle(suppressMsgs);
      end;

    end;

    // In case we UAC escalated (i.e. ran a separate process to handle the
    // drivers), we send out a message to any other running instances of
    // FreeOTFE to refresh
{$IF CompilerVersion >= 18.5}
    //SendMessage(HWND_BROADCAST, GLOBAL_VAR_WM_FREEOTFE_REFRESH, 0, 0);
    PostMessage(HWND_BROADCAST, GLOBAL_VAR_WM_FREEOTFE_REFRESH, 0, 0);
{$ELSE}
    SDUPostMessageExistingApp(GLOBAL_VAR_WM_FREEOTFE_REFRESH, 0, 0);
{$IFEND}
  end;

end;

procedure TfrmMain.GetAllDriversUnderCWD(driverFilenames: TStringList);
const
  // Subdirs which should be searched for drivers
  DRIVERS_SUBDIR_32_BIT = '\x86';
  DRIVERS_SUBDIR_64_BIT = '\amd64';
  DRIVERS_SUBDIR_XP     = '\xp_86';
var
  fileIterator: TSDUFileIterator;
  filename:     String;
  driversDir:   String;
begin
  // Compile a list of drivers in the CWD
  fileIterator := TSDUFileIterator.Create(nil);
  try
    driversDir := ExtractFilePath(Application.ExeName);
    if SDUOS64bit() then begin
      driversDir := driversDir + DRIVERS_SUBDIR_64_BIT;
    end else begin
      if (SDUInstalledOS <= osWindowsXP) then begin
        driversDir := driversDir + DRIVERS_SUBDIR_XP;
      end else begin
        driversDir := driversDir + DRIVERS_SUBDIR_32_BIT;
      end;
    end;

    fileIterator.Directory          := driversDir;
    fileIterator.FileMask           := '*.sys';
    fileIterator.RecurseSubDirs     := False;
    fileIterator.OmitStartDirPrefix := False;
    fileIterator.IncludeDirNames    := False;

    fileIterator.Reset();
    filename := fileIterator.Next();
    while (filename <> '') do begin
      driverFilenames.Add(filename);
      filename := fileIterator.Next();
    end;

  finally
    fileIterator.Free();
  end;
end;

function TfrmMain._PortableModeStart(suppressMsgs: Boolean): Boolean;
var
  driverFilenames: TStringList;
begin
  Result := False;

  driverFilenames := TStringList.Create();
  try
    GetAllDriversUnderCWD(driverFilenames);

    if (driverFilenames.Count < 1) then begin
      if not (suppressMsgs) then begin
        SDUMessageDlg(
          _('Unable to locate any portable LibreCrypt drivers.') + SDUCRLF +
          SDUCRLF + _(
          'Please ensure that the a copy of the LibreCrypt drivers (".sys" files) you wish to use are located in the correct directory.'),
          mtWarning
          );
      end;
    end else begin
      DeactivateFreeOTFEComponent();
      if GetFreeOTFE().PortableStart(driverFilenames, not (suppressMsgs)) then begin
        // Message commented out - it's pointless as user will know anyway because
        // either:
        //   a) They started it, or
        //   b) It's started automatically on FreeOTFE startup - in which case, it's
        //      just annoying
        //        if not(suppressMsgs) then
        //          begin
        //          SDUMessageDlg('Portable mode drivers installed and started.', mtInformation, [mbOK], 0);
        //          end;
        Result := True;
      end else begin
        if not (suppressMsgs) then begin
          SDUMessageDlg(
            _('One or more of your portable LibreCrypt drivers could not be installed/started.') +
            SDUCRLF + SDUCRLF + TEXT_NEED_ADMIN + SDUCRLF + SDUCRLF + _(
            'Please select "File | Drivers..." to check which drivers are currently operating.'),
            mtWarning
            );
        end;
      end;

    end;

  finally
    driverFilenames.Free();
    ActivateFreeOTFEComponent(suppressMsgs);
  end;
end;

function TfrmMain._PortableModeStop(suppressMsgs: Boolean): Boolean;
var
  stopOK: Boolean;
begin
  Result := False;

  // Note that if the component was *not* active, then we can shutdown all
  // portable mode drivers; if we aren't active, this implies the main driver
  // isn't installed/running - in which case we don't need the user to confirm
  // as no drives can be mounted
  stopOK := True;
  if GetFreeOTFE().Active then begin
    if (GetFreeOTFE().CountDrivesMounted() > 0) then begin
      if suppressMsgs then begin
        stopOK := False;
      end else begin
        stopOK := (SDUMessageDlg(_('You have one or more volumes mounted.') +
          SDUCRLF + SDUCRLF + _(
          'If any of the currently mounted volumes makes use of any of the LibreCrypt drivers which are currently in portable mode, stopping portable mode is not advisable.') + SDUCRLF + SDUCRLF + _('It is recommended that you dismount all volumes before stopping portable mode.') + SDUCRLF + SDUCRLF + _('Do you wish to continue stopping portable mode?'), mtWarning, [mbYes, mbNo], 0) = mrYes);
      end;
    end;
  end;


  if stopOK then begin
    DeactivateFreeOTFEComponent();
    if GetFreeOTFE().PortableStop() then begin
      // No point in informing user; they would have been prompted if they
      // wanted to do this, and they can tell they've stopped as the
      // application will just exit; only popping up a messagebox if there's a
      // problem
      if not fIsAppShuttingDown then begin
        if not (suppressMsgs) then begin
          SDUMessageDlg(_('Portable mode drivers stopped and uninstalled.'),
            mtInformation, [mbOK], 0);
        end;
      end;

      Result := True;
    end else begin
      if not (suppressMsgs) then begin
        SDUMessageDlg(
          _('One or more of your portable LibreCrypt drivers could not be stopped/uninstalled.') +
          SDUCRLF + SDUCRLF + TEXT_NEED_ADMIN + SDUCRLF + SDUCRLF + _(
          'Please select "File | Drivers..." to check which drivers are currently operating.'),
          mtWarning
          );
      end;
    end;

    ActivateFreeOTFEComponent(suppressMsgs);
  end;
end;

function TfrmMain._PortableModeToggle(suppressMsgs: Boolean): Boolean;
var
  cntPortable: Integer;
begin
  Result := False;

  cntPortable := GetFreeOTFE().DriversInPortableMode();

  if (cntPortable < 0) then begin
    // We *should* be authorised to do this by the time we get here...
    // Do nothing; Result already set to FALSE
  end else
  if (cntPortable > 0) then begin
    Result := _PortableModeSet(pmaStop, suppressMsgs);
  end else begin
    Result := _PortableModeSet(pmaStart, suppressMsgs);
  end;
end;

procedure TfrmMain.actDismountExecute(Sender: TObject);
begin
  DismountSelected();
end;

procedure TfrmMain.actAboutExecute(Sender: TObject);
var
  dlg: TfrmAbout;
begin
  dlg := TfrmAbout.Create(self);
  try
    dlg.ShowModal();
  finally
    dlg.Free();
  end;
end;

procedure TfrmMain.actConsoleHideExecute(Sender: TObject);
begin
  inherited;
  SDUSystemTrayIcon1.DoMinimizeToIcon();
end;

procedure TfrmMain.actDismountAllExecute(Sender: TObject);
begin
  DismountAll();
end;

procedure TfrmMain.actPropertiesExecute(Sender: TObject);
begin
  DriveProperties();
end;

// Function required for both close and minimize to system tray icon
procedure TfrmMain.actExitExecute(Sender: TObject);
begin
  // Either:
  //   Application.Terminate();
  // Or:
  fendSessionFlag := True;
  Close();
end;


// Function required for both close and minimize to system tray icon
procedure TfrmMain.actConsoleDisplayExecute(Sender: TObject);
begin
  SDUSystemTrayIcon1.DoRestore();
end;


procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  userConfirm:          Word;
  oldActive:            Boolean;
  closingDrivesMounted: Integer;
begin
  CanClose := True;

  closingDrivesMounted := 0;

  // This code segment is required to handle the case when Close() is called
  // programatically
  // Only carry out this action if closing to SystemTrayIcon
  // Note the MainForm test; if it was not the main form, setting Action would
  // in FormClose would do the minimise
  if (not (fendSessionFlag) and GetMainSettings().OptSystemTrayIconDisplay and
    GetMainSettings().OptSystemTrayIconCloseTo and
{$IF CompilerVersion >= 18.5}
    (
    // If Application.MainFormOnTaskbar is set, use the form name,
    // otherwise check exactly
    (Application.MainFormOnTaskbar and (application.mainform <> nil) and
    (application.mainform.Name = self.Name)) or (not (Application.MainFormOnTaskbar) and
    //        (application.mainform = self)
    (application.mainform <> nil) and (application.mainform.Name = self.Name)))
{$ELSE}
    (Application.MainForm = self)
{$IFEND}
    ) then begin
    CanClose := False;
    actConsoleHide.Execute();
  end;

  if (CanClose) then begin
    oldActive := GetFreeOTFE().Active;
    // We (quite reasonably) assume that if the FreeOTFE component is *not*
    // active, and we can't activate it, then no FreeOTFE volumes are mounted
    if not (GetFreeOTFE().Active) then begin
      // Prevent any warnings...
      fIsAppShuttingDown := True;
      ActivateFreeOTFEComponent(False);
      // Reset flag
      fIsAppShuttingDown := False;
    end;

    if (GetFreeOTFE().Active) then begin
      if (GetFreeOTFE().CountDrivesMounted() > 0) then begin
        userConfirm := mrNo;
        if (GetMainSettings().OptOnExitWhenMounted = oewmPromptUser) then begin
          userConfirm := SDUMessageDlg(_('One or more volumes are still mounted.') +
            SDUCRLF + SDUCRLF + _(
            'Do you wish to dismount all volumes before exiting?'),
            mtConfirmation, [mbYes, mbNo, mbCancel], 0);
        end else
        if (GetMainSettings().OptOnExitWhenMounted = oewmDismount) then begin
          userConfirm := mrYes;
        end else // oewmLeaveMounted
        begin
          // Do nothing - userConfirm already set to mrNo
        end;

        if (userConfirm = mrCancel) then begin
          CanClose := False;
        end else
        if (userConfirm = mrYes) then begin
          CanClose := DismountAll();
        end else begin
          // CanClose already set to TRUE; do nothing
        end;

      end;

      closingDrivesMounted := GetFreeOTFE().CountDrivesMounted();
    end;  // if (GetFreeOTFE().Active) then

    if not (oldActive) then begin
      // Prevent any warnings...
      fIsAppShuttingDown := True;
      DeactivateFreeOTFEComponent();
      // Reset flag
      fIsAppShuttingDown := False;
    end;

  end;


  if (CanClose) then begin
    // If there's no drives mounted, and running in portable mode, prompt for
    // portable mode shutdown
    if ((closingDrivesMounted <= 0) and (GetFreeOTFE().DriversInPortableMode() > 0)) then begin
      userConfirm := mrNo;
      if (GetMainSettings().OptOnExitWhenPortableMode = oewpPromptUser) then begin
        userConfirm := SDUMessageDlg(
          _('One or more of the LibreCrypt drivers are running in portable mode.') +
          SDUCRLF + SDUCRLF + _('Do you wish to shutdown portable mode before exiting?'),
          mtConfirmation, [mbYes, mbNo, mbCancel], 0);
      end else
      if (GetMainSettings().OptOnExitWhenPortableMode = owepPortableOff) then begin
        userConfirm := mrYes;
      end else // oewpDoNothing
      begin
        // Do nothing - userConfirm already set to mrNo
      end;

      if (userConfirm = mrCancel) then begin
        CanClose := False;
      end else
      if (userConfirm = mrYes) then begin
        fIsAppShuttingDown := True;
        CanClose           := _PortableModeSet(pmaStop, False);
        fIsAppShuttingDown := CanClose;
      end else begin
        CanClose := True;
      end;

    end;

  end;  // if (CanClose) then

  if CanClose then begin
    ShutdownPKCS11();
    SDUSystemTrayIcon1.Active := False;
    DestroySysTrayIconMenuitems();
    Application.ProcessMessages();
    Application.UnhookMainWindow(MessageHook);
    GetFreeOTFE().Active := False;
  end else begin
    // Reset flag in case user clicked "Cancel" on tany of the above prompts...
    fendSessionFlag := False;
  end;

end;


 // Function required for close to system tray icon
 // Note: This is *only* required in your application is you intend to call
 //       Close() to hide/close the window. Calling Hide() instead is preferable
procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // This code segment is required to handle the case when Close() is called
  // programatically
  // Only carry out this action if closing to SystemTrayIcon
  // Note the MainForm test; if it was the main form, setting Action would have
  // no effect
  if (not (fendSessionFlag) and GetMainSettings().OptSystemTrayIconDisplay and
    GetMainSettings().OptSystemTrayIconCloseTo and
{$IF CompilerVersion >= 18.5}
    (
    // If Application.MainFormOnTaskbar is set, use the form name,
    // otherwise check exactly
    (Application.MainFormOnTaskbar and (application.mainform <> nil) and
    (application.mainform.Name = self.Name)) or (not (Application.MainFormOnTaskbar) and
    //        (application.mainform <> self)
    (application.mainform <> nil) and (application.mainform.Name = self.Name)))
{$ELSE}
    (Application.MainForm <> self)
{$IFEND}
    ) then begin
    Action := caMinimize;
  end;

  // log closed OK
  if Action in [caHide, caFree] then begin
    GetSettings().feAppRunning := arClosed;
    GetSettings().Save(False);
  end;
end;


 // This is used to ensure that only one copy of FreeOTFE is running at any
 // given time
function TfrmMain.MessageHook(var msg: TMessage): Boolean;
var
  hotKeyMsg: TWMHotKey;
begin
  Result := False;

  if (msg.Msg = GLOBAL_VAR_WM_FREEOTFE_RESTORE) then begin
    // Restore application
    actConsoleDisplay.Execute();

    msg.Result := 0;
    Result     := True;
  end else
  if (msg.Msg = GLOBAL_VAR_WM_FREEOTFE_REFRESH) then begin
    actRefreshExecute(nil);
    msg.Result := 0;
    Result     := True;
  end else
  if (msg.Msg = WM_HOTKEY) then begin
    // Hotkey window message handler
    hotKeyMsg := TWMHotKey(msg);

    if GetFreeOTFE().Active then begin
      if (hotKeyMsg.HotKey = HOTKEY_IDENT_DISMOUNT) then begin
        // We'll allow errors in dismount to be reported to the user; it's just
        // a normal dismount
        DismountAll(False);
      end else
      if (hotKeyMsg.HotKey = HOTKEY_IDENT_DISMOUNTEMERG) then begin
        // Panic! The user pressed the emergency dismount hotkey! Better not
        // report any errors to the user
        DismountAll(True);
      end;
    end;

    if ((hotKeyMsg.HotKey = HOTKEY_IDENT_DISMOUNT) or (hotKeyMsg.HotKey =
      HOTKEY_IDENT_DISMOUNTEMERG)) then begin
      msg.Result := 0;
      Result     := True;
    end;

  end;
end;

procedure TfrmMain.miToolsClick(Sender: TObject);
begin
  inherited;

end;

// Cleardown and setup hotkeys
procedure TfrmMain.SetupHotKeys();
begin
  // Don't attempt to setup hotkeys until *after* InitApp(...) is called - this
  // prevents any attempt at registering the hotkeys until FreeOTFE is going to
  // continue running (i.e. it's not just been started with commandline
  // options, and will exit shortly once they've been processed)
  if finitAppCalled then begin
    // Cleardown any existing hotkeys...
    DisableHotkey(HOTKEY_IDENT_DISMOUNT);
    DisableHotkey(HOTKEY_IDENT_DISMOUNTEMERG);

    // ...And setup hotkeys again
    if GetMainSettings().OptHKeyEnableDismount then begin
      EnableHotkey(
        GetMainSettings().OptHKeyKeyDismount,
        HOTKEY_IDENT_DISMOUNT
        );
    end;

    if GetMainSettings().OptHKeyEnableDismountEmerg then begin
      EnableHotkey(
        GetMainSettings().OptHKeyKeyDismountEmerg,
        HOTKEY_IDENT_DISMOUNTEMERG
        );
    end;
  end;

end;

 // Enable the specified shortcut as a hotkey, which will callback using the
 // given identifier
procedure TfrmMain.EnableHotkey(hotKey: TShortCut; hotKeyIdent: Integer);
var
  modifiers:  Integer;
  vk:         Word;
  shiftState: TShiftState;
  toEarlyToDetectOtherInstance: Boolean;
  msg:        String;
  msgType:    TMsgDlgType;
begin
  if (hotkey = TextToShortCut(HOTKEY_TEXT_NONE)) then begin
    DisableHotkey(hotkeyIdent);
  end else begin
    // Obtain the virtual keycode and shiftState
    ShortCutToKey(hotkey, vk, shiftState);

    // Convet TShiftState into a modifier value for RegisterHotKey
    modifiers := 0;
    if (ssCtrl in shiftState) then begin
      modifiers := modifiers or MOD_CONTROL;
    end;
    if (ssAlt in shiftState) then begin
      modifiers := modifiers or MOD_ALT;
    end;
    if (ssShift in shiftState) then begin
      modifiers := modifiers or MOD_SHIFT;
    end;

    DisableHotkey(hotkeyIdent);
    if not (RegisterHotkey(Application.Handle, hotkeyIdent, modifiers, vk)) then begin
      // If FreeOTFE's already running, assume that the other instance has
      // already registered (taken) the hotkey

{$IF CompilerVersion >= 18.5}
      // See SDUGeneral._SDUDetectExistWindowDetails_ThisClassHandle(...)
      //  - if this is set, then SDUDetectExistingApp(...) don't be able to
      // detect any other running instance yet

      // Vista fix for Delphi 2007 and later
      toEarlyToDetectOtherInstance := False;
      if ((Application.Mainform = nil) and // Yes, "=" is correct here
        Application.MainFormOnTaskbar) then begin
        toEarlyToDetectOtherInstance := True;
      end;
{$ELSE}
      toEarlyToDetectOtherInstance := False;
{$IFEND}

      if not (toEarlyToDetectOtherInstance) then begin
        msg     := Format(_('Error: Unable to assign hotkey %s'),
          [ShortCutToText(hotkey)]);
        msgType := mtError;

        // It's not too early to detect other running instances, and there's
        // no other instances detected - so warn user the hotkey couldn't be
        // registered
        //
        // NOTE: THIS IS DEBATABLE - If *this* instance can't registered the
        //       hotkey due to another instance having already registered it,
        //       then the first instance is exited - the user has no hotkey
        //       support. On that basis, the user *should* be warned here -
        //       and the other instance detection should be removed.
        //
        // Because of this, we add a message to the warning if another instance
        // was running
        if (SDUDetectExistingApp() > 0) then begin
          msg     := msg + SDUCRLF + SDUCRLF +
            _('Another instance of LibreCrypt is running - the hotkey may already be assigned to that instance.');
          msgType := mtWarning;
        end;

        SDUMessageDlg(msg, msgType);
      end;
    end;

  end;

end;

// Disable the hotkey with the specifid identifier
procedure TfrmMain.DisableHotkey(hotKeyIdent: Integer);
begin
  UnRegisterHotkey(Application.Handle, hotkeyIdent);
end;

function TfrmMain.IsTestModeOn: Boolean;
var
  s: TStringList;
  r: Cardinal;
begin
  Result := False;
  s      := TStringList.Create();
  try
    r := SDUWinExecAndWaitOutput(SDUGetWindowsDirectory() + '\sysnative\bcdedit.exe',
      s, SDUGetWindowsDirectory());
    if r <> $FFFFFFFF then begin
      Result := s.IndexOf('testsigning             Yes') <> -1;
    end else begin
      SDUMessageDlg(_('Getting Test Mode status failed: ') + SysErrorMessage(GetLastError),
        mtError, [mbOK], 0);
    end;

  finally
    s.Free;
  end;

end;

function TfrmMain.SetTestMode(silent, setOn: Boolean): Boolean;
begin
  inherited;
{
  run bcdedit.exe /set TESTSIGNING ON
  see https://stackoverflow.com/questions/16827229/file-not-found-error-launching-system32-winsat-exe-using-process-start for 'sysnative'
  this will change if built as 64 bit exe  "Alternatively, if you build your program as x64, you can leave the path as c:\windows\system32"
}
  // could also use SDUWow64DisableWow64FsRedirection
  Result := SDUWinExecAndWait32(SDUGetWindowsDirectory() +
    '\sysnative\bcdedit.exe /set TESTSIGNING ' + IfThen(setOn, 'ON', 'OFF'),
    SW_SHOWNORMAL) <> $FFFFFFFF;
  //is this necesary?
  if Result and setOn then
    Result := SDUWinExecAndWait32(SDUGetWindowsDirectory() +
      '\sysnative\bcdedit.exe /set loadoptions DDISABLE_INTEGRITY_CHECKS', SW_SHOWNORMAL) <>
      $FFFFFFFF;
  if Result and not setOn then
    Result := SDUWinExecAndWait32(SDUGetWindowsDirectory() +
      '\sysnative\bcdedit.exe /deletevalue loadoptions', SW_SHOWNORMAL) <> $FFFFFFFF;

  if not silent then begin
    if not Result then begin
      SDUMessageDlg(_('Set Test Mode failed: ') + SysErrorMessage(GetLastError),
        mtError, [mbOK], 0);
    end else begin
      if setOn then
        SDUMessageDlg(_('Please reboot. After rebooting the LibreCrypt drivers may be loaded'),
          mtInformation, [mbOK], 0)
      else
        SDUMessageDlg(_('After rebooting Test Mode will be off'), mtInformation, [mbOK], 0);
    end;
  end;
end;

 //function TfrmMain.SetInstalled(): Boolean;
 //begin
 //  inherited;
 //  //needs to be place to save to
 //  if GetSettings().OptSaveSettings = slNone then
 //    GetSettings().OptSaveSettings := slProfile;//exe not supported in win >NT
 //
 //  GetSettings().OptInstalled := True;
 //  Result                := GetSettings().Save();//todo:needed?
 //end;

procedure TfrmMain.actTestModeOffExecute(Sender: TObject);
var
  SigningOS: Boolean;
begin
  inherited;
  SigningOS := (SDUOSVistaOrLater() and SDUOS64bit());
  if SigningOS then
    SetTestMode(False, False)
  else
    SDUMessageDlg(_('This version of Windows does not support test mode'), mtError, [mbOK], 0);
end;

procedure TfrmMain.actTestModeOnExecute(Sender: TObject);
var
  SigningOS: Boolean;
begin
  inherited;
  SigningOS := (SDUOSVistaOrLater() and SDUOS64bit());
  if SigningOS then
    SetTestMode(False, True)
  else
    SDUMessageDlg(_('There is no need to set test mode on this version of Windows'),
      mtError, [mbOK], 0);
end;

procedure TfrmMain.actTogglePortableModeExecute(Sender: TObject);
begin
  if (actTogglePortableMode.Enabled and (fcountPortableDrivers < 0)) then begin
    _PortableModeSet(pmaToggle, False);
  end else
  if actTogglePortableMode.Checked then
    _PortableModeSet(pmaStop, False)
  else
    _PortableModeSet(pmaStart, False);


  fcountPortableDrivers := GetFreeOTFE().DriversInPortableMode();
  EnableDisableControls();

end;


procedure TfrmMain.lvDrivesSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  EnableDisableControls();

end;

procedure TfrmMain.actFormatExecute(Sender: TObject);
var
  selDrives: DriveLetterString;
  i:         Integer;
begin
  selDrives := GetSelectedDrives();

  for i := 0 to length(selDrives) - 1 do begin

    if not Format_drive(selDrives[i]) then begin
      //error already reported
      //    SDUMessageDlg(FORMAT_ERR, mtError);
      break;
    end;
  end;

  RefreshDrives();
end;

procedure TfrmMain.actOptionsExecute(Sender: TObject);
var
  dlg: TfrmOptions;
begin
  inherited;

  dlg := TfrmOptions.Create(self);
  try
    if (dlg.ShowModal() = mrOk) then begin
      ReloadSettings();
      EnableDisableControls();
    end;

  finally
    dlg.Free();
  end;

end;

procedure TfrmMain.actOverwriteEntireDriveExecute(Sender: TObject);
var
  selectedDrive: DriveLetterString;
  selDrives:     DriveLetterString;
begin
  selDrives := GetSelectedDrives();
  if (length(selDrives) > 1) then begin
    SDUMessageDlg(
      _('Due to the destructive nature of overwriting entire drives, only one drive may be selected when this option is chosen.') + SDUCRLF + SDUCRLF + _('Please ensure that only one mounted drive is selected, and retry.')
      );
  end else begin
    selectedDrive := selDrives[1];

    if SDUWarnYN(_('WARNING!') + SDUCRLF + SDUCRLF + Format(
      _('You are attempting to overwrite drive: %s:'), [selectedDrive]) +
      SDUCRLF + SDUCRLF + Format(
      _('THIS WILL DESTROY ALL INFORMATION STORED ON DRIVE %s:, and require it to be reformatted'),
      [selectedDrive]) + SDUCRLF + SDUCRLF +
      _('Are you ABSOLUTELY SURE you want to do this?'))
    then begin
      OverwriteDrives(selectedDrive, True);
    end;
  end;
end;


procedure TfrmMain.actOverwriteFreeSpaceExecute(Sender: TObject);
var
  selDrives: DriveLetterString;
begin
  selDrives := GetSelectedDrives();
  OverwriteDrives(selDrives, False);
end;

 // overwriteEntireDrive - Set to TRUE to overwrite the entire drive; this will
 //                        destroy all data on the drive, and requiring it to be
 //                        reformatted. Set to FALSE to simply overwrite the
 //                        free space on the drive
procedure TfrmMain.OverwriteDrives(drives: DriveLetterString;
  overwriteEntireDrive: Boolean);
var
  shredder:             TShredder;
  i:                    Integer;
  currDrive:            DriveLetterChar;
  frmOverWriteMethod:   TfrmSelectOverwriteMethod;
  overwriteWithEncryptedData: Boolean;
  allOK:                Boolean;
  getRandomBits:        Integer;
  randomBuffer:         array of Byte;
  overwriteOK:          TShredResult;
  currDriveDevice:      String;
  failMsg:              String;
  MouseRNGDialog1:      TMouseRNGDialog;
  chaff_cypher_key:     TSDUBytes;
  chaff_cypher_driver:  Ansistring;
  chaff_cypher_GUID:    TGUID;
  chaff_cypher_details: TFreeOTFECypher_v3;
begin
  overwriteOK := srSuccess;
  allOK       := False;
  overwriteWithEncryptedData := False;
  shredder    := TShredder.Create();
  try

    frmOverWriteMethod := TfrmSelectOverwriteMethod.Create(self);
    try
      frmOverWriteMethod.OTFEFreeOTFEObj := GetFreeOTFE();
      if (frmOverWriteMethod.ShowModal() = mrOk) then begin
        allOK := True;

        overwriteWithEncryptedData := frmOverWriteMethod.OverwriteWithEncryptedData;
        if (overwriteWithEncryptedData) then begin
          chaff_cypher_driver := frmOverWriteMethod.CypherDriver;
          chaff_cypher_GUID   := frmOverWriteMethod.CypherGUID;

          GetFreeOTFE().GetSpecificCypherDetails(chaff_cypher_driver, chaff_cypher_GUID,
            chaff_cypher_details);

          // Initilize zeroed IV for encryption
          //        ftempCypherEncBlockNo := 0;

          // Get *real* random data for encryption key
          getRandomBits := 0;
          if (chaff_cypher_details.KeySizeRequired < 0) then begin
            // -ve keysize = arbitary keysize supported - just use 512 bits
            getRandomBits := 512;
          end else
          if (chaff_cypher_details.KeySizeRequired > 0) then begin
            // +ve keysize = specific keysize - get sufficient bits
            getRandomBits := chaff_cypher_details.KeySizeRequired;
          end;

          MouseRNGDialog1 := TMouseRNGDialog.Create();
          try


            { TODO 1 -otdk -cenhance : use cryptoapi etc if avail }
            if (getRandomBits > 0) then begin
              MouseRNGDialog1.RequiredBits := getRandomBits;
              allOK := MouseRNGDialog1.Execute();
            end;

            if (allOK) then begin
              SetLength(randomBuffer, (getRandomBits div 8));
              MouseRNGDialog1.RandomData(getRandomBits, randomBuffer);

              for i := low(randomBuffer) to high(randomBuffer) do begin
                SDUAddByte(chaff_cypher_key, randomBuffer[i]);
                // Overwrite the temp buffer...
                randomBuffer[i] := random(256);
              end;
              SetLength(randomBuffer, 0);
            end;

          finally
            MouseRNGDialog1.Free;
          end;
        end;

      end;

    finally
      frmOverWriteMethod.Free();
    end;



    if (allOK) then begin
      if SDUConfirmYN(_('Overwriting on a large container may take a while.') +
        SDUCRLF + SDUCRLF + _('Are you sure you wish to proceed?')) then begin

        shredder.IntMethod := smPseudorandom;
        shredder.IntPasses := 1;

        if overwriteWithEncryptedData then begin
          // Note: Setting this event overrides shredder.IntMethod
          shredder.OnTweakEncryptDataEvent  := GetFreeOTFEBase().EncryptSectorData;
          shredder.OverwriteCypherBlockSize := chaff_cypher_details.BlockSize;
          shredder.TempCypherKey            := chaff_cypher_key;
          shredder.TempCypherDriver         := chaff_cypher_driver;
          shredder.tempCypherGUID           := chaff_cypher_GUID;

          //          shredder.OnOverwriteDataReq := GenerateOverwriteData;
        end else begin
          shredder.OnTweakEncryptDataEvent := nil;
        end;

        for i := 1 to length(drives) do begin
          currDrive := drives[i];

          if overwriteEntireDrive then begin
            currDriveDevice := '\\.\' + currDrive + ':';
            shredder.DestroyDevice(currDriveDevice, False, False);
            overwriteOK := shredder.LastIntShredResult;
          end else begin
            overwriteOK := shredder.OverwriteDriveFreeSpace(currDrive, False);
          end;

        end;

        if (overwriteOK = srSuccess) then begin
          SDUMessageDlg(_('Overwrite operation complete.'), mtInformation);
          if overwriteEntireDrive then begin
            SDUMessageDlg(_(
              'Please reformat the drive just overwritten before attempting to use it.'),
              mtInformation);
          end;
        end else
        if (overwriteOK = srError) then begin
          failMsg := _('Overwrite operation FAILED.');
          if not (overwriteEntireDrive) then begin
            failMsg := failMsg + SDUCRLF + SDUCRLF +
              _('Did you remember to format this drive first?');
          end;

          SDUMessageDlg(failMsg, mtError);
        end else
        if (overwriteOK = srUserCancel) then begin
          SDUMessageDlg(_('Overwrite operation cancelled by user.'), mtInformation);
        end else begin
          SDUMessageDlg(_('No drives selected to overwrite?'), mtInformation);
        end;

      end;  // if (SDUMessageDlg(
    end;  // if (allOK) then
  finally
    shredder.Free();
  end;
  //  ftempCypherDriver := '';
  chaff_cypher_GUID := StringToGUID('{00000000-0000-0000-0000-000000000000}');
  SDUZeroBuffer(chaff_cypher_key);
  //  ftempCypherKey        := '';
  //  ftempCypherEncBlockNo := 0;

end;

procedure TfrmMain.tbbTogglePortableModeMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // This is ugly, but required since if the button is clicked on, and the
  // operation cancelled, the button pops up - even though it shouldn't!
  tbbTogglePortableMode.down := (fcountPortableDrivers > 0);
end;


 // Handle "/portable" command line
 // Returns: Exit code
function TfrmMain.HandleCommandLineOpts_Portable(): eCmdLine_Exit;

begin
  Result := ceSUCCESS;
  if GetCmdLine.PortableArg <> '' then begin

    if (GetCmdLine.PortableArg = CMDLINE_TOGGLE) then begin
      if not _PortableModeSet(pmaToggle, GetCmdLine.IsSilent) then
        Result := ceUNABLE_TO_START_PORTABLE_MODE;
    end else begin
      if ((GetCmdLine.PortableArg = CMDLINE_START) or (GetCmdLine.PortableArg = CMDLINE_ON) or
        (GetCmdLine.PortableArg = '1')) then begin
        if not _PortableModeSet(pmaStart, GetCmdLine.IsSilent) then
          Result := ceUNABLE_TO_START_PORTABLE_MODE;
      end else begin
        if ((GetCmdLine.PortableArg = CMDLINE_STOP) or (GetCmdLine.PortableArg = CMDLINE_OFF) or
          (GetCmdLine.PortableArg = '0')) then begin
          if not _PortableModeSet(pmaStop, GetCmdLine.IsSilent) then
            Result := ceUNABLE_TO_STOP_PORTABLE_MODE;
        end else begin
          Result := ceINVALID_CMDLINE;  // no recognised arg.
        end;
      end;
    end;

  end;
end;



 // install all drivers
 //
 // !! IMPORTANT !!
 // NOTICE: THIS DOES NOT CARRY OUT ANY UAC ESCALATION!
 //         User should use "runas LibreCrypt.exe ..." if UAC escalation
 //         required
 // !! IMPORTANT !!
 //
 // Returns: exit code
function TfrmMain.InstallAllDrivers(driverControlObj: TDriverControl;
  silent: Boolean): eCmdLine_Exit;
var
  driverFilenames: TStringList;
begin

  try

    Result := ceUNKNOWN_ERROR;

    if not IsTestModeOn then begin
      SDUMessageDlg(
        _('The LibreCrypt drivers canot be installed as ''Test Mode'' is not enabled, please see the documentation on manually enabling Windows Test Mode.'),
        mtError
        );
    end else begin

      driverFilenames := TStringList.Create();
      try
        GetAllDriversUnderCWD(driverFilenames);

        if (driverFilenames.Count <= 0) then begin
          Result := ceFILE_NOT_FOUND;
        end else begin
          Result := ceSUCCESS;
       {
          from delphi 7 project:"If under Vista x64, don't autostart the drivers after
          installing - this could cause a bunch of *bloody* *stupid*
          warning messages about "unsigned drivers" to be displayed by
          the OS"

          apparently on vista is not necesary to set test mode - but need to start drivers on os start.
          test mode is set anyway for all OS's so start drivers now whatever

      //          vista64Bit := (SDUOSVistaOrLater() and SDUOS64bit());
       }
          if driverControlObj.InstallMultipleDrivers(driverFilenames, False,
            not silent, True// not(vista64Bit)
            ) then begin
            { from delphi 7 project:"If Vista x64, we tell the user to reboot. That way, the drivers
             will be started up on boot - and the user won't actually see
             any stupid warning messages about "unsigned drivers" "
            }
            if (
              // vista64Bit and
              not (silent)) then begin
              SDUMessageDlg(
                _('LibreCrypt drivers have been installed successfully.'),
                mtInformation
                );
            end;
          end else begin
            Result := ceUNKNOWN_ERROR;
          end;
        end;

      finally
        driverFilenames.Free();
      end;
    end;

  except
    on EFreeOTFENeedAdminPrivs do begin
      Result := ceADMIN_PRIVS_NEEDED;
    end;
  end;
end;

 // Handle "/install" command line
 //
 // !! IMPORTANT !!
 // NOTICE: THIS DOES NOT CARRY OUT ANY UAC ESCALATION!
 //         User should use "runas LibreCrypt.exe ..." if UAC escalation
 //         required
 // !! IMPORTANT !!
 //
 // Returns: Exit code
function TfrmMain.HandleCommandLineOpts_DriverControl_Install(
  driverControlObj: TDriverControl): eCmdLine_Exit;
var
  //  paramValue:            String;
  driverPathAndFilename: String;
  silent:                Boolean;
  //  vista64Bit: boolean;
begin
  Result := ceINVALID_CMDLINE;

  if GetCmdLine.FilenameArg <> '' then begin
    silent := GetCmdLine.IsSilent;

    if GetCmdLine.FilenameArg = CMDLINE_ALL then begin
      Result := InstallAllDrivers(driverControlObj, silent);
    end else begin
      // Convert any relative path to absolute
      driverPathAndFilename := SDURelativePathToAbsolute(GetCmdLine.FilenameArg);

      // Ensure driver file actually exists(!)
      if not (fileexists(driverPathAndFilename)) then begin
        Result := ceFILE_NOT_FOUND;
      end else begin
        Result := ceUNKNOWN_ERROR;
        if driverControlObj.InstallSetAutoStartAndStartDriver(GetCmdLine.FilenameArg) then begin
          Result := ceSUCCESS;
        end;
      end;
    end;
  end;

end;


 // Handle "/uninstall" command line
 //
 // !! IMPORTANT !!
 // NOTICE: THIS DOES NOT CARRY OUT ANY UAC ESCALATION!
 //         User should use "runas LibreCrypt.exe ..." if UAC escalation
 //         required
 // !! IMPORTANT !!
 //
 // Returns: Exit code
function TfrmMain.HandleCommandLineOpts_DriverControl_Uninstall(
  driverControlObj: TDriverControl): eCmdLine_Exit;
var
  //  paramValue:           String;
  driveUninstallResult: DWORD;
  //    vista64Bit: boolean;
begin
  Result := ceINVALID_CMDLINE;

  if GetCmdLine.driverNameArg <> '' then begin
    Result := ceUNKNOWN_ERROR;
    if GetCmdLine.driverNameArg = CMDLINE_ALL then begin
      Result := ceSUCCESS;
      //      vista64Bit := (SDUOSVistaOrLater() and SDUOS64bit());
      // set test mode off
      // if vista64Bit then if not SetTestMode(true,false) then result := ceUNKNOWN_ERROR;

      if not driverControlObj.UninstallAllDrivers(False) then begin
        Result := ceUNKNOWN_ERROR;
      end;
    end else begin
      driveUninstallResult := driverControlObj.UninstallDriver(GetCmdLine.driverNameArg);

      if ((driveUninstallResult and DRIVER_BIT_SUCCESS) = DRIVER_BIT_SUCCESS) then begin
        Result := ceSUCCESS;
      end;
    end;

  end;

end;


// Returns: Exit code
function TfrmMain.HandleCommandLineOpts_DriverControl_GUI(): eCmdLine_Exit;
begin
  actDriversExecute(nil);
  Result := ceSUCCESS;
end;

function TfrmMain.HandleCommandLineOpts_DriverControl(): eCmdLine_Exit;
var
  //  paramValue:       String;
  driverControlObj: TDriverControl;
begin
  Result := ceSUCCESS;
  try
    if GetCmdLine.driverControlArg <> '' then begin
      Result := ceINVALID_CMDLINE;
      // Special case; this one can UAC escalate
      if GetCmdLine.driverControlArg = CMDLINE_GUI then begin
        Result := HandleCommandLineOpts_DriverControl_GUI();
      end else begin
        // Creating this object needs admin privs; if the user doesn't have
        // these, it'll raise an exception
        driverControlObj := TDriverControl.Create();
        try
          driverControlObj.Silent := GetCmdLine.IsSilent;

          if GetCmdLine.driverControlArg = CMDLINE_COUNT then begin
            Result := eCmdLine_Exit(HandleCommandLineOpts_DriverControl_Count(driverControlObj));
          end else
          if GetCmdLine.driverControlArg = CMDLINE_INSTALL then begin
            Result := HandleCommandLineOpts_DriverControl_Install(driverControlObj);
          end else
          if GetCmdLine.driverControlArg = CMDLINE_UNINSTALL then begin
            Result := HandleCommandLineOpts_DriverControl_Uninstall(driverControlObj);
          end;

        finally
          driverControlObj.Free();
        end;
      end;

    end;

  except
    on E: EFreeOTFENeedAdminPrivs do begin
      Result := ceADMIN_PRIVS_NEEDED;
    end;
  end;

end;


 // Handle "/install" command line
 // Returns: Exit code
function TfrmMain.HandleCommandLineOpts_DriverControl_Count(
  driverControlObj: TDriverControl): Integer;
  //var
  //  paramValue: String;
begin
  Result := Integer(ceINVALID_CMDLINE);

  // If "/type" not specified, default to the total
  if (GetCmdLine.typeArg = '') or (GetCmdLine.typeArg = CMDLINE_TOTAL) then begin
    Result := driverControlObj.CountDrivers();
  end else
  if GetCmdLine.typeArg = CMDLINE_DRIVERSPORTABLE then begin
    Result := driverControlObj.CountDrivers(True);
  end else
  if GetCmdLine.typeArg = CMDLINE_DRIVERSINSTALLED then begin
    Result := driverControlObj.CountDrivers(False);
  end;
end;


 // Handle "/count" command line
 // Returns: Exit code
function TfrmMain.HandleCommandLineOpts_Count(): eCmdLine_Exit;
begin
  Result := ceSUCCESS;

  if GetCmdLine.IsCount then begin
    if not (EnsureOTFEComponentActive) then
      Result := ceUNABLE_TO_CONNECT
    else
      Result := eCmdLine_Exit(GetFreeOTFE().CountDrivesMounted());
  end;
end;

{ Handle "/settestmode" command line
 // Returns: Exit code
 // call if  CMDLINE_SET_TESTMODE is set or not - does check itself
 }
function TfrmMain.HandleCommandLineOpts_SetTestMode(): eCmdLine_Exit;
var
  setOn:             Boolean;
  SigningOS, silent: Boolean;
  //  paramValue:        String;
begin
  Result := ceSUCCESS;
  if GetCmdLine.setTestmodeArg <> '' then begin

    setOn := False;
    if GetCmdLine.setTestmodeArg = CMDLINE_ON then
      setOn := True
    else
    if GetCmdLine.setTestmodeArg <> CMDLINE_OFF then begin
      Result := ceINVALID_CMDLINE;
    end else begin
      SigningOS := (SDUOSVistaOrLater() and SDUOS64bit());
      silent    := GetCmdLine.IsSilent;
      if SigningOS then begin
        if not SetTestMode(silent, setOn) then
          Result := ceUNABLE_TO_SET_TESTMODE;
      end else begin
        if not silent then
          SDUMessageDlg(_('This version of Windows does not support test mode'),
            mtError, [mbOK], 0);
      end;
    end;
  end;
end;


{ Handle "/SetInstalled" command
 // Returns: Exit code

 }
 //function TfrmMain.HandleCommandLineOpts_SetInstalled(): eCmdLine_Exit;
 //begin
 //  Result := ceSUCCESS;
 //
 //  if SDUCommandLineSwitch(CMDLINE_SET_INSTALLED) then begin
 //
 //    if not SetInstalled() then
 //      Result := ceUNABLE_TO_SET_INSTALLED;
 //  end;
 //end;

 // Handle "/create" command line
 // Returns: Exit code
function TfrmMain.HandleCommandLineOpts_Create(): eCmdLine_Exit;
begin
  Result := ceSUCCESS;

  if GetCmdLine.IsCreate then begin
    if not (EnsureOTFEComponentActive) then
      Result := ceUNABLE_TO_CONNECT
    else
    if not CreateFreeOTFEVolume(False) then
      Result := ceUNKNOWN_ERROR;
  end;
end;


 // Handle "/unmount" command line
 // Returns: Exit code
function TfrmMain.HandleCommandLineOpts_Dismount(): eCmdLine_Exit;
var
  //  paramValue: String;
  force:      Boolean;
  drive:      Char;
  dismountOK: Boolean;
begin
  Result := ceSUCCESS;

  if GetCmdLine.dismountArg <> '' then begin
    if not (EnsureOTFEComponentActive) then
      Result := ceUNABLE_TO_CONNECT
    else begin
      force := GetCmdLine.IsForce;

      if GetCmdLine.dismountArg = CMDLINE_ALL then begin
        dismountOK := (GetFreeOTFE().DismountAll(force) = '');
      end else begin
        // Only use the 1st char...
        drive := GetCmdLine.dismountArg[1];

        dismountOK := GetFreeOTFE().Dismount(drive, force);
      end;

      if not dismountOK then begin
        Result := ceUNABLE_TO_DISMOUNT;
      end;
    end;
  end;

end;

// Handle any command line options; returns 
function TfrmMain.HandleCommandLineOpts(): eCmdLine_Exit;
begin
  Result := ceSUCCESS;

  fallowUACEscalation := not (GetCmdLine.IsNoUacEscalate);
  // done: a lot of repetition here bc HandleCommandLineOpts_ fns also call  SDUCommandLineParameter
  //done -otdk: 'else' statements mean one cmd per call - allow compatible ones at same time

  //these cmds at least  are independent of others

  Result := HandleCommandLineOpts_SetTestMode();

  if Result = ceSUCCESS then
    Result := HandleCommandLineOpts_EnableDevMenu();
  //
  //  if result = ceSUCCESS then
  //    result := HandleCommandLineOpts_SetInstalled();

  // Driver control dialog
  if Result = ceSUCCESS then
    Result := HandleCommandLineOpts_DriverControl();

  // Portable mode on/off...
  if Result = ceSUCCESS then
    Result := HandleCommandLineOpts_Portable();

  // All command line options below require FreeOTFE to be active before they
  // can be used

  if Result = ceSUCCESS then
    Result := HandleCommandLineOpts_Count();
  if Result = ceSUCCESS then
    Result := HandleCommandLineOpts_Create();
  if Result = ceSUCCESS then
    Result := HandleCommandLineOpts_Mount();
  if Result = ceSUCCESS then
    Result := HandleCommandLineOpts_Dismount();

  if Result = ceSUCCESS then
    Result := HandleCommandLineOpts_DumpLUKSHdr();

  if GetFreeOTFE().Active then
    DeactivateFreeOTFEComponent();

  if Result = ceADMIN_PRIVS_NEEDED then
    MessageDlg(_('Administrator privileges are needed. Please run again as administrator'),
      mtError, [mbOK], 0);
  // Notice: CMDLINE_MINIMIZE handled in the .dpr

end;

procedure TfrmMain.UACEscalateForDriverInstallation();
begin
  UACEscalate(CMDLINE_SWITCH_IND + CMDLINE_DRIVERCONTROL + ' ' + CMDLINE_GUI, False);
end;

procedure TfrmMain.UACEscalateForPortableMode(portableAction: TPortableModeAction;
  suppressMsgs: Boolean);
var
  cmdLinePortableSwitch: String;
begin
  case portableAction of
    pmaStart:
    begin
      cmdLinePortableSwitch := CMDLINE_START;
    end;

    pmaStop:
    begin
      cmdLinePortableSwitch := CMDLINE_STOP;
    end;

    pmaToggle:
    begin
      cmdLinePortableSwitch := CMDLINE_TOGGLE;
    end;

  end;

  UACEscalate(CMDLINE_SWITCH_IND + CMDLINE_PORTABLE + ' ' + cmdLinePortableSwitch,
    suppressMsgs);
end;

procedure TfrmMain.UACEscalate(cmdLineParams: String; suppressMsgs: Boolean);
const
  VERB_RUNAS = 'runas';
var
  filenameAndPath: String;
  errMsg:          String;
begin
  // Only applicable in Windows Vista; simply warn user they can't continue on
  // earlier OSs
  if (not (SDUOSVistaOrLater()) or not (fallowUACEscalation)) then begin
    if not suppressMsgs then
      SDUMessageDlg(TEXT_NEED_ADMIN, mtError, [mbOK], 0);
  end else begin
    // Prevent endless loops of UAC escalation...
    cmdLineParams := CMDLINE_SWITCH_IND + CMDLINE_NOUACESCALATE + ' ' + cmdLineParams;

    // Message supression
    if suppressMsgs then begin
      cmdLineParams := CMDLINE_SWITCH_IND + CMDLINE_SILENT + ' ' + cmdLineParams;
    end;

    filenameAndPath := ParamStr(0);
    if not UACRun(filenameAndPath, cmdLineParams, suppressMsgs, fallowUACEscalation, errMsg) then
      SDUMessageDlg(errMsg, TMsgDlgType.mtError);

    // The UAC escalation/reexecution of FreeOTFE as UAC may have changed the
    // drivers installed/running; flush any caches in the FreeOTFE object
    GetFreeOTFE().CachesFlush();
  end;
end;

procedure TfrmMain.PKCS11TokenRemoved(SlotID: Integer);
var
  i:                Integer;
  volumeInfo:       TOTFEFreeOTFEVolumeInfo;
  drivesToDismount: DriveLetterString;
  mounted:          DriveLetterString;
begin
  SetStatusBarText(Format(_('Detected removal of token from slot ID: %u'), [SlotID]));
  if GetSettings().OptPKCS11AutoDismount then begin
    drivesToDismount := '';
    mounted          := GetFreeOTFE().DrivesMounted();
    for i := 1 to length(mounted) do begin
      // ...Main FreeOTFE window list...
      if GetFreeOTFE().GetVolumeInfo(mounted[i], volumeInfo) then begin
        if volumeInfo.MetaDataStructValid then begin
          if (volumeInfo.MetaDataStruct.PKCS11SlotID = SlotID) then begin
            drivesToDismount := drivesToDismount + mounted[i];
          end;
        end;
      end;
    end;

    SetStatusBarText(Format(_('Autodismounting drives: %s'),
      [PrettyPrintDriveLetters(drivesToDismount)]));
    DismountDrives(drivesToDismount, False);
  end;

end;


function TfrmMain.GetSelectedDrives(): DriveLetterString;
var
  i: Integer;
begin
  Result := '';

  for i := 0 to (lvDrives.items.Count - 1) do begin
    if lvDrives.Items[i].Selected then begin
      Result := Result + GetDriveLetterFromLVItem(lvDrives.Items[i]);
    end;
  end;
end;


procedure TfrmMain.actFreeOTFEMountPartitionExecute(Sender: TObject);
var
  selectedPartition: String;
begin
  if GetFreeOTFE().WarnIfNoHashOrCypherDrivers() then begin
    selectedPartition := frmSelectPartition.SelectPartition();

    if (selectedPartition <> '') then begin
      _MountFilesDetectLUKS(
        selectedPartition,
        False,
        vtFreeOTFE
        );
    end;
  end;

end;

procedure TfrmMain.actFreeOTFENewHiddenExecute(Sender: TObject);
begin
  inherited;
  _PromptCreateFreeOTFEVolume(True);
end;

procedure TfrmMain.actFreeOTFENewNotHiddenExecute(Sender: TObject);
begin
  inherited;
  _PromptCreateFreeOTFEVolume(False);
end;

procedure TfrmMain._PromptCreateFreeOTFEVolume(isHidden: Boolean);
var
  prevMounted:      DriveLetterString;
  newMounted:       DriveLetterString;
  createdMountedAs: DriveLetterString;
  msg:              WideString;
  i:                Integer;
begin
  inherited;

  prevMounted := GetFreeOTFE().DrivesMounted;
  if not CreateFreeOTFEVolume(isHidden) then begin
    if (GetFreeOTFE().LastErrorCode <> OTFE_ERR_USER_CANCEL) then begin
      SDUMessageDlg(_('LibreCrypt container could not be created'), mtError);
    end;
  end else begin
    newMounted := GetFreeOTFE().DrivesMounted;

    // If the "drive letters" mounted have changed, the new volume was
    // automatically mounted; setup for this
    if (newMounted = prevMounted) then begin
      msg := _('LibreCrypt container created successfully.') + SDUCRLF +
        SDUCRLF + _('Please open and format this container''s free space before use.');
    end else begin
      // Get new drive on display...
      RefreshDrives();

      createdMountedAs := '';
      for i := 1 to length(newMounted) do begin
        if (Pos(newMounted[i], prevMounted) = 0) then begin
          if (createdMountedAs <> '') then begin
            // If the user mounted another volume during volume creation, we
            // can't tell from here which was the new volume
            createdMountedAs := createdMountedAs + ' / ';
          end;

          createdMountedAs := createdMountedAs + newMounted[i] + ':';
        end;
      end;

      msg := Format(_('LibreCrypt container created successfully and opened as: %s.'),
        [createdMountedAs]);
    end;

    SDUMessageDlg(msg, mtInformation);
  end;

end;


procedure TfrmMain.actLUKSNewExecute(Sender: TObject);
var
  //  prevMounted:    DriveLetterString;
  //  newMounted:       DriveLetterString;
  //  createdMountedAs: DriveLetterString;
  //  msg:            String;
  //  i:                Integer;
  //  allOK:          Boolean;
  //  fileName:       String;
  //  drive:          DriveLetterChar;
  //  refresh_drives: Boolean;
  // hashDispTitles , hashKernelModeDriverNames,  hashGUIDs :tstringList;
  user_canceled: Boolean;

begin
  inherited;

  if not (frmCreateLUKSVolumeWizard.CreateLUKSVolume(user_canceled)) then begin
    if not user_canceled then
      SDUMessageDlg(_('LUKS container could not be created'), mtError);

  end else begin

    // If the "drive letters" mounted have changed, the new volume was
    // automatically mounted; setup for this
    // Get new drive on display...
    RefreshDrives();

    SDUMessageDlg(_('LUKS container created successfully and opened.'), mtInformation);
  end;


  //  fileName := ExpandFileName(ExtractFileDir(Application.ExeName) + '\..\..\..\..\test_vols\') +
  //    'luks.new.vol';
  //  SysUtils.DeleteFile(fileName);


  //
  //  allOK := CreateNewLUKS(fileName, 'password', 4 * 1024 * 1024, 'SHA256', msg, drive,refresh_drives);
  //  if refresh_drives then RefreshDrives;

  //
  //  if allOK then
  //    SDUMessageDlg(msg, mtInformation)
  //  else
  //    SDUMessageDlg(msg, mtError);

end;

procedure TfrmMain.actInstallExecute(Sender: TObject);
begin
  inherited;
  //escalate priv and run all
  UACEscalate('/' + CMDLINE_DRIVERCONTROL + ' ' + CMDLINE_INSTALL + ' /' +
    CMDLINE_FILENAME + ' ' + CMDLINE_ALL, GetCmdLine.IsSilent);
end;

{ TODO 1 -otdk -ccomplete : add similar for plain dmcrypt }
procedure TfrmMain.actLinuxMountPartitionExecute(Sender: TObject);
var
  selectedPartition: String;
begin
  if GetFreeOTFE().WarnIfNoHashOrCypherDrivers() then begin
    selectedPartition := frmSelectPartition.SelectPartition();

    if (selectedPartition <> '') then begin
      _MountFile(vtLUKS, selectedPartition, False, False, False);
    end;

  end;

end;



end.
