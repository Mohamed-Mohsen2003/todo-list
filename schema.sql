-- Run this entire file in Supabase SQL Editor.
create table if not exists public.projects (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  description text default '',
  created_at timestamptz not null default now()
);
create table if not exists public.tasks (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  project_id uuid not null references public.projects(id) on delete cascade,
  title text not null,
  description text default '',
  status text not null default 'not_started' check (status in ('not_started','in_progress','completed')),
  priority text not null default 'medium' check (priority in ('low','medium','high')),
  due_date date,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
alter table public.projects enable row level security;
alter table public.tasks enable row level security;
drop policy if exists "projects own rows" on public.projects;
drop policy if exists "tasks own rows" on public.tasks;
create policy "projects own rows" on public.projects for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "tasks own rows" on public.tasks for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create index if not exists projects_user_idx on public.projects(user_id);
create index if not exists tasks_user_idx on public.tasks(user_id);
create index if not exists tasks_project_idx on public.tasks(project_id);
