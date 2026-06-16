REVOKE ALL ON public.allowed_emails FROM anon, authenticated;
GRANT ALL ON public.allowed_emails TO service_role;
DROP POLICY IF EXISTS "No client access to allowed_emails" ON public.allowed_emails;
CREATE POLICY "No client access to allowed_emails"
  ON public.allowed_emails
  AS RESTRICTIVE
  FOR ALL
  TO anon, authenticated
  USING (false)
  WITH CHECK (false);