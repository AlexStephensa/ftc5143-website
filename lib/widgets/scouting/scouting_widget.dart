import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:Xcentrics/services/scouting_data_service.dart';

class ScoutingWidget extends StatefulWidget {
  const ScoutingWidget({super.key});

  @override
  State<ScoutingWidget> createState() => _ScoutingWidgetState();
}

class _ScoutingWidgetState extends State<ScoutingWidget> {
  late ScoutingData _scoutingData;
  late VideoPlayerController _videoController;
  late ScrollController _tableScrollController;
  String _selectedVideo = '';
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _tableScrollController = ScrollController();
    _loadScoutingData();
  }

  Future<void> _loadScoutingData() async {
    try {
      final data = await ScoutingDataService.loadScoutingData();
      setState(() {
        _scoutingData = data;
        _selectedVideo = data.defaultVideo.isNotEmpty
            ? data.defaultVideo
            : (data.autoVideos.isNotEmpty ? data.autoVideos.first.name : '');
        _isLoading = false;
        _errorMessage = null;
      });

      if (_selectedVideo.isNotEmpty) {
        _initializeVideo(_selectedVideo);
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error loading scouting data: $e';
      });
    }
  }

  void _initializeVideo(String videoName) {
    final selectedOption = _scoutingData.autoVideos
        .firstWhere((v) => v.name == videoName,
        orElse: () => _scoutingData.autoVideos.isNotEmpty
            ? _scoutingData.autoVideos.first
            : VideoOption(name: '', path: ''));

    if (selectedOption.path.isEmpty) return;

    _videoController = selectedOption.path.startsWith('http')
        ? VideoPlayerController.networkUrl(Uri.parse(selectedOption.path))
        : VideoPlayerController.asset(selectedOption.path);

    _videoController.initialize().then((_) {
      if (mounted) {
        setState(() {});
      }
    }).catchError((error) {
      debugPrint('Error initializing video: $error');
      if (mounted) {
        setState(() {
          _errorMessage = 'Error loading video: $error';
        });
      }
    });
  }

  @override
  void dispose() {
    _videoController.dispose();
    _tableScrollController.dispose();
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
    _initializeVideo(newValue);
  }

  Future<void> _refreshData() async {
    setState(() {
      _isLoading = true;
    });
    await _loadScoutingData();
  }

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 700;

    if (_isLoading) {
      return Container(
        padding: const EdgeInsets.all(16),
        color: Colors.black,
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    if (_errorMessage != null) {
      return Container(
        padding: const EdgeInsets.all(16),
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _refreshData,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with refresh button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Auto',
                  style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Tooltip(
                  message: 'Refresh scouting data from file',
                  child: IconButton(
                    icon: const Icon(Icons.refresh, color: Colors.white),
                    onPressed: _refreshData,
                  ),
                ),
              ],
            ),
            // Last updated timestamp
            Text(
              'Last updated: ${_scoutingData.lastUpdated.toString().split('.').first}',
              style: const TextStyle(color: Colors.white54, fontSize: 12),
            ),
            const SizedBox(height: 12),
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: _videoController.value.isInitialized ? _videoController.value.aspectRatio : 16 / 9,
                    child: _videoController.value.isInitialized
                        ? Stack(
                            alignment: Alignment.center,
                            children: [
                              VideoPlayer(_videoController),
                              // Play/Pause overlay button
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _videoController.value.isPlaying
                                        ? _videoController.pause()
                                        : _videoController.play();
                                  });
                                },
                                child: Container(
                                  color: Colors.black26,
                                  child: Icon(
                                    _videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const Center(
                            child: CircularProgressIndicator(color: Colors.white),
                          ),
                  ),
                  // Progress indicator
                  if (_videoController.value.isInitialized)
                    VideoProgressIndicator(
                      _videoController,
                      allowScrubbing: true,
                      colors: const VideoProgressColors(
                        playedColor: Colors.red,
                        bufferedColor: Colors.grey,
                        backgroundColor: Color(0xFF1B1B1B),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            if (_scoutingData.autoVideos.isNotEmpty)
              DropdownButtonFormField<String>(
                value: _selectedVideo,
                dropdownColor: const Color(0xFF2D2D2D),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFF2D2D2D),
                  border: OutlineInputBorder(),
                  labelText: 'Select Auto Video',
                  labelStyle: TextStyle(color: Colors.white70),
                ),
                iconEnabledColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                items: _scoutingData.autoVideos
                    .map(
                      (video) => DropdownMenuItem<String>(
                        value: video.name,
                        child: Text(video.name),
                      ),
                    )
                    .toList(),
                onChanged: _changeVideo,
              ),
            const SizedBox(height: 16),
            Text(
              _scoutingData.autoDescription,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Teleop',
              style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            if (_scoutingData.teleopStats.isNotEmpty)
              Scrollbar(
                controller: _tableScrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: _tableScrollController,
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: isNarrow ? 520 : 640),
                    child: DataTable(
                      headingRowColor: WidgetStateProperty.all(const Color(0xFF1B1B1B)),
                      dataRowColor: WidgetStateProperty.all(const Color(0xFF111111)),
                      columns: const [
                        DataColumn(label: _HeaderCell('Stat')),
                        DataColumn(label: _HeaderCell('Value')),
                      ],
                      rows: _scoutingData.teleopStats
                          .map(
                            (stat) => DataRow(
                              cells: [
                                DataCell(_BodyCell(stat.label)),
                                DataCell(_BodyCell(stat.value)),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              )
            else
              const Text(
                'No teleop stats available.',
                style: TextStyle(color: Colors.white70),
              ),
          ],
        ),
      ),
    );
  }
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
