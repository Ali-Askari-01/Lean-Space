-- Create reusable updated_at trigger function
CREATE OR REPLACE FUNCTION public.set_updated_at()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

-- Add updated_at trigger to daily_logs
CREATE TRIGGER set_daily_logs_updated_at
  BEFORE UPDATE ON public.daily_logs
  FOR EACH ROW
  EXECUTE FUNCTION public.set_updated_at();

-- Add email change propagation from auth.users to public.users
CREATE OR REPLACE FUNCTION public.handle_auth_email_change()
RETURNS TRIGGER LANGUAGE plpgsql SECURITY DEFINER SET search_path = public
AS $$
BEGIN
  UPDATE public.users SET email = NEW.email WHERE id = NEW.id;
  RETURN NEW;
END;
$$;

CREATE TRIGGER on_auth_email_change
  AFTER UPDATE OF email ON auth.users
  FOR EACH ROW
  WHEN (OLD.email IS DISTINCT FROM NEW.email)
  EXECUTE FUNCTION public.handle_auth_email_change();

-- Add daily task cap enforcement on UPDATE (not just INSERT)
CREATE TRIGGER enforce_daily_task_cap_on_update
  BEFORE UPDATE OF original_date ON public.todos
  FOR EACH ROW
  WHEN (OLD.original_date IS DISTINCT FROM NEW.original_date)
  EXECUTE FUNCTION public.enforce_daily_task_cap();
