import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MutationPage extends StatelessWidget {
  const MutationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink =
        HttpLink("https://verified-mosquito-75.hasura.app/v1/graphql");
    final AuthLink authLink = AuthLink(
      headerKey: 'x-hasura-admin-secret',
      getToken: () async =>
          'DIK9EhORiG6bT9KNpDth3K9j926oOPLCd3ON93YVh31gVlocQAiNasyniGcVX9gt',
      // OR
      // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
    );

    final Link link = authLink.concat(httpLink);
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
        GraphQLClient(link: link, cache: GraphQLCache()));

    return GraphQLProvider(
      client: client,
      child: const MutationViewPage(),
    );
  }
}

class MutationViewPage extends StatefulWidget {
  const MutationViewPage({super.key});

  @override
  State<MutationViewPage> createState() => _MutationViewPageState();
}

class _MutationViewPageState extends State<MutationViewPage> {
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries ❄Mutation❄'),
      ),
      body: Mutation(
        options: MutationOptions(
          document: gql(r'''
                  mutation insertCountrie($name: String!, $code: String!) {
                  insert_continents(objects: [{name: $name, code: $code}]) {
                    returning {
                      name
                      code
                    }
                  }
                  }
      '''),
          // onError: (OperationException error) {},
          onCompleted: (dynamic resultData) {
            print("onCompleted called");
          },
        ),
        // variables: <String, dynamic>{"code": "AF"}),
        builder: (insert, result) {
          return Column(
            children: [
              TextField(
                decoration: const InputDecoration(hintText: 'Name'),
                controller: nameController,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Code'),
                controller: codeController,
              ),
              ElevatedButton(
                  onPressed: () {
                    insert(<String, dynamic>{
                      "name": nameController.text,
                      "code": codeController.text
                    });
                  },
                  child: const Text('Submit')),
              Text("Result : \n ${result?.data?.toString()}")
            ],
          );
        },
      ),
    );
  }
}
