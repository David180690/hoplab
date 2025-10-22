#!/bin/bash
echo "🔥 Removing ALL Docker resources (containers, images, volumes, networks, cache)..."
echo "⚠️  This will permanently delete ALL Docker data. Continue? (y/N)"
read -r confirm

if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
  echo "❌ Aborted."
  exit 1
fi

echo "🧽 Stopping all containers..."
docker stop $(docker ps -aq) 2>/dev/null

echo "🗑️ Removing all containers..."
docker rm -f $(docker ps -aq) 2>/dev/null

echo "🧱 Removing all images..."
docker rmi -f $(docker images -aq) 2>/dev/null

echo "📦 Removing all volumes..."
docker volume rm -f $(docker volume ls -q) 2>/dev/null

echo "🌐 Removing all networks (except default ones)..."
docker network prune -f

echo "🧹 Cleaning build cache..."
docker builder prune -af

echo "✅ Docker cleanup complete!"
