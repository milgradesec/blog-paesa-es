# Paesa Blog

Ghost CMS + Static page generator + Cloudflare Pages = 🎉

## Usage

### 🐋 Start a local Ghost instance

```shell
docker compose up -d
```

### ✍️ Write posts

Go to `localhost:2368/ghost`

### ⚒️ Generate static website

I use the `ghost-static-site-generator` tool to fetch all pages and resources from ghost and make a static website.

Install `ghost-static-site-generator`:

```shell
npm install -g ghost-static-site-generator
```

Generate site from `localhost:2368`:

```shell
gssg --url https://blog.paesa.es --dest static
```

## 🚀 Deploy to Cloudflare Pages

`git commit` and `git push`, CI/CD will do the rest.
