import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_store/presentation/screens/details/detail_main.dart';

import '../../bloc/cubit/search_cubit.dart';

class SearchPage extends StatelessWidget {
  static const String id = '/search';
  SearchPage({Key? key}) : super(key: key);

  @override
  final Random random = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Search Page',
          style: Theme.of(context).primaryTextTheme.displayMedium,
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).iconTheme.color,
            )),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search by name',
              hintStyle: Theme.of(context)
                  .primaryTextTheme
                  .displayMedium!
                  .copyWith(fontSize: 14),
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) {
              BlocProvider.of<SearchCubit>(context).searchPetsByName(value);
            },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchCubitStates>(
              builder: (context, state) {
                if (state is SearchCubitInitial) {
                  return const Center(
                    child: Text('Write A Query'),
                  );
                }
                if (state is FoundData) {
                  var pets = state.data;
                  return ListView.builder(
                    itemCount: pets.length,
                    itemBuilder: (context, index) {
                      final pet = pets[index];
                      return ListTile(
                        leading: Hero(
                          tag: pet.id ?? 0,
                          child: Image.network(
                            pet.imageUrl ?? '',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          pet.name ?? '',
                          style:
                              Theme.of(context).primaryTextTheme.displayMedium,
                        ),
                        subtitle: Text(
                          pet.breed ?? '',
                          style:
                              Theme.of(context).primaryTextTheme.displayMedium,
                        ),
                        trailing: Text(
                          '\$${pet.price}',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .displayMedium
                              ?.copyWith(color: Colors.green),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, PetDetailPage.id,
                              arguments: {
                                'pet': pet,
                                'color': Color.fromRGBO(
                                    random.nextInt(256),
                                    random.nextInt(256),
                                    random.nextInt(256),
                                    1),
                              });
                        },
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('Data Not Found'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).canvasColor,
//       appBar: AppBar(
//         title: Text(
//           'Search Page',
//           style: Theme.of(context).primaryTextTheme.displayMedium,
//         ),
//         leading: IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: Icon(
//               Icons.arrow_back_ios,
//               color: Theme.of(context).iconTheme.color,
//             )),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             decoration: InputDecoration(
//               hintText: 'Search by name',
//               hintStyle: Theme.of(context)
//                   .primaryTextTheme
//                   .displayMedium!
//                   .copyWith(fontSize: 14, color: Colors.white),
//               border: const OutlineInputBorder(),
//             ),
//             onChanged: (value) {
//               BlocProvider.of<SearchCubit>(context).searchPetsByName(value);
//             },
//           ),
//           const SizedBox(height: 16),
//           Expanded(
//             child: BlocBuilder<SearchCubit, SearchCubitStates>(
//               builder: (context, state) {
//                 if (state is SearchCubitInitial) {
//                   return const Center(
//                     child: Text('Write A Query'),
//                   );
//                 }
//                 if (state is FoundData) {
//                   var pets = state.data;
//                   return ListView.builder(
//                     itemCount: pets.length,
//                     itemBuilder: (context, index) {
//                       final pet = pets[index];
//                       return ListTile(
//                         leading: Image.network(
//                           pet.imageUrl ?? '',
//                           width: 50,
//                           height: 50,
//                           fit: BoxFit.cover,
//                         ),
//                         title: Text(pet.name ?? ''),
//                         subtitle: Text(pet.breed ?? ''),
//                         trailing: Text('\$${pet.price}'),
//                         onTap: () {
//                           // Handle tap on pet
//                         },
//                       );
//                     },
//                   );
//                 } else {
//                   return const Center(
//                     child: Text('Data Not Found'),
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
