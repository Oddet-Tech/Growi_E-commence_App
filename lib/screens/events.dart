import 'package:flutter/material.dart';

class EventsAvailableScreen extends StatefulWidget {
  const EventsAvailableScreen({Key? key}) : super(key: key);

  @override
  State<EventsAvailableScreen> createState() => _EventsAvailableScreenState();
}

class _EventsAvailableScreenState extends State<EventsAvailableScreen> {
  final TextEditingController searchCtrl = TextEditingController();

  String selectedProvince = 'All';

  final List<String> provinces = [
    'All',
    'Gauteng',
    'Western Cape',
    'KwaZulu-Natal',
    'Eastern Cape',
    'Free State',
    'Limpopo',
    'Mpumalanga',
    'North West',
    'Northern Cape',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events Available'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// 🔍 Search Field
            TextField(
              controller: searchCtrl,
              decoration: InputDecoration(
                hintText: 'Search event name...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                // TODO: connect to Firebase query
                print('Searching for $value');
              },
            ),

            const SizedBox(height: 12),

            /// 🎯 Filters Row
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedProvince,
                    items: provinces
                        .map(
                          (p) => DropdownMenuItem(
                            value: p,
                            child: Text(p),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() => selectedProvince = value!);
                      // TODO: apply province filter
                    },
                    decoration: const InputDecoration(
                      labelText: 'Filter by Province',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                /// Future filters button
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    // TODO: open advanced filters
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// 📋 Events List
            Expanded(
              child: _buildEmptyState(),
            ),
          ],
        ),
      ),
    );
  }

  /// Empty / Placeholder State
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.event, size: 64, color: Colors.grey),
          SizedBox(height: 12),
          Text(
            'No events available',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
