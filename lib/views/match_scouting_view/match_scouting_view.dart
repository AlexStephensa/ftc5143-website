// lib/views/match_scouting_view.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xcentrics/widgets/centered_view/centered_view.dart';
import 'package:xcentrics/widgets/navagation_Bar/navagation_bar.dart';
import 'package:xcentrics/services/appwrite_service.dart';

class MatchScoutingView extends StatefulWidget {
  const MatchScoutingView({super.key});

  @override
  State<MatchScoutingView> createState() => _MatchScoutingViewState();
}

class _MatchScoutingViewState extends State<MatchScoutingView> {
  final _matchController = TextEditingController();
  final _teamController  = TextEditingController();
  final _notesController = TextEditingController();

  final _autoAttempted   = CounterModel();
  final _autoMade        = CounterModel();
  final _teleopAttempted = CounterModel();
  final _teleopMade      = CounterModel();

  String _parkStatus = 'none';
  bool _isSubmitting = false;

  @override
  void dispose() {
    _matchController.dispose();
    _teamController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final matchNumber = int.tryParse(_matchController.text.trim());
    final teamNumber  = int.tryParse(_teamController.text.trim());

    if (matchNumber == null || teamNumber == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Match number and team number must be valid integers.')),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      await AppwriteService.instance.submitMatchScouting(
        MatchScoutingEntry(
          matchNumber:          matchNumber,
          teamNumber:           teamNumber,
          autoShotsAttempted:   _autoAttempted.count,
          autoShotsMade:        _autoMade.count,
          teleopShotsAttempted: _teleopAttempted.count,
          teleopShotsMade:      _teleopMade.count,
          parkStatus:           _parkStatus,
          notes:                _notesController.text.trim(),
        ),
      );

      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('✅ Match entry submitted!')));
        _resetForm();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('❌ Submit failed: $e')));
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  void _resetForm() {
    _matchController.clear();
    _teamController.clear();
    _notesController.clear();
    _autoAttempted.reset();
    _autoMade.reset();
    _teleopAttempted.reset();
    _teleopMade.reset();
    setState(() => _parkStatus = 'none');
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF121212),
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: CenteredView(
          child: Column(
            children: [
              NavagationBar(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 520),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text('Match Scouting',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          const SizedBox(height: 16),
          
                          // ── Match / Team ──────────────────────────────────
                          _darkField(_matchController, 'Match Number',
                              keyboardType: TextInputType.number),
                          const SizedBox(height: 8),
                          _darkField(_teamController, 'Team Number',
                              keyboardType: TextInputType.number),
          
                          // ── Auto ──────────────────────────────────────────
                          const SizedBox(height: 20),
                          _sectionLabel('Auto'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Counter(title: 'Shots Attempted', model: _autoAttempted),
                              Counter(title: 'Shots Made',      model: _autoMade),
                            ],
                          ),
          
                          // ── Teleop ────────────────────────────────────────
                          _sectionLabel('Teleop'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Counter(title: 'Shots Attempted', model: _teleopAttempted),
                              Counter(title: 'Shots Made',      model: _teleopMade),
                            ],
                          ),
          
                          // ── Endgame ───────────────────────────────────────
                          _sectionLabel('Endgame'),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _ParkButton(label: 'Full Park',    value: 'full',    selected: _parkStatus, onTap: (v) => setState(() => _parkStatus = v)),
                              const SizedBox(width: 8),
                              _ParkButton(label: 'Partial Park', value: 'partial', selected: _parkStatus, onTap: (v) => setState(() => _parkStatus = v)),
                              const SizedBox(width: 8),
                              _ParkButton(label: 'No Park',      value: 'none',    selected: _parkStatus, onTap: (v) => setState(() => _parkStatus = v)),
                            ],
                          ),
          
                          // ── Notes ─────────────────────────────────────────
                          const SizedBox(height: 16),
                          _darkField(_notesController, 'Notes', maxLines: 4),
          
                          // ── Submit ────────────────────────────────────────
                          const SizedBox(height: 24),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            onPressed: _isSubmitting ? null : _submit,
                            child: _isSubmitting
                                ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                    strokeWidth: 2, color: Colors.black))
                                : const Text('Submit',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            onPressed: () => context.go('/home'),
                            child: const Text('<- Go Back',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Text(text,
        style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white70)),
  );

  Widget _darkField(
      TextEditingController controller,
      String label, {
        TextInputType keyboardType = TextInputType.text,
        int maxLines = 1,
      }) =>
      TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white54),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white24),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70),
          ),
          filled: true,
          fillColor: const Color(0xFF1E1E1E),
          alignLabelWithHint: maxLines > 1,
        ),
      );
}

// ── Park toggle button ────────────────────────────────────────────────────────

class _ParkButton extends StatelessWidget {
  final String label;
  final String value;
  final String selected;
  final ValueChanged<String> onTap;

  const _ParkButton({
    required this.label,
    required this.value,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == selected;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.white : const Color(0xFF2A2A2A),
        foregroundColor: isSelected ? Colors.black : Colors.white70,
        side: const BorderSide(color: Colors.white24),
      ),
      onPressed: () => onTap(value),
      child: Text(label),
    );
  }
}

// ── Counter widget ────────────────────────────────────────────────────────────

class Counter extends StatelessWidget {
  final String title;
  final CounterModel model;

  const Counter({super.key, required this.title, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(title,
              style: const TextStyle(color: Colors.white70, fontSize: 13)),
          IconButton(
            onPressed: model.increment,
            icon: const Icon(Icons.arrow_drop_up, color: Colors.white, size: 32),
          ),
          ListenableBuilder(
            listenable: model,
            builder: (_, __) => Text(
              model.count.toString(),
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          IconButton(
            onPressed: model.decrement,
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white, size: 32),
          ),
        ],
      ),
    );
  }
}

// ── Counter model ─────────────────────────────────────────────────────────────

class CounterModel with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() { _count++;              notifyListeners(); }
  void decrement() { if (_count > 0) _count--; notifyListeners(); }
  void reset()     { _count = 0;            notifyListeners(); }
}