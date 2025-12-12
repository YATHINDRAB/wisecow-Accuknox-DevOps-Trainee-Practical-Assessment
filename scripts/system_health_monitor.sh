#!/usr/bin/env bash
LOGFILE=${1:-./artifacts/system_monitor.log}
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80
PROCESS_NAME=${2:-"wisecow.sh"}

timestamp() { date +"%Y-%m-%d %H:%M:%S"; }

mkdir -p $(dirname "$LOGFILE")
echo "$(timestamp) - Starting health check" >> "$LOGFILE"

CPU=$(top -bn1 | awk '/Cpu/ {usage=100-$8; print int(usage)}')
echo "$(timestamp) CPU: ${CPU}%" | tee -a "$LOGFILE"
if [ "$CPU" -ge "$CPU_THRESHOLD" ]; then
  echo "$(timestamp) ALERT: CPU usage ${CPU}% >= ${CPU_THRESHOLD}%" | tee -a "$LOGFILE"
fi

MEM_USED=$(free -m | awk '/Mem:/ {print $3}')
MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEM_USAGE=$(( 100 * MEM_USED / MEM_TOTAL ))
echo "$(timestamp) Memory usage: ${MEM_USAGE}%" | tee -a "$LOGFILE"
if [ "$MEM_USAGE" -ge "$MEM_THRESHOLD" ]; then
  echo "$(timestamp) ALERT: Memory usage ${MEM_USAGE}% >= ${MEM_THRESHOLD}%" | tee -a "$LOGFILE"
fi

DISK=$(df -h / | awk 'NR==2 {gsub("%","",$5); print $5}')
echo "$(timestamp) Disk usage: ${DISK}%" | tee -a "$LOGFILE"
if [ "$DISK" -ge "$DISK_THRESHOLD" ]; then
  echo "$(timestamp) ALERT: Disk usage ${DISK}% >= ${DISK_THRESHOLD}%" | tee -a "$LOGFILE"
fi

if pgrep -f "$PROCESS_NAME" >/dev/null; then
  echo "$(timestamp) Process $PROCESS_NAME is running" | tee -a "$LOGFILE"
else
  echo "$(timestamp) ALERT: Process $PROCESS_NAME is NOT running" | tee -a "$LOGFILE"
fi

echo "$(timestamp) - Health check completed" >> "$LOGFILE"

