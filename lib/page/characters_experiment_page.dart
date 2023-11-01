import 'package:flutter/material.dart';
// import 'package:flutter_graphql/providers/fetch_characters_provider.dart';
import 'package:flutter_graphql/providers/fetch_countries_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharactersExperimentPage extends StatelessWidget {
  const CharactersExperimentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: CharactersExperimentPageView());
  }
}

class CharactersExperimentPageView extends ConsumerWidget {
  const CharactersExperimentPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TextEditingController codeController = TextEditingController();
    // TextEditingController nameController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Characters'),
        ),
        // body: ref.watch(fetchCountriesProvider).maybeWhen(fetching: () {
        //   return const Center(
        //     child: CircularProgressIndicator(),
        //   );
        // }, fetched: (ctx) {
        //   return SafeArea(
        //       child: Padding(
        //     padding: const EdgeInsets.all(15),
        //     child: ListView(
        //       children: [
        //         const Text(
        //           'Add Countries',
        //           style: TextStyle(fontWeight: FontWeight.bold),
        //         ),
        //         const SizedBox(
        //           height: 5,
        //         ),
        //         TextField(
        //           decoration: const InputDecoration(hintText: 'Name'),
        //           controller: nameController,
        //         ),
        //         TextField(
        //           decoration: const InputDecoration(hintText: 'Code'),
        //           controller: codeController,
        //         ),
        //         const SizedBox(
        //           height: 15,
        //         ),
        //         ElevatedButton(
        //             onPressed: () {
        //               print(nameController.text);
        //               print(codeController.text);
        //               // print(fetchCountriesProvider.name);
        //               // Provider.of<FetchCountriesProvider>(context);
        //               // insert(<String, dynamic>{
        //               //   "name": nameController.text,
        //               //   "code": codeController.text
        //               // });
        //               // nameController.clear();
        //               // codeController.clear();
        //               // refetch?.call();
        //             },
        //             child: const Text('Submit')),
        //         Text("Result : \n ${ctx.length.toString()}"),
        //       ],
        //     ),
        //   ));
        // }, orElse: () {
        //   return SizedBox();
        // })

        body: ref.watch(fetchCountriesProvider).maybeWhen(fetching: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }, fetched: (characters) {
          return ListView(
            children: characters
                .map((e) => ListTile(
                      title: Text(e.name!),
                      // leading: Image.network(
                      //   e.image!,
                      //   height: 100,
                      //   fit: BoxFit.cover,
                      // ),
                      subtitle: Text(e.code!),
                    ))
                .toList(),
          );
        }, orElse: () {
          return Container();
        }));
  }
}
