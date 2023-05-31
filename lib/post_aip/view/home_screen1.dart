import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whtear_api/post_aip/provider/post_provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController txtName=TextEditingController();
  TextEditingController txtPrice=TextEditingController();
  TextEditingController txtOffer=TextEditingController();
  TextEditingController txtRate=TextEditingController();
  TextEditingController txtdesc=TextEditingController();
  TextEditingController txtcategory=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Post Screen",),centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: txtName,decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text("Name"),
                focusColor: Colors.purpleAccent,
                fillColor: Colors.purpleAccent,
                hoverColor: Colors.purpleAccent,
              )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: txtcategory,decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text("Category"),
                  focusColor: Colors.purpleAccent
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: txtPrice,decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text("Price"),
                  focusColor: Colors.purpleAccent
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: txtOffer,decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text("Offer"),
                  focusColor: Colors.purpleAccent
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: txtRate,decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text("Rate"),
                  focusColor: Colors.purpleAccent
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: txtdesc,decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text("Desc.."),
                  focusColor: Colors.purpleAccent
              )),
            ),
            ElevatedButton(onPressed: () async {
              String mga= await Provider.of<PostProvider>(context,listen: false).postData(txtName.text, txtPrice.text, txtOffer.text, txtcategory.text, txtdesc.text, txtRate.text);
              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${mga}")));
            }, child: Text("Send"))
          ],
        ),
      ),
    ));
  }
}

