-- Veste v0.5 — execute no SQL Editor do seu projeto Supabase.
create table if not exists public.wardrobe_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{"items":[],"looks":[]}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.wardrobe_data enable row level security;

drop policy if exists "Users can read their own wardrobe" on public.wardrobe_data;
create policy "Users can read their own wardrobe"
on public.wardrobe_data for select
to authenticated
using ((select auth.uid()) = user_id);

drop policy if exists "Users can insert their own wardrobe" on public.wardrobe_data;
create policy "Users can insert their own wardrobe"
on public.wardrobe_data for insert
to authenticated
with check ((select auth.uid()) = user_id);

drop policy if exists "Users can update their own wardrobe" on public.wardrobe_data;
create policy "Users can update their own wardrobe"
on public.wardrobe_data for update
to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);
