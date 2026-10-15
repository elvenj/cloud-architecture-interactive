#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"

cat > index.html <<'HTML'
<!doctype html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Interactive Cloud Architecture</title>
<style>
:root {
  color-scheme:dark;
  font-family:system-ui,-apple-system,sans-serif;
}
* { box-sizing:border-box; }
body {
  margin:0;
  min-height:100vh;
  color:#f0f7ff;
  background:
    radial-gradient(ellipse at 78% 10%,#293477,transparent 50%),
    radial-gradient(ellipse at 5% 90%,#205477,transparent 48%),
    #070d20;
}
body:before {
  content:"";
  position:fixed;
  inset:0;
  pointer-events:none;
  opacity:.5;
  background:radial-gradient(
    ellipse at 50% 50%,
    #183d7a55,
    transparent 60%
  );
  animation:nebula 20s ease-in-out infinite alternate;
}
@keyframes nebula {
  to { transform:translate(3%,-3%) scale(1.08); }
}
main {
  position:relative;
  max-width:1120px;
  margin:0 auto;
  padding:80px 24px;
}
.eyebrow {
  color:#38d9f5;
  text-transform:uppercase;
  letter-spacing:.2em;
  font-size:.8rem;
  font-weight:700;
}
h1 {
  font-size:clamp(2rem,5vw,3.9rem);
  margin:14px 0;
}
p {
  color:#b5cce1;
  line-height:1.65;
  max-width:750px;
}
.cards {
  display:grid;
  grid-template-columns:repeat(auto-fit,minmax(260px,1fr));
  gap:20px;
  margin-top:45px;
}
a.card {
  display:block;
  padding:26px;
  border:1px solid #38d9f577;
  border-radius:18px;
  background:#10253ddd;
  color:inherit;
  text-decoration:none;
  transition:transform .2s,border-color .2s;
}
a.card:hover {
  transform:translateY(-5px);
  border-color:#38d9f5;
}
small {
  color:#35e6b0;
  text-transform:uppercase;
  letter-spacing:.12em;
}
h2 {
  font-size:1.4rem;
  margin:14px 0 8px;
}
footer {
  margin-top:70px;
  color:#8ca4bc;
  font-size:.9rem;
}
</style>
</head>
<body>
<main>
<div class="eyebrow">AWS · Google Cloud · Azure</div>
<h1>Interactive Cloud Architecture</h1>
<p>Arquiteturas interativas para aprendizado e apresentações.
Explore os componentes, fluxos e explicações em cada diagrama.</p>
<section class="cards">
HTML

# Descobrir as arquiteturas automaticamente
find aws gcp azure -type f -name index.html |
LC_ALL=C sort |
while IFS= read -r file; do
  route="${file%/index.html}"
  slug="${route##*/}"
  title="$(printf '%s' "$slug" | tr '-' ' ' |
    awk '{for(i=1;i<=NF;i++)
    $i=toupper(substr($i,1,1)) substr($i,2); print}')"
  category="${route%/*}"

  printf '<a class="card" href="%s/"><small>%s</small><h2>%s</h2><p>Explorar arquitetura interativa →</p></a>\n' \
    "$route" "$category" "$title" >> index.html
done

cat >> index.html <<'HTML'
</section>
<footer>Cosmic Nebula · Architectural · Data-Driven</footer>
</main>
</body>
</html>
HTML
