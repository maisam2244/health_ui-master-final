import 'package:get/get.dart';

@override
class Language extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "Nurse visit": "Nurse visit",
          "Doctor visit": "Doctor visit",
          "Virtual consultation": "Virtual consultation",
          "Vitamin IV drips and fluids": "Vitamin IV drips and fluids",
          "Laboratory": "Laboratory",
        },
        "ar_AE": {
          "Nurse visit": "زيارة تمريض",
          "Doctor visit": "زيارة طبيب",
          "Virtual consultation": "استشارة طبيب عن بعد",
          "Laboratory ": " الفحوصات",
          "Vitamin IV drips and fluids": "المحاليل والسوائل"
          

        }
      };
}

