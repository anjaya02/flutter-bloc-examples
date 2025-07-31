import 'package:flutter/material.dart';
import 'counter_page.dart';
import 'todo_page.dart';

/// Home page that demonstrates BLoC pattern examples
/// 
/// This page provides navigation to different BLoC examples:
/// - Simple Counter BLoC (basic state management)
/// - Todo List BLoC (complex state management)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Pattern Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'BLoC State Management Examples',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Explore different examples of BLoC pattern implementation for state management in Flutter.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: 350, // Increased height for taller cards
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio:
                    0.85, // Makes cards taller (less than 1 = taller)
                children: [
                  _buildExampleCard(
                    context,
                    title: 'Counter BLoC',
                    description:
                        'Simple state management with basic events and states',
                    icon: Icons.add_circle,
                    color: Colors.blue,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CounterPage(),
                      ),
                    ),
                  ),
                  _buildExampleCard(
                    context,
                    title: 'Todo BLoC',
                    description:
                        'Complex state management with CRUD operations and filtering',
                    icon: Icons.check_circle,
                    color: Colors.green,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TodoPage()),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildInfoSection(),
            const SizedBox(height: 32), // Extra space at bottom
          ],
        ),
      ),
    );
  }

  Widget _buildExampleCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20), // Increased padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color), // Reduced icon size
              const SizedBox(height: 12), // Reduced space
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16, // Slightly smaller title
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 2, // Allow title to wrap
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8), // Reduced space
              Expanded(
                // Use Expanded instead of Flexible
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.center,
                  maxLines: 5, // More lines for description
                  overflow: TextOverflow.visible, // Allow text to show
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About BLoC Pattern',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'BLoC (Business Logic Component) is a state management pattern that:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            const Text('• Separates business logic from UI'),
            const Text('• Makes code testable and reusable'),
            const Text('• Uses Streams and Events for reactive programming'),
            const Text('• Provides predictable state management'),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.info, size: 16, color: Colors.blue[600]),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Tap on the cards above to explore different BLoC implementations.',
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue[600],
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
}
