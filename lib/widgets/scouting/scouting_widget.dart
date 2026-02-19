import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ScoutingWidget extends StatefulWidget {
  const ScoutingWidget({super.key});

  @override
  State<ScoutingWidget> createState() => _ScoutingWidgetState();
}

class _ScoutingWidgetState extends State<ScoutingWidget> {
  static const Map<String, String> _autoVideos = <String, String>{
    'Close Red': 'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
    'Close Blue': 'https://samplelib.com/lib/preview/mp4/sample-10s.mp4',
    'Far Red': 'https://samplelib.com/lib/preview/mp4/sample-15s.mp4',
    'Far Blue': 'https://samplelib.com/lib/preview/mp4/sample-20s.mp4',
  };

  final List<_StatRow> _teleopStats = <_StatRow>[
    _StatRow(label: 'Avg Cycles', value: '7.4'),
    _StatRow(label: 'High Goals', value: '28'),
    _StatRow(label: 'Low Goals', value: '12'),
    _StatRow(label: 'Penalties', value: '2'),
  ];

  late VideoPlayerController _videoController;
  String _selectedVideo = _autoVideos.keys.first;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(_autoVideos[_selectedVideo]!),
    )..initialize().then((_) {
        if (mounted) {
          setState(() {});
        }
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  Future<void> _changeVideo(String? newValue) async {
    if (newValue == null || newValue == _selectedVideo) {
      return;
    }
    setState(() {
      _selectedVideo = newValue;
    });
    await _videoController.pause();
    await _videoController.dispose();
    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(_autoVideos[_selectedVideo]!),
    );
    await _videoController.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Auto',
            style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          AspectRatio(
            aspectRatio: _videoController.value.isInitialized ? _videoController.value.aspectRatio : 16 / 9,
            child: _videoController.value.isInitialized
                ? VideoPlayer(_videoController)
                : const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _selectedVideo,
            dropdownColor: const Color(0xFF1B1B1B),
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color(0xFF1B1B1B),
              border: OutlineInputBorder(),
            ),
            iconEnabledColor: Colors.white,
            style: const TextStyle(color: Colors.white),
            items: _autoVideos.keys
                .map(
                  (label) => DropdownMenuItem<String>(
                    value: label,
                    child: Text(label),
                  ),
                )
                .toList(),
            onChanged: _changeVideo,
          ),
          const SizedBox(height: 16),
          const Text(
            'Auto description goes here. Summarize starting position, scoring pattern, and any reliability notes.',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 24),
          const Text(
            'Teleop',
            style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: DataTable(
                  headingRowColor: WidgetStateProperty.all(const Color(0xFF1B1B1B)),
                  dataRowColor: WidgetStateProperty.all(const Color(0xFF111111)),
                  columns: const [
                    DataColumn(label: _HeaderCell('Stat')),
                    DataColumn(label: _HeaderCell('Value')),
                  ],
                  rows: _teleopStats
                      .map(
                        (row) => DataRow(
                          cells: [
                            DataCell(_BodyCell(row.label)),
                            DataCell(_BodyCell(row.value)),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatRow {
  final String label;
  final String value;

  const _StatRow({required this.label, required this.value});
}

class _HeaderCell extends StatelessWidget {
  final String text;

  const _HeaderCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}

class _BodyCell extends StatelessWidget {
  final String text;
  final int maxLines;

  const _BodyCell(this.text, {this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxLines > 1 ? 260 : null,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
