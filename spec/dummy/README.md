# Dummy app (Lookbook docs)

This Rails app exists to run Lookbook previews for the components in this repo.

## Run locally

From this folder:

1. Install Ruby gems:

	- `bundle install`

2. Install frontend dependencies (used to style previews):

	- `npm ci` (or `npm install`)

3. Start the server:

	- `bin/rails server`

Then visit:

- `http://localhost:3000/lookbook`

## Deploy as documentation (Docker)

The Docker image precompiles assets during build. It also installs the npm dependencies so GOV.UK Frontend and MoJ Frontend assets are available.

Build (from repo root):

- `docker build -f spec/dummy/Dockerfile -t moj-components-lookbook .`

Run:

- `docker run -p 8080:80 \
  -e RAILS_SERVE_STATIC_FILES=1 \
  -e SECRET_KEY_BASE=$(ruby -rsecurerandom -e 'puts SecureRandom.hex(64)') \
  moj-components-lookbook`

Then visit:

- `http://localhost:8080/lookbook`

Notes:

- If you choose to use Rails encrypted credentials in production, pass `RAILS_MASTER_KEY` when running the container. For a docs site, setting `SECRET_KEY_BASE` is typically enough.

## CI and `.github`

GitHub Actions CI is configured at the repo root in `.github/workflows/*`.
Deleting `spec/dummy/.github` (if it existed) does not affect CI; deleting the root `.github/workflows` does.
