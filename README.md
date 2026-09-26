# Mohamed Mohsen Task Manager

A lightweight multilingual task/project dashboard using Supabase Auth + Postgres.

## Setup
1. Create a Supabase project.
2. In Supabase SQL Editor, run `schema.sql`.
3. In Supabase Authentication, enable Email provider and create/confirm your user account. Use a new strong password; do not reuse a password that was exposed in chat.
4. Copy your Project URL and anon/public key into `config.js`.
5. Serve the folder from a local web server (recommended) rather than opening `index.html` directly. For example with VS Code Live Server or `python -m http.server 5500`.
6. Open `http://localhost:5500`.

## Security
The browser should contain only the Supabase anon/public key. Never put the `service_role` key in this project.

## Included
- Projects and tasks stored in Supabase
- Per-user row-level security
- Not Started / In Progress / Completed
- Dark / Light mode
- English / Arabic / Spanish
- Responsive dashboard
