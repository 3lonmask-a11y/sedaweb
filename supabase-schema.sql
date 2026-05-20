create table if not exists public.daily_logs (
  id uuid primary key default gen_random_uuid(),
  date date not null,
  title text not null,
  category text not null default 'Daily Life',
  mood text not null default '',
  proof text not null default '',
  result text not null default '',
  next_step text not null default '',
  is_public boolean not null default true,
  created_at timestamptz not null default now()
);

alter table public.daily_logs enable row level security;

drop policy if exists "read public daily logs" on public.daily_logs;
drop policy if exists "admin read all daily logs" on public.daily_logs;
drop policy if exists "admin insert daily logs" on public.daily_logs;
drop policy if exists "admin update daily logs" on public.daily_logs;
drop policy if exists "admin delete daily logs" on public.daily_logs;

create policy "read public daily logs"
on public.daily_logs
for select
to anon
using (is_public = true);

create policy "admin read all daily logs"
on public.daily_logs
for select
to anon
using (
  coalesce(current_setting('request.headers', true), '{}')::jsonb ->> 'x-write-key'
  = 'seda-secret-write-key-2026'
);

create policy "admin insert daily logs"
on public.daily_logs
for insert
to anon
with check (
  coalesce(current_setting('request.headers', true), '{}')::jsonb ->> 'x-write-key'
  = 'seda-secret-write-key-2026'
);

create policy "admin update daily logs"
on public.daily_logs
for update
to anon
using (
  coalesce(current_setting('request.headers', true), '{}')::jsonb ->> 'x-write-key'
  = 'seda-secret-write-key-2026'
)
with check (
  coalesce(current_setting('request.headers', true), '{}')::jsonb ->> 'x-write-key'
  = 'seda-secret-write-key-2026'
);

create policy "admin delete daily logs"
on public.daily_logs
for delete
to anon
using (
  coalesce(current_setting('request.headers', true), '{}')::jsonb ->> 'x-write-key'
  = 'seda-secret-write-key-2026'
);

insert into public.daily_logs
  (date, title, category, mood, proof, result, next_step, is_public)
values
  (
    current_date,
    'Запустила Progress OS',
    'Tech / Website',
    'Собираю себя в систему, а не в хаос.',
    'Подключила динамические логи через GitHub Pages и Supabase.',
    'Сайт перестал быть просто статической страницей: теперь у него есть база данных.',
    'Добавить первый настоящий лог дня через admin.html.',
    true
  );
