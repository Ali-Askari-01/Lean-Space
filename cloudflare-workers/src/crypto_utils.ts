// Cryptographic utility functions for the Worker

/**
 * Constant-time string comparison to prevent timing attacks.
 * Compares two strings byte-by-byte without short-circuiting.
 */
export function timingSafeEqual(a: string, b: string): boolean {
  const encoder = new TextEncoder();
  const aBytes = encoder.encode(a);
  const bBytes = encoder.encode(b);

  if (aBytes.length !== bBytes.length) {
    // Still compare to avoid length-based timing leak
    let diff = aBytes.length ^ bBytes.length;
    for (let i = 0; i < aBytes.length; i++) {
      diff |= aBytes[i] ^ (bBytes[i % bBytes.length] || 0);
    }
    return diff === 0;
  }

  let diff = 0;
  for (let i = 0; i < aBytes.length; i++) {
    diff |= aBytes[i] ^ bBytes[i];
  }
  return diff === 0;
}
