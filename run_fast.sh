#!/bin/bash

echo "🚀 تشغيل MASSA Frontend بالتوازي..."
cd "$(dirname "$0")/frontend"
if [ -f package.json ]; then
    [ -x "$(command -v npm)" ] && npm install && npm start &
else
    echo "⚠️ لا توجد واجهة Node/npm، افتح index.html بالمتصفح"
fi

echo "🚀 تشغيل MASSA Backend Services بالتوازي..."
cd "$(dirname "$0")/backend"
for f in $(find . -type f -name "*.sh"); do
    bash "$f" &
done

wait
echo "✅ MASSA تعمل بالكامل!"
