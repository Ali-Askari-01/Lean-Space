// Password hashing using PBKDF2 with Web Crypto API
// Supports both legacy SHA-256 (v1) and PBKDF2 (v2) formats

const PBKDF2_ITERATIONS = 100000;
const SALT_LENGTH = 16;
const HASH_LENGTH = 32;

// Legacy SHA-256 hash (for backward compatibility)
async function sha256Hash(password: string): Promise<string> {
  const encoder = new TextEncoder();
  const data = encoder.encode(password);
  const hashBuffer = await crypto.subtle.digest('SHA-256', data);
  const hashArray = Array.from(new Uint8Array(hashBuffer));
  return hashArray.map(b => b.toString(16).padStart(2, '0')).join('');
}

// PBKDF2 hash with salt
async function pbkdf2Hash(password: string, salt?: string): Promise<string> {
  const encoder = new TextEncoder();
  const passwordKey = await crypto.subtle.importKey(
    'raw',
    encoder.encode(password),
    'PBKDF2',
    false,
    ['deriveBits']
  );

  const saltBytes = salt
    ? Uint8Array.from(salt.match(/.{2}/g)!.map(h => parseInt(h, 16)))
    : crypto.getRandomValues(new Uint8Array(SALT_LENGTH));

  const derivedBits = await crypto.subtle.deriveBits(
    {
      name: 'PBKDF2',
      salt: saltBytes,
      iterations: PBKDF2_ITERATIONS,
      hash: 'SHA-256',
    },
    passwordKey,
    HASH_LENGTH * 8
  );

  const hashArray = Array.from(new Uint8Array(derivedBits));
  const hashHex = hashArray.map(b => b.toString(16).padStart(2, '0')).join('');
  const saltHex = Array.from(saltBytes).map(b => b.toString(16).padStart(2, '0')).join('');

  return `v2:${PBKDF2_ITERATIONS}:${saltHex}:${hashHex}`;
}

export async function hashPassword(password: string): Promise<string> {
  return pbkdf2Hash(password);
}

export async function verifyPassword(password: string, storedHash: string): Promise<boolean> {
  // Check format version
  if (storedHash.startsWith('v2:')) {
    // PBKDF2 format: v2:iterations:salt:hash
    const parts = storedHash.split(':');
    if (parts.length !== 4) return false;

    const iterations = parseInt(parts[1], 10);
    const salt = parts[2];
    const expectedHash = parts[3];

    const encoder = new TextEncoder();
    const passwordKey = await crypto.subtle.importKey(
      'raw',
      encoder.encode(password),
      'PBKDF2',
      false,
      ['deriveBits']
    );

    const saltBytes = Uint8Array.from(salt.match(/.{2}/g)!.map(h => parseInt(h, 16)));

    const derivedBits = await crypto.subtle.deriveBits(
      {
        name: 'PBKDF2',
        salt: saltBytes,
        iterations: iterations,
        hash: 'SHA-256',
      },
      passwordKey,
      HASH_LENGTH * 8
    );

    const hashArray = Array.from(new Uint8Array(derivedBits));
    const computedHash = hashArray.map(b => b.toString(16).padStart(2, '0')).join('');

    return computedHash === expectedHash;
  } else {
    // Legacy SHA-256 format (no version prefix)
    const legacyHash = await sha256Hash(password);
    return legacyHash === storedHash;
  }
}

// Check if password hash needs upgrading
export function needsUpgrade(storedHash: string): boolean {
  return !storedHash.startsWith('v2:');
}

// Upgrade hash on successful login
export async function upgradeHashIfNeeded(password: string, storedHash: string): Promise<string | null> {
  if (needsUpgrade(storedHash)) {
    return pbkdf2Hash(password);
  }
  return null;
}
