import 'package:flutter/widgets.dart';
import 'package:whtear_api/post_aip/hlper_aip/post_api.dart';

class PostProvider extends ChangeNotifier
{

  String mgs="";
  Future<String> postData(name,price,offer,category,desc,rate)
  async {
    String msg= await PostApi.postApi.postapi(name, price, offer, category, desc, rate);
    return msg;
  }
}