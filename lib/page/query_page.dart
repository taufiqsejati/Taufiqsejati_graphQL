import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class QueryPage extends StatelessWidget {
  const QueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink("https://countries.trevorblades.com/");
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
        GraphQLClient(link: httpLink, cache: GraphQLCache()));
    return GraphQLProvider(
      client: client,
      child: const QueryViewPage(),
    );
  }
}

class QueryViewPage extends StatefulWidget {
  const QueryViewPage({super.key});

  @override
  State<QueryViewPage> createState() => _QueryViewPageState();
}

class _QueryViewPageState extends State<QueryViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries ❄Query❄'),
      ),
      body: Query(
        options: QueryOptions(document: gql(r"""
                  query GetContinent($code : ID!){
                  continent(code:$code){
                    name
                  countries{
                    name
                  }
                  }
                  }
      """), variables: <String, dynamic>{"code": "AF"}),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            return Center(child: Text(result.exception.toString()));
          }
          if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (result.data == null) {
            return const Center(child: Text('No Data Found!'));
          }
          print(result.data?['continent']['countries']);
          return ListView.builder(
            itemCount: result.data?['continent']['countries'].length,
            itemBuilder: (context, index) {
              return ListTile(
                title:
                    Text(result.data?['continent']['countries'][index]['name']),
              );
            },
          );
        },
      ),
    );
  }
}
