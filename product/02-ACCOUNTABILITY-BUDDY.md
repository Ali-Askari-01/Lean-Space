# Accountability Buddy — Future Social Wedge

**Status:** Designed, not built. Ships after Pro launch and core retention metrics validate.

## Why not full "Our Space" now

Full team projects (feeds, invites, daily logs) multiply UI surface area, RLS complexity, and support load. They also dilute LeanSpace's single-screen discipline thesis. The buddy wedge adds social accountability without becoming another Asana.

## Concept

One user pairs with **exactly one** accountability buddy. Both see a **shared streak** that increments only when **both** complete their daily chain (all tasks done OR at least one task created and all completed — same rule as personal streak).

## User stories (v1 buddy)

1. **Invite:** Pro user generates a single-use invite link. Buddy accepts → pairing created.
2. **Shared streak:** Displayed on My Day header as a small "Buddy chain: N" chip. Tapping opens buddy detail.
3. **Gentle nudge:** If buddy missed yesterday, one optional push: "Your buddy missed yesterday. Send a nudge?" → single tap sends in-app nudge (no chat).
4. **Unpair:** Either side can unpair; shared streak resets.

## Data model (sketch)

```sql
CREATE TABLE buddy_pairs (
  id UUID PRIMARY KEY,
  user_a UUID REFERENCES users(id),
  user_b UUID REFERENCES users(id),
  shared_streak INT DEFAULT 0,
  last_both_perfect_date DATE,
  created_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE (user_a, user_b)
);

CREATE TABLE buddy_invites (
  jti UUID PRIMARY KEY,
  inviter_id UUID REFERENCES users(id),
  consumed_by UUID,
  expires_at TIMESTAMPTZ
);
```

## UI placement

- Second bottom-nav tab (currently "Buddy" placeholder) becomes the buddy home when paired.
- Unpaired state: invite / enter code screen (minimal, one CTA).
- No hamburger, no feed, no comments.

## Monetization

- **Free:** Can be someone's buddy (accept invite) but cannot send invites.
- **Pro:** Can invite one buddy.

## Success metric

Buddy pairs with shared streak ≥ 7 days have higher D7 retention than solo users.

## Explicit non-goals

- Group chats, reactions, file uploads, kanban, multiple buddies, leaderboards.
