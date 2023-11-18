enum KAssetName {
  ic_timesvg,
  icDashboardHomesvg,
  introPagesvg,
  ic_back_white_bgsvg,
  icDonesvg,
  delete_icon_with_primary_color_bgsvg,
  ic_notificationsvg,
  ic_notification_with_white_bgsvg,
  edit_icon_with_primary_color_bgsvg,
  visa_iconsvg,
  ic_intro_centersvg,
  ic_laundrypng,
  icDashSupportpng,
  icDashSettingpng,
  icDashMyBasketpng,
  visa_iconpng,
  icDashMyOrderspng,
  icWashingMachinepng,
  RobotoMediumttf,
  RobotoLightttf,
  RobotoRegularttf,
  RobotoMediumItalicttf,
  RobotoThinItalicttf,
  RobotoBoldItalicttf,
  RobotoLightItalicttf,
  RobotoItalicttf,
  RobotoBlackItalicttf,
  RobotoBoldttf,
  RobotoThinttf,
  RobotoBlackttf,
  icDeletesvg,
  icShirtsvg,
  icCamerasvg,
  icWarningsvg,
  icSearchsvg,
  icDownloadsvg,
  icDashLinesvg,
  icGetStartedBacksvg,
  icDiscountpng,
  icQrCodepng,
  icGalleryPicksvg,
  icAuthSelectpng,
  icTelephonesvg,
  icFacebookpng,
  icGooglepng,
  icWhatsapppng,
  icUserPlaceholdersvg,
  icPickProfileImagesvg,
  icProfileCreateSuccesspng,
  icSwitchEnabledsvg,
  icSwitchDisabledsvg,
  icArrowForwardSettingssvg,
  icLogoutsvg,
  icLocationPickersvg,
  icAddresssvg,
  icEditpng,
  icDeleteAddresspng,
  icDeleteAddressDisabledpng,
  icEditDisabledpng,
  icSupportTelephonesvg,
  icSupportChatsvg,
  icSupportEmailsvg,
  icWhatsappsvg,
  icOpenGallerysvg,
  icAddItemImagepng,
  icJeansjpg,
  icCalenderPickerpng,
  icCreditCardpng,
  icOrderConfirmedpng,
  icDubaiFlagpng,
  defaultPlaceholderpng,
  icNoMyOrderpng,
  icNoLatestOrderpng,
}

extension AssetsExtension on KAssetName {
  String get imagePath {
    const String _rootPath = 'assets';
    const String _svgDir = '$_rootPath/svg';
    const String _imagesDir = '$_rootPath/images';
    const String _fontsDir = '$_rootPath/fonts';
    switch (this) {
      case KAssetName.ic_timesvg:
        return '$_svgDir/ic_time.svg';
      case KAssetName.icDashboardHomesvg:
        return '$_svgDir/icDashboardHome.svg';
      case KAssetName.introPagesvg:
        return '$_svgDir/introPage.svg';
      case KAssetName.ic_back_white_bgsvg:
        return '$_svgDir/ic_back_white_bg.svg';
      case KAssetName.icDonesvg:
        return '$_svgDir/icDone.svg';
      case KAssetName.delete_icon_with_primary_color_bgsvg:
        return '$_svgDir/delete_icon_with_primary_color_bg.svg';
      case KAssetName.ic_notificationsvg:
        return '$_svgDir/ic_notification.svg';
      case KAssetName.ic_notification_with_white_bgsvg:
        return '$_svgDir/ic_notification_with_white_bg.svg';
      case KAssetName.edit_icon_with_primary_color_bgsvg:
        return '$_svgDir/edit_icon_with_primary_color_bg.svg';
      case KAssetName.visa_iconsvg:
        return '$_svgDir/visa_icon.svg';
      case KAssetName.ic_intro_centersvg:
        return '$_svgDir/ic_intro_center.svg';
      case KAssetName.ic_laundrypng:
        return '$_imagesDir/ic_laundry.png';
      case KAssetName.icDashSupportpng:
        return '$_imagesDir/icDashSupport.png';
      case KAssetName.icDashSettingpng:
        return '$_imagesDir/icDashSetting.png';
      case KAssetName.icDashMyBasketpng:
        return '$_imagesDir/icDashMyBasket.png';
      case KAssetName.visa_iconpng:
        return '$_imagesDir/visa_icon.png';
      case KAssetName.icDashMyOrderspng:
        return '$_imagesDir/icDashMyOrders.png';
      case KAssetName.icWashingMachinepng:
        return '$_imagesDir/icWashingMachine.png';
      case KAssetName.RobotoMediumttf:
        return '$_fontsDir/Roboto-Medium.ttf';
      case KAssetName.RobotoLightttf:
        return '$_fontsDir/Roboto-Light.ttf';
      case KAssetName.RobotoRegularttf:
        return '$_fontsDir/Roboto-Regular.ttf';
      case KAssetName.RobotoMediumItalicttf:
        return '$_fontsDir/Roboto-MediumItalic.ttf';
      case KAssetName.RobotoThinItalicttf:
        return '$_fontsDir/Roboto-ThinItalic.ttf';
      case KAssetName.RobotoBoldItalicttf:
        return '$_fontsDir/Roboto-BoldItalic.ttf';
      case KAssetName.RobotoLightItalicttf:
        return '$_fontsDir/Roboto-LightItalic.ttf';
      case KAssetName.RobotoItalicttf:
        return '$_fontsDir/Roboto-Italic.ttf';
      case KAssetName.RobotoBlackItalicttf:
        return '$_fontsDir/Roboto-BlackItalic.ttf';
      case KAssetName.RobotoBoldttf:
        return '$_fontsDir/Roboto-Bold.ttf';
      case KAssetName.RobotoThinttf:
        return '$_fontsDir/Roboto-Thin.ttf';
      case KAssetName.RobotoBlackttf:
        return '$_fontsDir/Roboto-Black.ttf';
      case KAssetName.icDeletesvg:
        return '$_svgDir/icDelete.svg';
      case KAssetName.icShirtsvg:
        return '$_svgDir/icShirt.svg';
      case KAssetName.icCamerasvg:
        return '$_svgDir/icCamera.svg';
      case KAssetName.icWarningsvg:
        return '$_svgDir/icWarning.svg';
      case KAssetName.icSearchsvg:
        return '$_svgDir/icSearch.svg';
      case KAssetName.icDownloadsvg:
        return '$_svgDir/icDownload.svg';
      case KAssetName.icDashLinesvg:
        return '$_svgDir/icDashLine.svg';
      case KAssetName.icGetStartedBacksvg:
        return '$_svgDir/icGetStartedBack.svg';
      case KAssetName.icDiscountpng:
        return '$_imagesDir/icDiscount.png';
      case KAssetName.icQrCodepng:
        return '$_imagesDir/icQrCode.png';
      case KAssetName.icGalleryPicksvg:
        return '$_svgDir/icGalleryPick.svg';
      case KAssetName.icAuthSelectpng:
        return '$_imagesDir/icAuthSelect.png';
      case KAssetName.icTelephonesvg:
        return '$_svgDir/icTelephone.svg';
      case KAssetName.icGooglepng:
        return '$_imagesDir/icGoogle.png';
      case KAssetName.icFacebookpng:
        return '$_imagesDir/icFacebook.png';
      case KAssetName.icWhatsapppng:
        return '$_imagesDir/icWhatsapp.png';
      case KAssetName.icUserPlaceholdersvg:
        return '$_svgDir/icUserPlaceholder.svg';
      case KAssetName.icPickProfileImagesvg:
        return '$_svgDir/icPickProfileImage.svg';
      case KAssetName.icProfileCreateSuccesspng:
        return '$_imagesDir/icProfileCreateSuccess.png';
      case KAssetName.icSwitchEnabledsvg:
        return '$_svgDir/icSwitchEnabled.svg';
      case KAssetName.icSwitchDisabledsvg:
        return '$_svgDir/icSwitchDisabled.svg';
      case KAssetName.icArrowForwardSettingssvg:
        return '$_svgDir/icArrowForwardSettings.svg';
      case KAssetName.icLogoutsvg:
        return '$_svgDir/icLogout.svg';
      case KAssetName.icLocationPickersvg:
        return '$_svgDir/icLocationPicker.svg';
      case KAssetName.icAddresssvg:
        return '$_svgDir/icAddress.svg';
      case KAssetName.icEditpng:
        return '$_imagesDir/icEdit.png';
      case KAssetName.icEditDisabledpng:
        return '$_imagesDir/icEditDisabled.png';
      case KAssetName.icDeleteAddresspng:
        return '$_imagesDir/icDeleteAddress.png';
      case KAssetName.icDeleteAddressDisabledpng:
        return '$_imagesDir/icDeleteAddressDisabled.png';
      case KAssetName.icSupportTelephonesvg:
        return '$_svgDir/icSupportTelephone.svg';
      case KAssetName.icSupportChatsvg:
        return '$_svgDir/icSupportChat.svg';
      case KAssetName.icSupportEmailsvg:
        return '$_svgDir/icSupportEmail.svg';
      case KAssetName.icWhatsappsvg:
        return '$_svgDir/icWhatsapp.svg';
      case KAssetName.icOpenGallerysvg:
        return '$_svgDir/icOpenGallery.svg';
      case KAssetName.icAddItemImagepng:
        return '$_imagesDir/icAddItemImage.png';
      case KAssetName.icJeansjpg:
        return '$_imagesDir/icJeans.jpg';
      case KAssetName.icCalenderPickerpng:
        return '$_imagesDir/icCalenderPicker.png';
      case KAssetName.icCreditCardpng:
        return '$_imagesDir/icCreditCard.png';
      case KAssetName.icOrderConfirmedpng:
        return '$_imagesDir/icOrderConfirmed.png';
      case KAssetName.icDubaiFlagpng:
        return '$_imagesDir/icDubaiFlag.png';
      case KAssetName.defaultPlaceholderpng:
        return '$_imagesDir/defaultPlaceholder.png';
      case KAssetName.icNoMyOrderpng:
        return '$_imagesDir/icNoMyOrder.png';
      case KAssetName.icNoLatestOrderpng:
        return '$_imagesDir/icNoLatestOrder.png';
    }
    return '';
  }
}
