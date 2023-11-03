import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql/cubit/Cubit.dart';
// import 'package:flutter_graphql/providers/fetch_characters_provider.dart';
// import 'package:flutter_graphql/providers/fetch_countries_provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharactersExperimentPage extends StatelessWidget {
  const CharactersExperimentPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return const ProviderScope(child: CharactersExperimentPageView());
    return const CharactersExperimentPageView();
  }
}

class CharactersExperimentPageView extends StatefulWidget {
  const CharactersExperimentPageView({super.key});

  @override
  State<CharactersExperimentPageView> createState() =>
      _CharactersExperimentPageViewState();
}

class _CharactersExperimentPageViewState
    extends State<CharactersExperimentPageView> {
  @override
  void didChangeDependencies() {
    context.read<GetProductCategoryCubit>().get();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController codeController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    String? result = '';

    return MultiBlocListener(
      listeners: [
        BlocListener<CreateProductCategoryCubit, CreateProductCategoryState>(
            listener: (context, state) {
          if (state is CreateProductCategoryFailed) {
            print('Failed ${state.errorMessage}');
            result = state.errorMessage;
            setState(() {});
          } else if (state is CreateProductCategorySuccess) {
            print(state.successResponse);
          }
        }),
      ],
      child: Scaffold(
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

        // body: ref.watch(fetchCountriesProvider).maybeWhen(fetching: () {
        //   return const Center(
        //     child: CircularProgressIndicator(),
        //   );
        // }, fetched: (characters) {
        //   return ListView(
        //     children: characters
        //         .map((e) => ListTile(
        //               title: Text(e.name!),
        //               // leading: Image.network(
        //               //   e.image!,
        //               //   height: 100,
        //               //   fit: BoxFit.cover,
        //               // ),
        //               subtitle: Text(e.code!),
        //             ))
        //         .toList(),
        //   );
        // }, orElse: () {
        //   return Container();
        // })

        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(border: Border.all()),
                    child: BlocBuilder<GetProductCategoryCubit,
                        GetProductCategoryState>(builder: (ctx, state) {
                      if (state is GetProductCategoryLoading) {
                        return const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 15,
                            ),
                            Text('Loading..'),
                          ],
                        );
                      }
                      if (state is GetProductCategoryFailed) {
                        return Center(child: Text(state.errorMessage));
                      }
                      if (state is GetProductCategorySuccess) {
                        return ListView(
                          children: state.dataFilterCategory!
                              .map((e) => ListTile(title: Text(e.name!)))
                              .toList(),
                        );
                      }
                      return const SizedBox();
                    }),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    child: Column(
                      children: [
                        const Text(
                          'Add Countries',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          decoration: const InputDecoration(hintText: 'Name'),
                          controller: nameController,
                        ),
                        TextField(
                          decoration: const InputDecoration(hintText: 'Code'),
                          controller: codeController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        BlocBuilder<CreateProductCategoryCubit,
                            CreateProductCategoryState>(builder: (ctx, state) {
                          if (state is CreateProductCategoryLoading) {
                            return Container(
                              height: 54,
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else {
                            return Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if (nameController.text.isEmpty &&
                                            codeController.text.isEmpty) {
                                        } else {
                                          print(nameController.text);
                                          print(codeController.text);
                                          context
                                              .read<
                                                  CreateProductCategoryCubit>()
                                              .create(nameController.text,
                                                  codeController.text);
                                          // print(fetchCountriesProvider.name);
                                          // Provider.of<FetchCountriesProvider>(context);
                                          // insert(<String, dynamic>{
                                          //   "name": nameController.text,
                                          //   "code": codeController.text
                                          // });
                                          // nameController.clear();
                                          // codeController.clear();
                                          // refetch?.call();
                                        }
                                      },
                                      child: const Text('Submit')),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                    "Result : \n ${state is CreateProductCategorySuccess ? 'Sukses' : state is CreateProductCategoryFailed ? state.errorMessage : 'null'}"),
                              ],
                            );
                          }
                        }),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
