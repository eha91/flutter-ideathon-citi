import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: Center(

        child: Text(selectedResult,),
      ),
    );
  }

  final List<String> listExample;
  Search(this.listExample);

  List<String> recentList = ["Barberia", "Psicologo",  "Carpintero"];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList //In the true case
        : suggestionList.addAll(listExample.where(
      // In the false case
          (element) => element.contains(query),
    ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Container(
            child: Row(
              children: [

                Text( suggestionList[index],)
              ],
            ),
           
          ),
          leading: query.isEmpty ? Icon(Icons.access_time) : CircleAvatar(
            backgroundImage: NetworkImage("https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png"),
          ),
          onTap: (){
            selectedResult = suggestionList[index];

          },
        );
      },
    );
  }
}