import 'package:url_launcher/url_launcher.dart';

void sendSms(String no){
  String sms1  = 'sms:$no';
  launch(sms1);
}