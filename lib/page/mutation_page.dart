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
  TextEditingController name2Controller = TextEditingController();
  String? dropdown;
  String? dropdown2;

  @override
  Widget build(BuildContext context) {
    String insertContinents = r'''
                      mutation insertCountrie($name: String!, $code: String!) {
                      insert_continents(objects: [{name: $name, code: $code}]) {
                        returning {
                          name
                          code
                        }
                      }
                      }
          ''';
    String getContinents = r'''
                  query getContinents{
                  continents {
                    code
                    name
                  }
                  }
''';
    String updateContinents = r''' 
                  mutation update_continents($code: String!, $name: String!) {
                update_continents(where: {code: {_eq: $code}}, _set: {name: $name}) {
                  returning {
                    code
                    name
                  }
                }
              }
    ''';
    String deleteContinents = r'''
                  mutation delete_continents($code: String!) {
                    delete_continents(where: {code: {_eq: $code}}) {
                      returning {
                        code
                        name
                      }
                    }
                  }
''';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries ❄Mutation❄'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Query(
                options: QueryOptions(document: gql(getContinents)),
                builder: (result, {fetchMore, refetch}) {
                  print(result.data?['continents']);
                  return Column(
                    children: [
                      //NOTE - Create
                      Mutation(
                        options: MutationOptions(
                          document: gql(insertContinents),
                          onError: (error) {
                            print("onError called");
                          },
                          onCompleted: (dynamic resultData) {
                            print("onCompleted called");
                          },
                        ),
                        // variables: <String, dynamic>{"code": "AF"}),
                        builder: (insert, result2) {
                          return Column(
                            children: [
                              const Text(
                                'Add Countries',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextField(
                                decoration:
                                    const InputDecoration(hintText: 'Name'),
                                controller: nameController,
                              ),
                              TextField(
                                decoration:
                                    const InputDecoration(hintText: 'Code'),
                                controller: codeController,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    insert(<String, dynamic>{
                                      "name": nameController.text,
                                      "code": codeController.text
                                    });
                                    nameController.clear();
                                    codeController.clear();
                                    refetch?.call();
                                  },
                                  child: const Text('Submit')),
                              Text("Result : \n ${result2?.data?.toString()}"),
                            ],
                          );
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      //NOTE - Read
                      ElevatedButton(
                          onPressed: () {
                            refetch?.call();
                          },
                          child: const Text('Get Countries')),
                      if (result.isLoading)
                        const SizedBox(
                            height: 250,
                            child: Center(child: CircularProgressIndicator()))
                      else if (result.hasException)
                        SizedBox(
                            height: 250,
                            child: Center(
                                child: Text(result.exception.toString())))
                      else if (result.data == null)
                        const SizedBox(
                            height: 250,
                            child: Center(child: Text('No Data Found!')))
                      else
                        Container(
                          height: 250,
                          decoration: BoxDecoration(border: Border.all()),
                          child: ListView.builder(
                            itemCount: result.data?['continents'].length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                    result.data?['continents'][index]['name']),
                              );
                            },
                          ),
                        ),
                      const SizedBox(
                        height: 25,
                      ),
                      //NOTE - Update
                      Column(
                        children: [
                          const Text(
                            'Update Nama Countries',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: double.infinity,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: dropdown,
                                hint: const Text("Select Continents",
                                    style: TextStyle(color: Colors.black)),
                                items: result.data?['continents']
                                    .map<DropdownMenuItem<String>>((item) {
                                  return DropdownMenuItem<String>(
                                    value: item['code'].toString(),
                                    child: Text(item['name'].toString()),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  print('MKMK');
                                  print(value);
                                  setState(() {
                                    dropdown = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextField(
                            decoration: const InputDecoration(hintText: 'Nama'),
                            controller: name2Controller,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Mutation(
                            options: MutationOptions(
                              document: gql(updateContinents),
                              onError: (error) {},
                              onCompleted: (data) {
                                name2Controller.clear();
                                refetch?.call();
                                print('onCompleted called');
                              },
                            ),
                            builder: (update, result) {
                              return Column(
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        update(<String, dynamic>{
                                          "name": name2Controller.text,
                                          "code": dropdown
                                        });
                                      },
                                      child: const Text('Update')),
                                  Text(
                                      "Result : \n ${result?.data?.toString()}"),
                                ],
                              );
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      //NOTE - Deleted
                      Column(
                        children: [
                          const Text(
                            'Delete Countries',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: double.infinity,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: dropdown2,
                                hint: const Text("Select Continents",
                                    style: TextStyle(color: Colors.black)),
                                items: result.data?['continents']
                                    .map<DropdownMenuItem<String>>((item) {
                                  return DropdownMenuItem<String>(
                                    value: item['code'].toString(),
                                    child: Text(item['name'].toString()),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  print('MKMK');
                                  print(value);
                                  setState(() {
                                    dropdown2 = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Mutation(
                            options: MutationOptions(
                              document: gql(deleteContinents),
                              onError: (error) {},
                              onCompleted: (data) {
                                refetch?.call();
                                print('onCompleted called');
                              },
                            ),
                            builder: (delete, result) {
                              return Column(
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        delete(<String, dynamic>{
                                          "code": dropdown2
                                        });
                                        setState(() {
                                          if (dropdown == dropdown2) {
                                            dropdown = null;
                                          }
                                          dropdown2 = null;
                                        });
                                      },
                                      child: const Text('Delete')),
                                  Text(
                                      "Result : \n ${result?.data?.toString()}"),
                                ],
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
