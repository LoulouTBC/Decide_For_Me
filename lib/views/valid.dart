

import 'package:flutter_gmaps/views/constant/message.dart';

validInput(String val, int min, int max) //اكبر عدد احرف واقل عدد بالحقل
{
  if (val.isEmpty) {
    return "$messageInputEmpty";
  }
  if (val.length > max) {
    return "$messageInputMax $max";
  }
  if (val.length < min) {
    return "$messageInputMin $min";
  }
  
}
