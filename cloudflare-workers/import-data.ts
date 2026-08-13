// Generate D1 import SQL and verification SQL from supabase-export.json.

import * as fs from 'fs';

const data = JSON.parse(fs.readFileSync('supabase-export.json', 'utf-8')) as Record<string, Record<string, unknown>[]>;

const importOrder = [
  'users',
  'habits',
  'todos',
  'projects',
  'project_members',
  'daily_logs',
  'consumed_invites',
  'app_opens',
  'subscriptions',
  'streak_freeze_uses',
  'buddy_pairs',
  'buddy_invites',
  'buddy_nudges',
  'referrals',
  'referral_rewards',
];

function quoteIdent(identifier: string): string {
  return `"${identifier.replace(/"/g, '""')}"`;
}

function quoteValue(value: unknown): string {
  if (value === null || value === undefined) return 'NULL';
  if (typeof value === 'number') return Number.isFinite(value) ? String(value) : 'NULL';
  return `'${String(value).replace(/'/g, "''")}'`;
}

function generateSQL(): string {
  const lines = [
    '-- Lean Space D1 data import generated from Supabase export',
    'PRAGMA foreign_keys = OFF;',
    'BEGIN TRANSACTION;',
  ];

  for (const table of importOrder) {
    const rows = data[table] ?? [];
    if (rows.length === 0) continue;

    const columns = Object.keys(rows[0]);
    const columnList = columns.map(quoteIdent).join(', ');
    lines.push(`DELETE FROM ${quoteIdent(table)};`);

    for (const row of rows) {
      const values = columns.map((column) => quoteValue(row[column])).join(', ');
      lines.push(`INSERT INTO ${quoteIdent(table)} (${columnList}) VALUES (${values});`);
    }
  }

  lines.push('COMMIT;');
  lines.push('PRAGMA foreign_keys = ON;');
  return `${lines.join('\n')}\n`;
}

function generateVerificationSQL(): string {
  const lines = [
    '-- Compare these D1 row counts with supabase-export-manifest.json',
  ];

  for (const table of importOrder) {
    const expected = data[table]?.length ?? 0;
    lines.push(
      `SELECT '${table}' AS table_name, ${expected} AS expected_rows, COUNT(*) AS actual_rows FROM ${quoteIdent(table)};`
    );
  }

  return `${lines.join('\n')}\n`;
}

fs.writeFileSync('import-to-d1.sql', generateSQL());
fs.writeFileSync('verify-d1-import.sql', generateVerificationSQL());

console.log('Generated import-to-d1.sql and verify-d1-import.sql');
console.log('Import remote: npx wrangler d1 execute daily-stitch-db --remote --file=import-to-d1.sql');
console.log('Verify remote: npx wrangler d1 execute daily-stitch-db --remote --file=verify-d1-import.sql');
