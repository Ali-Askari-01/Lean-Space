-- Prevent unbounded text inserts (DoS vector)
ALTER TABLE public.todos
  ADD CONSTRAINT chk_todos_notes_length
  CHECK (notes IS NULL OR char_length(notes) <= 2000);

ALTER TABLE public.habits
  ADD CONSTRAINT chk_habits_notes_length
  CHECK (notes IS NULL OR char_length(notes) <= 2000);

ALTER TABLE public.todos
  ADD CONSTRAINT chk_todos_text_length
  CHECK (char_length(text) <= 500);
