import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:movie_ticket/api/search_movie.dart';
import 'package:movie_ticket/const/colors.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
          // autofocus: true,
          style: TextStyle(color: CustomColors.white),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            prefixIcon: Icon(Icons.search, color: CustomColors.white),
            hintText: 'Search for movie',
            hintStyle: TextStyle(color: CustomColors.white),
            filled: true,
            fillColor: CustomColors.grey,
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          )),
      suggestionsCallback: (query) async {
        return await BackendService.getSuggestions(query: query);
      },
      itemBuilder: (context, suggesstion) {
        return Container(
          color: CustomColors.black,
          child: ListTile(
            title: Text(
              suggesstion['name'],
              style: TextStyle(color: CustomColors.white),
            ),
          ),
        );
      },
      onSuggestionSelected: (suggesstion) {},
    );
  }
}
