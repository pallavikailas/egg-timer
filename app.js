const timeEl = document.getElementById("time");
const progressEl = document.getElementById("progress");
const ding = document.getElementById("ding");

const startBtn = document.getElementById("start");
const pauseBtn = document.getElementById("pause");
const resetBtn = document.getElementById("reset");

let totalSeconds = 5 * 60;
let remainingSeconds = totalSeconds;
let timerId = null;

function formatTime(sec) {
  const m = Math.floor(sec / 60);
  const s = sec % 60;
  return `${String(m).padStart(2,"0")}:${String(s).padStart(2,"0")}`;
}

function render() {
  timeEl.textContent = formatTime(remainingSeconds);
  const done = totalSeconds === 0 ? 0 : (1 - remainingSeconds / totalSeconds);
  progressEl.style.width = `${Math.max(0, Math.min(1, done)) * 100}%`;
}

function setTime(minutes) {
  totalSeconds = minutes * 60;
  remainingSeconds = totalSeconds;
  stopTimer();
  render();
}

function startTimer() {
  if (timerId) return;
  startBtn.disabled = true;
  pauseBtn.disabled = false;

  timerId = setInterval(() => {
    remainingSeconds -= 1;
    render();

    if (remainingSeconds <= 0) {
      stopTimer();
      remainingSeconds = 0;
      render();
      try { ding.play(); } catch {}
      alert("Eggs are ready! 🥚");
    }
  }, 1000);
}

function stopTimer() {
  if (timerId) clearInterval(timerId);
  timerId = null;
  startBtn.disabled = false;
  pauseBtn.disabled = true;
}

function resetTimer() {
  stopTimer();
  remainingSeconds = totalSeconds;
  render();
}

document.querySelectorAll(".presets button").forEach(btn => {
  btn.addEventListener("click", () => setTime(parseInt(btn.dataset.min, 10)));
});

startBtn.addEventListener("click", startTimer);
pauseBtn.addEventListener("click", stopTimer);
resetBtn.addEventListener("click", resetTimer);

render();
