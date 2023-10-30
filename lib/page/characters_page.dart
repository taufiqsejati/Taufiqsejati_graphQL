import 'package:flutter/material.dart';
import 'package:flutter_graphql/providers/fetch_characters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: CharactersPageView());
  }
}

class CharactersPageView extends ConsumerWidget {
  const CharactersPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Characters'),
        ),
        body: ref.watch(fetchCharactersProvider).maybeWhen(fetching: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }, fetched: (characters) {
          return ListView(
            children: characters
                .map((e) => ListTile(
                      title: Text(e.name!),
                      leading: Image.network(
                        e.image!,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      subtitle: Text(e.status!),
                    ))
                .toList(),
          );
        }, orElse: () {
          return Container();
        }));
  }
}