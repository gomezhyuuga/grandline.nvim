import { writeFileSync } from 'node:fs';

// Colors + roles lifted from lua/grandline/palette.lua and docs/theme-definition.md
const SECTIONS = [
  { title: 'Backgrounds &amp; Foregrounds', colors: [
    ['New World Night', '#0d1117', 'Primary background'],
    ['Calm Belt', '#161b22', 'Panels and floats'],
    ['Thousand Sunny Deck', '#21262d', 'Selection / current line'],
    ['Haki Black', '#1a1a2e', 'Armament hardening'],
    ['Sea Stone', '#484f58', 'Comments / muted text'],
    ['Log Pose', '#8b949e', 'Secondary text, operators'],
    ['Ponegliff White', '#e6edf3', 'Primary foreground'],
    ['Snow White', '#ffffff', 'Pure white'],
  ]},
  { title: 'ANSI Normal &mdash; the Straw Hat Crew', colors: [
    ['Blackbeard', '#0d1117', 'Dark as the Yami Yami no Mi'],
    ['Straw', '#e6b422', "Luffy's hat &mdash; primary accent"],
    ['Gear Red', '#e63946', "Luffy's signature color"],
    ['Ichimonji', '#2d9d4f', "Zoro's haramaki"],
    ['Clima-Tact', '#f77f00', "Nami's hair"],
    ['All Blue', '#2f7ebf', "Sanji's dream sea"],
    ['Robin', '#9d4edd', "Nico Robin's color scheme"],
    ['Radical Beam Cyan', '#00c8d4', "Franky's tech"],
  ]},
  { title: 'ANSI Bright', colors: [
    ['Gear Fifth', '#ff6b7a', "Luffy's awakening glow"],
    ['Enma Glow', '#5bda7c', "Zoro's cursed blade aura"],
    ['Gol D.', '#fcbf49', 'Wano gold'],
    ['Jinbe Tide', '#58a6ff', 'First Son of the Sea'],
    ['Sakura Bloom', '#d970c4', 'Wano cherry blossoms'],
    ['Soul King Teal', '#56d4dd', "Brook's soul flames"],
  ]},
  { title: 'Extended Accents', colors: [
    ['Kabuki Red', '#c41e3a', 'Wano theater &mdash; deletions'],
    ['Fire Fist', '#ff4500', "Ace's flames &mdash; errors"],
    ['Beli Gold', '#ffd700', 'Berry currency &mdash; search'],
    ['Straw Yellow', '#e6c200', 'The iconic hat &mdash; warnings'],
    ['Conqueror Lightning', '#9d00ff', 'Haki clash &mdash; command palette border'],
    ['Marine Blue', '#003f87', 'Navy coat justice'],
  ]},
];

const MONO = "'JetBrains Mono', ui-monospace, 'SF Mono', Menlo, monospace";
const BODY = "'Space Grotesk', system-ui, -apple-system, 'Segoe UI', sans-serif";
const DISPLAY = "'Bebas Neue', 'Oswald', 'Arial Narrow', sans-serif";

const rgb = (hex) => [1, 3, 5].map((i) => parseInt(hex.slice(i, i + 2), 16)).join(' ');

const card = ([name, hex, role]) => `      <div style="background: #161b22; border-radius: 12px; overflow: hidden;">
        <div style="height: 72px; background: ${hex}; box-shadow: inset 0 0 0 1px rgba(230, 237, 243, 0.09);"></div>
        <div style="display: flex; flex-direction: column; gap: 3px; padding: 12px 14px;">
          <div style="font-size: 14px; font-weight: 600; line-height: 1.3; color: #e6edf3;">${name}</div>
          <div style="font-family: ${MONO}; font-size: 12px; line-height: 1.3; color: #8b949e;">${hex} &middot; ${rgb(hex)}</div>
          <div style="font-size: 11px; line-height: 1.35; color: #484f58; text-wrap: pretty;">${role}</div>
        </div>
      </div>`;

const section = ({ title, colors }) => `    <div style="display: flex; flex-direction: column; gap: 20px;">
      <div style="display: flex; align-items: center; gap: 16px;">
        <div style="width: 4px; height: 28px; border-radius: 2px; background: linear-gradient(180deg, #e63946, #f77f00);"></div>
        <h2 style="margin: 0; font-family: ${DISPLAY}; font-size: 28px; font-weight: 400; letter-spacing: 0.1em; line-height: 1; color: #e6edf3;">${title}</h2>
      </div>
      <div style="display: grid; grid-template-columns: repeat(4, minmax(0, 1fr)); gap: 16px;">
${colors.map(card).join('\n')}
      </div>
    </div>`;

const html = `<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <script src="./support.js"></script>
</head>
<body>
<x-dc>
<helmet>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=JetBrains+Mono:wght@400;600&family=Space+Grotesk:wght@400;500;600;700&display=swap" rel="stylesheet">
  <style>
    body { margin: 0; background: #0d1117; color: #e6edf3; font-family: ${BODY}; }
    a { color: #58a6ff; } a:hover { color: #56d4dd; }
  </style>
</helmet>
<div style="display: flex; flex-direction: column; gap: 48px; padding: 48px; background: #0d1117;">
  <div style="display: flex; flex-direction: column; align-items: center; gap: 10px;">
    <svg width="58" height="58" viewBox="0 0 1024 1024" aria-hidden="true">
      <ellipse cx="512" cy="700" rx="480" ry="100" fill="#e6b422"></ellipse>
      <path d="M180 580 C180 380 350 280 512 280 C674 280 844 380 844 580 Z" fill="#e6b422"></path>
      <path d="M140 580 L884 580 L884 640 L140 640 Z" fill="#e63946"></path>
    </svg>
    <h1 style="margin: 0; font-family: ${DISPLAY}; font-size: 84px; font-weight: 400; letter-spacing: 0.05em; line-height: 0.95; background: linear-gradient(135deg, #e63946 0%, #f77f00 50%, #fcbf49 100%); -webkit-background-clip: text; background-clip: text; -webkit-text-fill-color: transparent; color: #f77f00;">GRAND LINE</h1>
    <div style="font-size: 13px; font-weight: 500; letter-spacing: 0.3em; text-transform: uppercase; color: #8b949e;">28 colors &middot; grandline.nvim</div>
  </div>
  <div style="display: flex; flex-direction: column; gap: 40px;">
${SECTIONS.map(section).join('\n')}
  </div>
</div>
</x-dc>
</body>
</html>
`;

const out = new URL('./Main.dc.html', import.meta.url);
writeFileSync(out, html);
console.log('wrote Main.dc.html —', SECTIONS.reduce((n, s) => n + s.colors.length, 0), 'swatches');
