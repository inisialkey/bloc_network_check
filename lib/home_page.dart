import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/network/network_bloc.dart';
import 'bloc/network/network_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<NetworkBloc, NetworkState>(
          builder: (context, state) {
            if (state is NetworkFailure) {
              return const Text('No Internet Connection');
            } else if (state is NetworkSuccess) {
              return const Text("You're Connected to Internet");
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
