import 'package:flutter/material.dart';
import '../../domain/timer_preset.dart';

class PresetChips extends StatelessWidget {
  final List<TimerPreset> presets;
  final Duration selected;
  final ValueChanged<Duration> onSelected;

  const PresetChips({
    super.key,
    required this.presets,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: presets.map((p) {
        final isSelected = p.duration == selected;
        return ChoiceChip(
          label: Text('${p.label} (${p.duration.inMinutes}m)'),
          selected: isSelected,
          onSelected: (_) => onSelected(p.duration),
        );
      }).toList(),
    );
  }
}
