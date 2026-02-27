import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScoutingWidget extends StatefulWidget {
  const ScoutingWidget({super.key});

  @override
  State<ScoutingWidget> createState() => _ScoutingWidgetState();
}

class _ScoutingWidgetState extends State<ScoutingWidget> {
  static const Map<String, String> _autoImages = <String, String>{
    'Big Triangle Red': 'assets/images/close_red_auto.png',
    'Big Triangle Blue': 'assets/images/close_blue_auto.png',
    'Small Triangle Red': 'assets/images/far_red_auto.png',
    'Small Triangle Blue': 'assets/images/auto_far_blue.png',
  };

  final List<_StatRow> _teleopStats = <_StatRow>[
    _StatRow(label: 'Prefered scoring position', value: 'top big triangle'),
    _StatRow(label: 'High Goals', value: '28'),
    _StatRow(label: 'Low Goals', value: '12'),
    _StatRow(label: 'Penalties', value: '2'),
  ];

  final ScrollController _scrollController = ScrollController();
  String _selectedImage = _autoImages.keys.first;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _changeImage(String? newValue) {
    if (newValue == null || newValue == _selectedImage) {
      return;
    }
    setState(() {
      _selectedImage = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFF121212),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Auto',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(maxHeight: 500),
                  child: Image.asset(
                    _autoImages[_selectedImage]!,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 300,
                        color: const Color(0xFF1B1B1B),
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_not_supported,
                                color: Colors.white54,
                                size: 48,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Image not found',
                                style: TextStyle(color: Colors.white54),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: _selectedImage,
              dropdownColor: const Color(0xFF1B1B1B),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFF1B1B1B),
                border: OutlineInputBorder(),
              ),
              iconEnabledColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              items: _autoImages.keys
                  .map(
                    (label) => DropdownMenuItem<String>(
                      value: label,
                      child: Text(label),
                    ),
                  )
                  .toList(),
              onChanged: _changeImage,
            ),
            const SizedBox(height: 16),
            const Text(
              'We have a strong auto this season, with consistent performance in both the big and small triangle zones. We reliably get 8 or 9 balls in auto, with a focus on compatibility with alliance partners. We have a slight preference for the big triangle, but can easily switch to the small triangle if needed.',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Teleop',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            LayoutBuilder(
              builder: (context, constraints) {
                final bool isMobile = constraints.maxWidth < 700;
                final double columnWidth = isMobile
                    ? constraints.maxWidth
                    : 300;

                return Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 24,
                  runSpacing: 12,
                  children: [
                    SizedBox(
                      width: columnWidth,
                      child: Column(
                        children: [
                          Text(
                            'Scoring Positions',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Small triangle',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Top big triangle (prefered)',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Big triangle',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: columnWidth,
                      child: Column(
                        children: [
                          Text(
                            'Shooting Acuracy',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '50%',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '80%',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '70%',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            Text(
              'Robot Specs',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                final bool isMobile = constraints.maxWidth < 700;
                final double columnWidth = isMobile
                    ? constraints.maxWidth
                    : 300;

                return Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 24,
                  runSpacing: 12,
                  children: [
                    SizedBox(
                      width: columnWidth,
                      child: Column(
                        children: [
                          Text(
                            'Parts',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Small triangle',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Size',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Weight',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: columnWidth,
                      child: Column(
                        children: [
                          Text(
                            'Stats',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '450 RPM',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '17x17x14',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '26 lbs',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () => context.go('/home'),
                    child: Text(
                      'Scouting Home',
                      style: TextStyle(color: Colors.white),
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

class _StatRow {
  final String label;
  final String value;

  const _StatRow({required this.label, required this.value});
}
