import 'package:http/http.dart';
import 'package:flutter_app/dto/mcare_terms_privacy.dart';

class McareTermsPrivacyCMS {
  static const String url =
      'https://n.vodafone.ie/content/dam/gowingmyself/mcare/MCARE_TERMS_PRIVACY.txt';

  Future<McareTermsPrivacy> getContent() async {
    try {
      final response = await get(url);
      if (response.statusCode == 200) {
        final McareTermsPrivacy content =
            mcareTermsPrivacyFromJson(response.body);
        print('McareTermsPrivacy returned status code ${response.statusCode}');
        return content;
      } else {
        print('McareTermsPrivacy returned status code ${response.statusCode}');
        return McareTermsPrivacy();
      }
    } catch (e) {
      print('Error retrieving McareTermsPrivacy: \n${e.toString()}');
      return McareTermsPrivacy();
    }
  }
}
