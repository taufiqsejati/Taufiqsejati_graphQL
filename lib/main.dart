import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql/cubit/Cubit.dart';
import 'package:flutter_graphql/page/characters_page.dart';
import 'package:flutter_graphql/page/characters_experiment_page.dart';
import 'package:flutter_graphql/page/query_page.dart';
import 'package:flutter_graphql/page/mutation_page.dart';
import 'package:flutter_graphql/utils/bloc_observer.dart';
import 'package:flutter_graphql/utils/http.dart';

import 'code_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApiConfig();

  Bloc.observer = MyAppObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetProductCategoryCubit(),
        ),
        BlocProvider(
          create: (context) => CreateProductCategoryCubit(),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter FormBuilder Demo',
        debugShowCheckedModeBanner: false,
        home: _HomePage(),
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CodePage(
        title: 'Example Using GraphQL',
        child: ListView(
          children: [
            ListTile(
              title: const Text('Characters'),
              trailing: const Icon(Icons.arrow_right_sharp),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const CharactersPage();
                    },
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Characters Experiment'),
              trailing: const Icon(Icons.arrow_right_sharp),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const CharactersExperimentPage();
                    },
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Countries ❄Query❄'),
              trailing: const Icon(Icons.arrow_right_sharp),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const QueryPage();
                    },
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Countries ❄Mutation❄'),
              trailing: const Icon(Icons.arrow_right_sharp),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const MutationPage();
                    },
                  ),
                );
              },
            ),
            const Divider(),
          ],
        ));
  }
}
