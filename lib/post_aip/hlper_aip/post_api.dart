import 'dart:convert';

import 'package:http/http.dart' as http;

class PostApi
{
  static PostApi postApi=PostApi();

  Future<String> postapi(String name,String price, String offer, String category,String desc,String rate)
  async {
    String link="https://apidatahub.000webhostapp.com/MyShop/API/adddataapi.php";
    var response= await http.post(Uri.parse(link),body: {"p_name":name,"p_price":price,"p_offer":offer,"p_category":category,"p_desc":desc,"p_rate":rate});


    var json = jsonDecode(response.body);
    if (json[0]['status'] == 'ok') {
      return "Done";
    }
    return "Error";

  }
}