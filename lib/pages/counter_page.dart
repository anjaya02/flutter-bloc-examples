import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter/counter.dart';

/// Counter page demonstrating basic BLoC usage
///
/// This page shows:
/// - How to provide a BLoC to the widget tree
/// - How to listen to state changes with BlocBuilder
/// - How to handle different state types
/// - How to dispatch events to the BLoC
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with BLoC'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocListener<CounterBloc, CounterState>(
        listener: (context, state) {
          // Handle side effects here (like showing snackbars, navigation, etc.)
          if (state is CounterError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStateDisplay(state),
                  const SizedBox(height: 40),
                  _buildControls(context),
                  const SizedBox(height: 20),
                  _buildAdvancedControls(context),
                  const SizedBox(height: 20), // Extra space at bottom
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStateDisplay(CounterState state) {
    if (state is CounterLoading) {
      return const Column(
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Processing...'),
        ],
      );
    }

    if (state is CounterError) {
      return Column(
        children: [
          const Icon(Icons.error, color: Colors.red, size: 48),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Error: ${state.message}',
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }

    if (state is CounterValue) {
      return Column(
        children: [
          FittedBox(
            child: Text(
              '${state.value}',
              style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            children: [
              Chip(
                label: Text(state.isEven ? 'Even' : 'Odd'),
                backgroundColor: state.isEven
                    ? Colors.blue[100]
                    : Colors.orange[100],
              ),
              Chip(
                label: Text(state.status),
                backgroundColor: _getStatusColor(state.status),
              ),
            ],
          ),
        ],
      );
    }

    // Initial state
    return const Column(
      children: [
        FittedBox(
          child: Text(
            '0',
            style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 16),
        Text('Press a button to start'),
      ],
    );
  }

  Widget _buildControls(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () {
            context.read<CounterBloc>().add(const CounterDecrement());
          },
          heroTag: 'decrement',
          child: const Icon(Icons.remove),
        ),
        FloatingActionButton(
          onPressed: () {
            context.read<CounterBloc>().add(const CounterReset());
          },
          heroTag: 'reset',
          backgroundColor: Colors.grey,
          child: const Icon(Icons.refresh),
        ),
        FloatingActionButton(
          onPressed: () {
            context.read<CounterBloc>().add(const CounterIncrement());
          },
          heroTag: 'increment',
          child: const Icon(Icons.add),
        ),
      ],
    );
  }

  Widget _buildAdvancedControls(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Advanced Controls',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(
                        const CounterSetValue(10),
                      );
                    },
                    child: const Text('Set to 10', textAlign: TextAlign.center),
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(
                        const CounterSetValue(50),
                      );
                    },
                    child: const Text('Set to 50', textAlign: TextAlign.center),
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(
                        const CounterSetValue(-25),
                      );
                    },
                    child: const Text(
                      'Set to -25',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {
                      // This will trigger an error
                      context.read<CounterBloc>().add(
                        const CounterSetValue(150),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      'Set to 150\n(Error)',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Zero':
        return Colors.grey[200]!;
      case 'Low':
        return Colors.green[100]!;
      case 'Medium':
        return Colors.yellow[100]!;
      case 'High':
        return Colors.red[100]!;
      case 'Negative Low':
        return Colors.blue[100]!;
      case 'Negative Medium':
        return Colors.indigo[100]!;
      case 'Negative High':
        return Colors.purple[100]!;
      default:
        return Colors.grey[100]!;
    }
  }
}
