import { writeFileSync } from 'node:fs';

// Section colours read from lua/lualine/themes/grandline.lua
const B = { bg: '#21262d', fg: '#e6edf3' };
const C = { bg: '#161b22', fg: '#8b949e' };
const Z = { bg: '#21262d', fg: '#e6edf3' };

const MODES = [
  { name: 'NORMAL',  a: { bg: '#e6b422', fg: '#0d1117' }, note: "Straw — Luffy's hat" },
  { name: 'INSERT',  a: { bg: '#2d9d4f', fg: '#0d1117' }, note: "Ichimonji — Zoro's haramaki" },
  { name: 'VISUAL',  a: { bg: '#9d4edd', fg: '#0d1117' }, note: 'Robin' },
  { name: 'REPLACE', a: { bg: '#f77f00', fg: '#0d1117' }, note: "Clima-Tact — Nami's hair" },
  { name: 'COMMAND', a: { bg: '#fcbf49', fg: '#0d1117' }, note: 'Gol D. — Wano gold' },
  { name: 'INACTIVE', a: { bg: '#1a1a2e', fg: '#484f58' }, note: 'Haki Black', dim: true },
];

const MONO = "'JetBrains Mono', ui-monospace, 'SF Mono', Menlo, monospace";
const BRANCH = (fg) => `<svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="${fg}" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="6" cy="5" r="2.5"></circle><circle cx="6" cy="19" r="2.5"></circle><circle cx="18" cy="9" r="2.5"></circle><path d="M6 7.5v9"></path><path d="M18 11.5c0 4-6 2.5-6 7.5"></path></svg>`;

// A right-pointing wedge: the left border paints the wedge in `from`,
// the transparent top/bottom borders let the `to` background show through.
const sepR = (from, to) => `<div style="width: 0; height: 0; border-style: solid; border-width: 14px 0 14px 10px; border-color: transparent transparent transparent ${from}; background: ${to};"></div>`;
const sepL = (from, to) => `<div style="width: 0; height: 0; border-style: solid; border-width: 14px 10px 14px 0; border-color: transparent ${to} transparent transparent; background: ${from};"></div>`;

const bar = ({ name, a, dim }) => {
  const b = dim ? a : B, c = dim ? a : C, z = dim ? a : Z;
  return `      <div style="display: flex; align-items: stretch; height: 28px; border-radius: 4px; overflow: hidden; font-family: ${MONO}; font-size: 12px;">
        <div style="display: flex; align-items: center; padding: 0 14px; background: ${a.bg}; color: ${a.fg}; font-weight: 700; letter-spacing: 0.06em;">${name}</div>
        ${sepR(a.bg, b.bg)}
        <div style="display: flex; align-items: center; gap: 7px; padding: 0 14px; background: ${b.bg}; color: ${b.fg};">${BRANCH(b.fg)}<span>main</span></div>
        ${sepR(b.bg, c.bg)}
        <div style="display: flex; align-items: center; flex-grow: 1; padding: 0 14px; background: ${c.bg}; color: ${c.fg};">lua/grandline/palette.lua</div>
        ${sepL(c.bg, z.bg)}
        <div style="display: flex; align-items: center; gap: 18px; padding: 0 14px; background: ${z.bg}; color: ${z.fg};"><span>utf-8</span><span>lua</span><span>7:30</span></div>
      </div>`;
};

const group = (m) => `    <div style="display: flex; flex-direction: column; gap: 8px;">
      <div style="display: flex; align-items: baseline; gap: 10px;">
        <div style="font-size: 12px; font-weight: 600; letter-spacing: 0.16em; text-transform: uppercase; color: #8b949e;">${m.name}</div>
        <div style="font-size: 11.5px; color: #484f58;">${m.note}</div>
      </div>
${bar(m)}
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
    body { margin: 0; background: #0d1117; color: #e6edf3; font-family: 'Space Grotesk', system-ui, sans-serif; }
    a { color: #58a6ff; } a:hover { color: #56d4dd; }
  </style>
</helmet>
<div style="display: flex; flex-direction: column; gap: 26px; padding: 40px; background: #0d1117;">
  <div style="display: flex; align-items: center; gap: 16px;">
    <div style="width: 4px; height: 28px; border-radius: 2px; background: linear-gradient(180deg, #e63946, #f77f00);"></div>
    <h2 style="margin: 0; font-family: 'Bebas Neue', 'Oswald', 'Arial Narrow', sans-serif; font-size: 28px; font-weight: 400; letter-spacing: 0.1em; line-height: 1; color: #e6edf3;">Lualine modes</h2>
  </div>
  <div style="display: flex; flex-direction: column; gap: 20px;">
${MODES.map(group).join('\n')}
  </div>
</div>
</x-dc>
</body>
</html>
`;

writeFileSync(new URL('./Statusline.dc.html', import.meta.url), html);
console.log('wrote Statusline.dc.html —', MODES.length, 'modes');
