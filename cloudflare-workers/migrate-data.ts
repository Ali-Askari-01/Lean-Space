// Data Migration Script - Export from Supabase
// Run this script to export all Supabase data to JSON

import { createClient } from '@supabase/supabase-js';
import * as fs from 'fs';

// SUPABASE CONFIG - fill in your values
const SUPABASE_URL = 'https://YOUR-PROJECT.supabase.co';
const SUPABASE_SERVICE_KEY = 'eyJ...'; // service_role key from Supabase dashboard

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY);

// Tables to migrate (in dependency order)
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

async function exportFromSupabase() {
  const data: Record<string, any[]> = {};
  
  for (const table of TABLES) {
    console.log(`Exporting ${table}...`);
    const { data: rows, error } = await supabase.from(table).select('*');
    
    if (error) {
      console.error(`Error exporting ${table}:`, error);
      continue;
    }
    
    data[table] = rows || [];
    console.log(`  Exported ${data[table].length} rows from ${table}`);
  }
  
  return data;
}

// Transform data for SQLite compatibility
function transformForSQLite(data: Record<string, any[]>): Record<string, any[]> {
  const transformed: Record<string, any[]> = {};
  
  for (const [table, rows] of Object.entries(data)) {
    transformed[table] = rows.map(row => {
      const newRow = { ...row };
      
      // Convert boolean to integer
      for (const [key, value] of Object.entries(newRow)) {
        if (typeof value === 'boolean') {
          newRow[key] = value ? 1 : 0;
        }
      }
      
      // Convert timestamps to ISO strings
      for (const [key, value] of Object.entries(newRow)) {
        if (value instanceof Date) {
          newRow[key] = value.toISOString();
        }
      }
      
      return newRow;
    });
  }
  
  return transformed;
}

// Main execution
async function main() {
  console.log('Exporting data from Supabase...');
  const data = await exportFromSupabase();
  
  console.log('\nTransforming data for SQLite...');
  const transformed = transformForSQLite(data);
  
  console.log('\nSaving to supabase-export.json...');
  fs.writeFileSync('supabase-export.json', JSON.stringify(transformed, null, 2));
  
  console.log('\nExport complete!');
  console.log('Next step: Run import-data.ts to import into D1');
}

main().catch(console.error);
