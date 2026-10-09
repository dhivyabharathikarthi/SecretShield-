#!/bin/sh
set -e

# If DATABASE_URL is provided, attempt to push any schema migrations
if [ -n "$DATABASE_URL" ]; then
  echo "[SecretShield Docker] Database connection string detected."
  echo "[SecretShield Docker] Syncing PostgreSQL schema with drizzle-kit..."
  npm run db:push || echo "[SecretShield Docker] Warning: Schema push failed or database is still spinning up. Server will continue."
fi

# Hand over to CMD (npm start)
exec "$@"
