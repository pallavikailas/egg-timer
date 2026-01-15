class TimerPreset {
  final String label;
  final Duration duration;

  const TimerPreset(this.label, this.duration);
}

const defaultPresets = <TimerPreset>[
  TimerPreset('Soft', Duration(minutes: 4)),
  TimerPreset('Medium', Duration(minutes: 7)),
  TimerPreset('Hard', Duration(minutes: 10)),
];
