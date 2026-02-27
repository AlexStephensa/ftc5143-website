// lib/views/pit_scouting_view.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xcentrics/widgets/centered_view/centered_view.dart';
import 'package:xcentrics/widgets/navagation_Bar/navagation_bar.dart';
import 'package:xcentrics/services/appwrite_service.dart';

class PitScoutingView extends StatefulWidget {
  const PitScoutingView({super.key});

  @override
  State<PitScoutingView> createState() => _PitScoutingViewState();
}

class _PitScoutingViewState extends State<PitScoutingView> {
  final _teamNumberController  = TextEditingController();
  final _teamNameController    = TextEditingController();
  final _weightController      = TextEditingController();
  final _drivetrainController  = TextEditingController();
  final _autoCloseBlueCon      = TextEditingController();
  final _autoCloseRedCon       = TextEditingController();
  final _autoFarBlueCon        = TextEditingController();
  final _autoFarRedCon         = TextEditingController();
  final _strengthsController   = TextEditingController();
  final _weaknessesController  = TextEditingController();
  final _notesController       = TextEditingController();

  bool _canShoot     = false;
  bool _canSort      = false;
  bool _hasAuto      = false;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _teamNumberController.dispose();
    _teamNameController.dispose();
    _weightController.dispose();
    _drivetrainController.dispose();
    _autoCloseBlueCon.dispose();
    _autoCloseRedCon.dispose();
    _autoFarBlueCon.dispose();
    _autoFarRedCon.dispose();
    _strengthsController.dispose();
    _weaknessesController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final teamNumber = int.tryParse(_teamNumberController.text.trim());
    if (teamNumber == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Team number must be a valid integer.')),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      await AppwriteService.instance.submitPitScouting(
        PitScoutingEntry(
          teamNumber:     teamNumber,
          teamName:       _teamNameController.text.trim(),
          robotWeight:    _weightController.text.trim(),
          drivetrainType: _drivetrainController.text.trim(),
          canShoot:       _canShoot,
          canSort:        _canSort,
          hasAuto:        _hasAuto,
          autoCloseBlue:  _autoCloseBlueCon.text.trim(),
          autoCloseRed:   _autoCloseRedCon.text.trim(),
          autoFarBlue:    _autoFarBlueCon.text.trim(),
          autoFarRed:     _autoFarRedCon.text.trim(),
          strengths:      _strengthsController.text.trim(),
          weaknesses:     _weaknessesController.text.trim(),
          notes:          _notesController.text.trim(),
        ),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('✅ Pit entry submitted!')),
        );
        _resetForm();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('❌ Submit failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  void _resetForm() {
    _teamNumberController.clear();
    _teamNameController.clear();
    _weightController.clear();
    _drivetrainController.clear();
    _autoCloseBlueCon.clear();
    _autoCloseRedCon.clear();
    _autoFarBlueCon.clear();
    _autoFarRedCon.clear();
    _strengthsController.clear();
    _weaknessesController.clear();
    _notesController.clear();
    setState(() {
      _canShoot = false;
      _canSort  = false;
      _hasAuto  = false;
    });
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
                          const Text('Pit Scouting',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          const SizedBox(height: 16),
          
                          // ── Team Info ───────────────────────────────────────
                          _sectionLabel('Team Info'),
                          _darkField(_teamNumberController, 'Team Number *',
                              keyboardType: TextInputType.number),
                          const SizedBox(height: 8),
                          _darkField(_teamNameController, 'Team Name'),
          
                          // ── Robot Specs ─────────────────────────────────────
                          const SizedBox(height: 16),
                          _sectionLabel('Robot Specs'),
                          _darkField(_weightController, 'Robot Weight (lbs)',
                              keyboardType: TextInputType.number),
                          const SizedBox(height: 8),
                          _darkField(_drivetrainController,
                              'Drivetrain Type (e.g. Swerve, Tank)'),
          
                          // ── Capabilities ────────────────────────────────────
                          const SizedBox(height: 16),
                          _sectionLabel('Capabilities'),
                          _darkSwitch('Can Shoot', _canShoot,
                                  (v) => setState(() => _canShoot = v)),
                          _darkSwitch('Can Sort', _canSort,
                                  (v) => setState(() => _canSort = v)),
                          _darkSwitch('Has Autonomous Routine', _hasAuto,
                                  (v) => setState(() => _hasAuto = v)),
          
                          // ── Auto Routes ─────────────────────────────────────
                          if (_hasAuto) ...[
                            const SizedBox(height: 16),
                            _sectionLabel('Auto Routes'),
                            Row(
                              children: [
                                Expanded(
                                  child: _darkField(
                                    _autoCloseBlueCon, 'Close Blue',
                                    maxLines: 3,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: _darkField(
                                    _autoCloseRedCon, 'Close Red',
                                    maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: _darkField(
                                    _autoFarBlueCon, 'Far Blue',
                                    maxLines: 3,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: _darkField(
                                    _autoFarRedCon, 'Far Red',
                                    maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                          ],
          
                          // ── Strengths & Weaknesses ──────────────────────────
                          const SizedBox(height: 16),
                          _sectionLabel('Strengths & Weaknesses'),
                          _darkField(_strengthsController, 'Strengths',
                              maxLines: 3),
                          const SizedBox(height: 8),
                          _darkField(_weaknessesController, 'Weaknesses',
                              maxLines: 3),
          
                          // ── Notes ───────────────────────────────────────────
                          const SizedBox(height: 16),
                          _sectionLabel('Additional Notes'),
                          _darkField(_notesController, 'Notes', maxLines: 4),
          
                          // ── Submit ──────────────────────────────────────────
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
    padding: const EdgeInsets.only(bottom: 8),
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

  Widget _darkSwitch(String label, bool value, ValueChanged<bool> onChanged) =>
      SwitchListTile(
        title: Text(label, style: const TextStyle(color: Colors.white)),
        value: value,
        onChanged: onChanged,
        activeColor: Colors.white,
        inactiveTrackColor: Colors.white24,
        contentPadding: EdgeInsets.zero,
      );
}