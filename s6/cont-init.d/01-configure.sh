#!/bin/sh

function log() {
  echo "[01-configure] $1"
}

STREAM_KEY=${DASH_STREAM_KEY:-.*}
PROJECT_NAME=${DASH_PROJECT_NAME:-Stream}
LIVE_DELAY=${DASH_LIVE_DELAY:-2}
LATENCY_MIN_DRIFT=${DASH_LATENCY_MIN_DRIFT:-0.05}
CATCHUP_PLAYBACK_RATE=${DASH_CATCHUP_PLAYBACK_RATE:-0.2}

log "Setting allowed stream key to: ${STREAM_KEY}"
#sed -i "s/__STREAM_KEY__/${STREAM_KEY}/g" /opt/nginx/nginx.conf;
sed -i "s/__STREAM_KEY__/${STREAM_KEY}/g" /etc/nginx/nginx.conf.template;

log "Setting HTML project name to: ${PROJECT_NAME}";
sed -i "s/__PROJECT__/${PROJECT_NAME}/g" /var/www/index.html;

log "Setting dash.js LiveDelay to: ${LIVE_DELAY}";
sed -i "s/__LIVE_DELAY__/${LIVE_DELAY}/g" /var/www/index.html;

log "Setting dash.js LowLatencyMinDrift: ${LATENCY_MIN_DRIFT}";
sed -i "s/__LATENCY_MIN_DRIFT__/${LATENCY_MIN_DRIFT}/g" /var/www/index.html;

log "Setting dash.js CatchUpPlaybackRate to: ${CATCHUP_PLAYBACK_RATE}";
sed -i "s/__CATCHUP_PLAYBACK_RATE__/${CATCHUP_PLAYBACK_RATE}/g" /var/www/index.html;

log "Setup complete. Stream to rtmp://HOST_IP/stream/${STREAM_KEY}";
