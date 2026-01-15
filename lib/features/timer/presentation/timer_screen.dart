import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/timer_controller.dart';
import '../application/timer_state.dart';
import '../../timer/domain/timer_preset.dart';
import '../../../shared/utils/duration_format.dart';
import 'widgets/cute_illustration.dart';
import 'widgets/preset_chips.dart';
import 'widgets/primary_controls.dart';
import 'widgets/big_time_display.dart';

class TimerScreen extends ConsumerWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(timerControllerProvider);
    final controller = ref.read(timerControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Egg Timer'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CuteIllustration(),
              const SizedBox(height: 16),

              BigTimeDisplay(text: formatDuration(state.remaining)),
              const SizedBox(height: 12),

              PresetChips(
                presets: defaultPresets,
                selected: state.total,
                onSelected: (d) => controller.setTotal(d),
              ),
              const SizedBox(height: 12),

              _CustomTimeRow(
                onSet: (m, s) =>
                    controller.setTotal(Duration(minutes: m, seconds: s)),
              ),
              const Spacer(),

              PrimaryControls(
                status: state.status,
                onStart: controller.start,
                onPause: controller.pause,
                onResume: controller.resume,
                onReset: controller.reset,
              ),

              if (state.status == TimerStatus.finished) ...[
                const SizedBox(height: 12),
                Text(
                  "Done! 🥚✨",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomTimeRow extends StatefulWidget {
  final void Function(int minutes, int seconds) onSet;
  const _CustomTimeRow({required this.onSet});

  @override
  State<_CustomTimeRow> createState() => _CustomTimeRowState();
}

class _CustomTimeRowState extends State<_CustomTimeRow> {
  final _min = TextEditingController(text: '7');
  final _sec = TextEditingController(text: '0');

  @override
  void dispose() {
    _min.dispose();
    _sec.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _min,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Minutes'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: _sec,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Seconds'),
              ),
            ),
            const SizedBox(width: 12),
            FilledButton(
              onPressed: () {
                final m = int.tryParse(_min.text) ?? 0;
                final s = int.tryParse(_sec.text) ?? 0;
                widget.onSet(m.clamp(0, 999), s.clamp(0, 59));
              },
              child: const Text('Set'),
            ),
          ],
        ),
      ),
    );
  }
}
