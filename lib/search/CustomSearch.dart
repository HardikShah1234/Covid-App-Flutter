import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context) {

    return [IconButton(icon: Icon(Icons.clear), onPressed: (){
      query = '';
    },),];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
      close(context, null);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
  
}