#!/bin/bash

systempath=$1
thispath=`cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd`

rm -rf $1/app/cit
rm -rf $1/app/MiuiCompass
rm -rf $1/app/MiuiScreenRecorder
rm -rf $1/app/MiuiVideoGlobal
rm -rf $1/app/Notes
rm -rf $1/app/PaymentService
rm -rf $1/app/Calculator
rm -rf $1/priv-app/Backup
rm -rf $1/priv-app/Browser
rm -rf $1/priv-app/Calendar
rm -rf $1/priv-app/CleanMaster
rm -rf $1/priv-app/MiRecycle
rm -rf $1/priv-app/MiuiScanner
rm -rf $1/priv-app/MiWebView
rm -rf $1/priv-app/Updater
rm -rf $1/priv-app/Velvet
rm -rf $1/priv-app/Weather
rm -rf $1/priv-app/WeatherProvider

# add more apps to debloat

rm -rf $1/app/VoiceAssist
rm -rf $1/app/MiRadio
rm -rf $1/app/Mipay
rm -rf $1/app/NexyPay
rm -rf $1/app/com.miui.qr
rm -rf $1/app/FM
rm -rf $1/app/MiuiBugReport
rm -rf $1/priv-app/MiuiVideo
rm -rf $1/priv-app/MiuiCamera
rm -rf $1/priv-app/MiService
rm -rf $1/app/AnalyticsCore
rm -rf $1/app/BasicDreams
rm -rf $1/app/BugReport
rm -rf $1/app/Drive
rm -rf $1/app/Duo
rm -rf $1/app/FM
rm -rf $1/app/FileExplorer_old
rm -rf $1/app/Gmail2
rm -rf $1/app/HybridAccessory
rm -rf $1/app/HybridPlatform
rm -rf $1/app/IdMipay
rm -rf $1/app/InMipay
rm -rf $1/app/MSA-Global
rm -rf $1/app/Maps
rm -rf $1/app/MiPicks
rm -rf $1/app/MiuiAudioMonitor
rm -rf $1/app/MiuiVideoPlayer
rm -rf $1/app/Music2
rm -rf $1/app/Photos
rm -rf $1/app/SystemAppUpdater
rm -rf $1/app/TranslationService
rm -rf $1/app/Videos
rm -rf $1/app/YouDaoEngine
rm -rf $1/app/YouTube
rm -rf $1/app/facebook-appmanager
rm -rf $1/app/talkback
rm -rf $1/priv-app/GameBoosterGlobal
rm -rf $1/priv-app/GameCenterGlobal
rm -rf $1/priv-app/GlobalUserGuide
rm -rf $1/priv-app/MiDrop
rm -rf $1/priv-app/MiuiCamera
rm -rf $1/priv-app/MiuiScanner
rm -rf $1/priv-app/Music
rm -rf $1/priv-app/SoundRecorder
rm -rf $1/priv-app/Turbo
rm -rf $1/priv-app/Weather
rm -rf $1/priv-app/YellowPage
rm -rf $1/priv-app/facebook-installer
rm -rf $1/priv-app/facebook-services
rm -rf $1/app/Lens

rm -rf $1/product/app/VoiceAssist
rm -rf $1/product/app/MiRadio
rm -rf $1/product/app/Mipay
rm -rf $1/product/app/NexyPay
rm -rf $1/product/app/com.miui.qr
rm -rf $1/product/app/FM
rm -rf $1/product/app/MiuiBugReport
rm -rf $1/product/priv-app/MiuiVideo
rm -rf $1/product/priv-app/MiuiCamera
rm -rf $1/product/priv-app/MiService
rm -rf $1/product/app/AnalyticsCore
rm -rf $1/product/app/BasicDreams
rm -rf $1/product/app/BugReport
rm -rf $1/product/app/Drive
rm -rf $1/product/app/Duo
rm -rf $1/product/app/FM
rm -rf $1/product/app/FileExplorer_old
rm -rf $1/product/app/Gmail2
rm -rf $1/product/app/HybridAccessory
rm -rf $1/product/app/HybridPlatform
rm -rf $1/product/app/IdMipay
rm -rf $1/product/app/InMipay
rm -rf $1/product/app/MSA-Global
rm -rf $1/product/app/Maps
rm -rf $1/product/app/MiPicks
rm -rf $1/product/app/MiuiAudioMonitor
rm -rf $1/product/app/MiuiVideoPlayer
rm -rf $1/product/app/Music2
rm -rf $1/product/app/Photos
rm -rf $1/product/app/SystemAppUpdater
rm -rf $1/product/app/TranslationService
rm -rf $1/product/app/Videos
rm -rf $1/product/app/YouDaoEngine
rm -rf $1/product/app/YouTube
rm -rf $1/product/app/facebook-appmanager
rm -rf $1/product/app/talkback
rm -rf $1/product/priv-app/GameBoosterGlobal
rm -rf $1/product/priv-app/GameCenterGlobal
rm -rf $1/product/priv-app/GlobalUserGuide
rm -rf $1/product/priv-app/MiDrop
rm -rf $1/product/priv-app/MiuiCamera
rm -rf $1/product/priv-app/MiuiScanner
rm -rf $1/product/priv-app/Music
rm -rf $1/product/priv-app/SoundRecorder
rm -rf $1/product/priv-app/Turbo
rm -rf $1/product/priv-app/Weather
rm -rf $1/product/priv-app/YellowPage
rm -rf $1/product/priv-app/facebook-installer
rm -rf $1/product/priv-app/facebook-services
rm -rf $1/product/app/Lens

rm -rf $1/data-app/*
rm -rf $1/product/data-app/*

rm -rf $1/product/priv-app/Velvet
rm -rf $1/product/app/GoogleTTS
rm -rf $1/priv-app/MiuiMusicGlobal

#rm -rf $1/fonts/NotoSansEgyptianHieroglyphs-Regular.ttf
#rm -rf $1/fonts/NotoSansTibetan-Bold.ttf
#rm -rf $1/fonts/NotoSansTibetan-Regular.ttf
#rm -rf $1/fonts/NotoSerifCJK-Regular.ttc
#rm -rf $1/fonts/NotoSansCJK-Regular.ttc
#rm -rf $1/fonts/NotoSansCuneiform-Regular.ttf
#rm -rf $1/media/theme/miui_mod_icons

# Add by Pinkdoge
rm -rf $1/app/XiaomiServiceFramework
rm -rf $1/app/XiaomiSimActivateService
rm -rf $1/product/priv-app/GoogleRestore
rm -rf $1/product/priv-app/SetupWizard
