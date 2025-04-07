import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koi/home/presentation/manager/home_bloc.dart';
import 'package:koi/home/presentation/manager/home_events.dart';
import 'package:koi/home/presentation/manager/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
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
      appBar: AppBar(),
      body: BlocProvider(
        create:
            (context) =>
                HomeCubit()
                ,
        child: MultiBlocListener(
          listeners: [
            BlocListener<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state.isUserSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('get user Success')),
                  );
                }
              },
              listenWhen:
                  (previous, current) =>
                      previous.userStates != current.userStates,
            ),
            BlocListener<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state.isOrderSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('get order Success')),
                  );
                }
              },
              listenWhen:
                  (previous, current) =>
                      previous.orderStates != current.orderStates,
            ),
          ],
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              var list = state.data?? [];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        label: const Text('Enter your name'),
                      ),
                      onChanged:
                          (value) {
                            context.read<HomeCubit>().add(
                                SearchEvents(name: value));
                          },

                    ),
                    if(list.isNotEmpty && state.isSearchSuccess)
                        const Text('get data success state '),
                    if(state.isSearchLoading) const CircularProgressIndicator(),
                    if(state.isSearchFail) const Text('Some Thing went wrong'),
                    
                    

                    const SizedBox(height: 100, width: double.infinity),

                    if (state.isOrderLoading) const CircularProgressIndicator(),
                    if (state.isOrderSuccess)
                      const Text(
                        'Order',
                        style: TextStyle(color: Colors.red, fontSize: 30),
                      ),
                    if (state.isOrderFail) const Text('Some Thing went wrong'),
                    const SizedBox(height: 100, width: double.infinity),

                    if (state.isUserLoading) const CircularProgressIndicator(),
                    if (state.isUserSuccess)
                      const Text(
                        'user',
                        style: TextStyle(color: Colors.red, fontSize: 30),
                      ),
                    if (state.isUserFail) const Text('Some Thing went wrong'),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
