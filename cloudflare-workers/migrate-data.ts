// Export Supabase table data for a deterministic D1 import.
//
// Required environment variables:
//   SUPABASE_URL
//   SUPABASE_SERVICE_ROLE_KEY

import * as fs from 'fs';

const SUPABASE_URL = process.env.SUPABASE_URL?.replace(/\/$/, '');
const SUPABASE_SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;
const PAGE_SIZE = Number(process.env.SUPABASE_EXPORT_PAGE_SIZE ?? 1000);

if (!SUPABASE_URL || !SUPABASE_SERVICE_ROLE_KEY) {
  throw new Error('SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY are required');
}

const TABLES = [
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

type Row = Record<string, unknown>;

async function exportTable(table: string): Promise<Row[]> {
  const rows: Row[] = [];
  let offset = 0;

  while (true) {
    const end = offset + PAGE_SIZE - 1;
    const response = await fetch(`${SUPABASE_URL}/rest/v1/${table}?select=*`, {
      headers: {
        apikey: SUPABASE_SERVICE_ROLE_KEY,
        Authorization: `Bearer ${SUPABASE_SERVICE_ROLE_KEY}`,
        Range: `${offset}-${end}`,
        Prefer: 'count=exact',
      },
    });

    if (!response.ok) {
      throw new Error(`Export failed for ${table}: ${response.status} ${await response.text()}`);
    }

    const page = await response.json() as Row[];
    rows.push(...page);
    if (page.length < PAGE_SIZE) break;
    offset += PAGE_SIZE;
  }

  return rows;
}

function normalizeValue(value: unknown): unknown {
  if (typeof value === 'boolean') return value ? 1 : 0;
  return value;
}

function stableJson(value: unknown): string {
  if (Array.isArray(value)) return `[${value.map(stableJson).join(',')}]`;
  if (value && typeof value === 'object') {
    const object = value as Record<string, unknown>;
    return `{${Object.keys(object).sort().map((key) => `${JSON.stringify(key)}:${stableJson(object[key])}`).join(',')}}`;
  }
  return JSON.stringify(value);
}

async function sha256Hex(input: string): Promise<string> {
  const digest = await crypto.subtle.digest('SHA-256', new TextEncoder().encode(input));
  return [...new Uint8Array(digest)].map((byte) => byte.toString(16).padStart(2, '0')).join('');
}

async function main() {
  const data: Record<string, Row[]> = {};
  const manifest: Record<string, { rows: number; checksum: string }> = {};

  for (const table of TABLES) {
    console.log(`Exporting ${table}...`);
    const rows = (await exportTable(table)).map((row) => {
      const normalized: Row = {};
      for (const [key, value] of Object.entries(row)) {
        normalized[key] = normalizeValue(value);
      }
      return normalized;
    });
    data[table] = rows;
    manifest[table] = {
      rows: rows.length,
      checksum: await sha256Hex(stableJson(rows)),
    };
    console.log(`  ${rows.length} rows, checksum ${manifest[table].checksum}`);
  }

  fs.writeFileSync('supabase-export.json', JSON.stringify(data, null, 2));
  fs.writeFileSync('supabase-export-manifest.json', JSON.stringify(manifest, null, 2));
  console.log('Export complete: supabase-export.json + supabase-export-manifest.json');
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
