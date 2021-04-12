import 'dart:convert';

import 'package:first_app/datasource.dart';
import 'package:first_app/pages/countrypage.dart';
import 'package:first_app/panels/infopanel.dart';
import 'package:first_app/panels/mostaffectedcountries.dart';
import 'package:first_app/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map worldData;
  fetchWorldWideData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v3/covid-19/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;
  fetchCountryData()async{
    http.Response response = await http.get('https://coronavirus-19-api.herokuapp.com/countries');
    setState(() {
      countryData = json.decode(response.body);
    });
  }


  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'COVID-19 STATS',
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            color: Colors.orange[100],
            child: Text(
              DataSource.quote,
              style: TextStyle(
                  color: Colors.orange[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Worldwide',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
                  },
                  child: Container(

                      decoration: BoxDecoration(
                        color: primaryBlack,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text('Regional',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16),)),
                ),
              ],
            ),
          ),
          worldData==null?CircularProgressIndicator():WorldwidePanel(worldData: worldData,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Text('Most Affected Countries',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
          ),
          SizedBox(height: 10,),
          countryData==null?Container():MostAffectedPanel(countryData: countryData,),
          InfoPanel(),
          SizedBox(height: 20,),
          Center(child: Text('WE ARE TOGETHER IN THE FIGHT',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
          SizedBox(height: 40,)
        ],
      )),
    );
  }
}
