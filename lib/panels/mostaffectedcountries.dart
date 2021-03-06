import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {

  final List countryData;

  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Row(
            children: <Widget>[
              //Image.network(countryData[index]['countryInfo']['flag'],height: 30,),
              Text(countryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              SizedBox(width: 10,),
              Text('Deaths:' + countryData[index]['deaths'].toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),)
            ],
          ),
        );
      },
      itemCount: 5,),
    );
  }
}
