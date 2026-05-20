window.SEDA_CONFIG = {
  SUPABASE_URL: localStorage.getItem("SEDA_SUPABASE_URL") || "",
  SUPABASE_ANON_KEY: localStorage.getItem("SEDA_SUPABASE_ANON_KEY") || "",
  TABLE_NAME: "daily_logs"
};

function sedaHasSupabaseConfig() {
  return Boolean(
    window.SEDA_CONFIG &&
    window.SEDA_CONFIG.SUPABASE_URL &&
    window.SEDA_CONFIG.SUPABASE_ANON_KEY
  );
}

function sedaCreateSupabaseClient(writeKey) {
  if (!sedaHasSupabaseConfig()) {
    return null;
  }

  const options = writeKey
    ? { global: { headers: { "x-write-key": writeKey } } }
    : {};

  return window.supabase.createClient(
    window.SEDA_CONFIG.SUPABASE_URL,
    window.SEDA_CONFIG.SUPABASE_ANON_KEY,
    options
  );
}
