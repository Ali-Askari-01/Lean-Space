// Data Import Script - Import to local SQLite for testing
// Run this script to import data to a local SQLite database

import * as fs from 'fs';

// Load exported data
const data = JSON.parse(fs.readFileSync('supabase-export.json', 'utf-8'));

// Import data in dependency order
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

// Generate SQL for D1 import
function generateSQL(data: Record<string, any[]>): string {
  let sql = '-- Daily Stitch D1 Data Import\n';
  sql += '-- Generated from Supabase export\n\n';
  
  for (const table of importOrder) {
    const rows = data[table];
    if (!rows || rows.length === 0) continue;
    
    sql += `-- Import ${table}\n`;
    
    const columns = Object.keys(rows[0]);
    
    for (const row of rows) {
      const values = columns.map(col => {
        const val = row[col];
        if (val === null || val === undefined) return 'NULL';
        if (typeof val === 'number') return val.toString();
        if (typeof val === 'string') return `'${val.replace(/'/g, "''")}'`;
        return `'${String(val).replace(/'/g, "''")}'`;
      });
      
      sql += `INSERT INTO ${table} (${columns.join(', ')}) VALUES (${values.join(', ')});\n`;
    }
    
    sql += '\n';
  }
  
  return sql;
}

// Main execution
async function main() {
  console.log('Generating D1 import SQL...');
  
  const sql = generateSQL(data);
  fs.writeFileSync('import-to-d1.sql', sql);
  
  const fileSize = (fs.statSync('import-to-d1.sql').size / 1024 / 1024).toFixed(2);
  console.log(`Generated import-to-d1.sql (${fileSize} MB)`);
  console.log('\nTo import into Cloudflare D1:');
  console.log('npx wrangler d1 execute daily-stitch-db --file=import-to-d1.sql');
}

main().catch(console.error);
