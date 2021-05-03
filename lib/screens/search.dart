import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  FloatingSearchBarController controller;

  static const historyLength = 9;
  static const trendsLength = 9;

  //Data form news api stored here, dummy for now
  //Popularity decreases as we go down
  List<String> newsTrends = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    'Nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus. Metus dictum at tempor commodo.',
    'Eget mauris pharetra et ultrices neque ornare aenean euismod elementum',
  ];

  //raw history list of searched terms, max historyLength
  //ordered in reverse chronological order, with pre - filled values
  List<String> _searchHistory = [
    'History 3',
    'History 2',
    'History 1',
  ];

  //Contains filtered search terms based on
  //user's input
  List<String> filteredSearchHistory;

  //Currently searched for term
  String selectedTerm;

  // Future<List<String>> setTrends() async
  // {
  //   //get the trends from news api
  // }

  List<String> filteredSearchTerms({
    @required String filter,
  })
  {
    if(filter != null && filter.isNotEmpty)
    {
      return _searchHistory.reversed.where((term) => term.startsWith(filter)).toList();
    }
    else
    {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term)
  {
    if(_searchHistory.contains(term))
    {
      putSearchTermFirst(term);
      return;
    }
    _searchHistory.add(term);
    if(_searchHistory.length > historyLength)
    {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }
    filteredSearchHistory = filteredSearchTerms(filter: null);
  }

  void deleteSearchTerm(String term)
  {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filteredSearchTerms(filter: null);
  }

  void putSearchTermFirst(String term)
  {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  @override
  void initState() {
    filteredSearchHistory = filteredSearchTerms(filter: null);
    //newsTrends = setTrends();
    controller = FloatingSearchBarController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloatingSearchBar(
        leadingActions: [
          IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){/*go back to the previous screen*/})
        ],
        builder: (context, transition){
          if(newsTrends.isEmpty) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                color: Colors.white,
                elevation: 4,
                child: Builder(
                  builder: (context) {
                    if (filteredSearchHistory.isEmpty &&
                        controller.query.isEmpty) {
                      return Container(
                        height: 56,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          'What do you want to know today?',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey
                          ),
                        ),
                      );
                    }
                    else if (filteredSearchHistory.isEmpty) {
                      return ListTile(
                        title: Text(controller.query),
                        leading: Icon(Icons.search),
                        onTap: () {
                          setState(() {
                            addSearchTerm(controller.query);
                            selectedTerm = controller.query;
                          });
                          controller.close();
                        },
                      );
                    }
                    else {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: filteredSearchHistory.map(
                                (term) =>
                                ListTile(
                                  title: Text(
                                    term,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  leading: Icon(Icons.history),
                                  trailing: IconButton(
                                    icon: Icon(Icons.clear),
                                    onPressed: () {
                                      setState(() {
                                        deleteSearchTerm(term);
                                      });
                                    },
                                  ),
                                  onTap: () {
                                    setState(() {
                                      putSearchTermFirst(term);
                                      selectedTerm = term;
                                    });
                                    controller.close();
                                  },
                                )).toList(),
                      );
                    }
                  },
                ),
              ),
            );
          }
          else
            {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Material(
                      color: Colors.white,
                      elevation: 4,
                      child: Builder(
                        builder: (context) {
                          if (filteredSearchHistory.isEmpty &&
                              controller.query.isEmpty) {
                            return Container(
                              height: 56,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Text(
                                'What do you want to know today?',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey
                                ),
                              ),
                            );
                          }
                          else if (filteredSearchHistory.isEmpty) {
                            return ListTile(
                              title: Text(controller.query),
                              leading: Icon(Icons.search),
                              onTap: () {
                                setState(() {
                                  addSearchTerm(controller.query);
                                  selectedTerm = controller.query;
                                });
                                controller.close();
                              },
                            );
                          }
                          else {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: filteredSearchHistory.map(
                                      (term) =>
                                      ListTile(
                                        title: Text(
                                          term,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        leading: Icon(Icons.history),
                                        trailing: IconButton(
                                          icon: Icon(Icons.clear),
                                          onPressed: () {
                                            setState(() {
                                              deleteSearchTerm(term);
                                            });
                                          },
                                        ),
                                        onTap: () {
                                          setState(() {
                                            putSearchTermFirst(term);
                                            selectedTerm = term;
                                          });
                                          controller.close();
                                        },
                                      )).toList(),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Material(
                      color: Colors.white,
                      elevation: 4,
                      child: Builder(
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: newsTrends.map(
                                    (trend) => ListTile(
                                      leading: Icon(Icons.trending_up_rounded),
                                      title: Text(
                                        trend,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Text(
                                          'Add if required',
                                        style: Theme.of(context).textTheme.caption,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      onTap: (){/*TODO: Re-direct user to cur_news with current trend data*/},
                                    )
                            ).toList(),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
        },
        onSubmitted: (query){
          setState(() {
            addSearchTerm(query);
            selectedTerm = query;
          });
          controller.close();
        },
        /*
        * If you're performing an expensive operation in
        * onQueryChanged such as a network call,
        * consider setting the debounceDelay so that the callback will not run
        * for every single typed-in character.
        */
        onQueryChanged: (query){
          setState(() {
            filteredSearchHistory = filteredSearchTerms(filter: query);
          });
        },
        actions: [
          FloatingSearchBarAction.searchToClear(),
        ],
        hint: 'Search and Find out...',
        title: Text(
          selectedTerm ?? 'Discover',
          style: Theme.of(context).textTheme.headline6,
        ),
        transition: CircularFloatingSearchBarTransition(),
        physics: BouncingScrollPhysics(),
        controller: controller,
        body: FloatingSearchBarScrollNotifier(
          child: SearchResultsListView(
            searchTerm: selectedTerm,
          ),
        ),
      ),
    );
  }
}

class SearchResultsListView extends StatelessWidget {
  final String searchTerm;

  const SearchResultsListView({
    Key key,
    @required this.searchTerm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final fsb = FloatingSearchBar.of(context);

    if (searchTerm == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.map_rounded,
              size: 104,
              color: Colors.grey.withOpacity(0.4),
            ),
            SizedBox(height: 10,),
            Text(
              'Search...',
              style: TextStyle(
                color: Colors.grey.withOpacity(0.6),
                letterSpacing: 2,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'over 75,000 news sources',
              style: TextStyle(
                color: Colors.grey.withOpacity(0.6),
                letterSpacing: 0.5,
                fontSize: 13,
              ),
            ),
          ],
        ),
      );
    }

    //TODO: change acc. to news api
    return ListView(

      //TODO: change params here to upgrade floating search bar version
      padding: EdgeInsets.only(top: fsb.height + fsb.margins.vertical),

      //TODO: change acc. to api resulting headlines
      children: List.generate(
            50,
            (index) => ListTile(
          title: Text('$searchTerm search result'),
          subtitle: Text(index.toString()),
        ),
      ),
    );
  }
}
