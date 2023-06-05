import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:whtear_api/model/weather_model.dart';
import 'package:whtear_api/provider/weather_provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherProvider? wpT;
  WeatherProvider? wpF;
  @override
  Widget build(BuildContext context) {
    wpF=Provider.of<WeatherProvider>(context,listen: false);
    wpT=Provider.of<WeatherProvider>(context,listen: true);
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: () {
                  wpF!.changlat("21.1702", "72.8311");
              }, child: Text("Surat")),
              TextButton(onPressed: () {
                  wpF!.changlat("28.7041", "77.1025");
              }, child: Text("Delhi")),
              TextButton(onPressed: () {
                  wpF!.changlat("19.0760", "72.8777");
              }, child: Text("Mumbai")),
              TextButton(onPressed: () {
                  wpF!.changlat("22.5726", "88.3639");
              }, child: Text("Kolkata")),
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: wpF!.loadData( wpT!.long,wpT!.lat),
              builder: (context, snapshot) {
                if(snapshot.hasError)
                  {
                    return Text("${snapshot.error}");
                  }
                else if(snapshot.hasData)
                  {
                    WeatherModel weatherModel=snapshot.data!;
                    wpF!.imagechange(weatherModel.main!.temp!);
                    return Container(
                      height: 100.h,
                        width: 100.w,
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/bck.png"),fit: BoxFit.cover)),
                      child: Column(
                        children: [
                          SizedBox(height: 20.h,),
                      Text("It's ${weatherModel.weather![0].description}",style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.w300,color: Colors.black54)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("${wpT!.selectimage}",height: 25.h,width: 50.w,fit: BoxFit.fill,),
                              Text("${weatherModel.main!.temp!.toInt()*10}°C",style: TextStyle(fontSize: 25.sp),),
                              Text("${weatherModel.weather![0].main}°C",style: TextStyle(fontSize: 15.sp),)
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Image.asset("assets/images/img5.png",height: 20.h,width: 20.w,fit: BoxFit.fill,),
                              Text("${weatherModel.wind!.speed}sp",style: TextStyle(fontSize: 30),)
                            ],
                          )
                        ],
                      ),
                    );
                  }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    ));
  }
}
