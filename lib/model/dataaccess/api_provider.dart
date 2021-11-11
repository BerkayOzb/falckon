class ApiProvider {
  static String baseUrl =
      'https://ffc.falckon.com/Services/MimMobileService.svc';
  static String setUser = baseUrl + '/SetKullanici';
  static String getUser = baseUrl + '/GetKullaniciBilgileri';
  static String acceptPolicy = baseUrl + '/SetKVKK';
  static String serviceBase =
      'https://ffc.falckon.com/Services/MobileService.svc';
  static String machineInfo = serviceBase + '/GetFalconMakineTanimlari';
  static String firmaAdres = serviceBase + '/GetFalconFirmaAdresleri';
  static String bakimDetaylari = serviceBase + '/GetFalconPlanliBakimDetaylari';
  static String bakimTanimlari = serviceBase + '/GetFalconPlanliBakimTanimlari';
  static String setBakimDetaylari =
      serviceBase + '/SetFalconPlanliBakimDetaylariLIST';
}
