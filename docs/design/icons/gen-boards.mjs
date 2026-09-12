// Generates the icon showcase artboards from fonts/icons/*.svg.
// Unlike the palette generators, this one reads the real SVG sources, so the
// boards cannot drift from the glyphs. Re-run after editing any icon:
//   node docs/design/icons/gen-boards.mjs
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const here = path.dirname(fileURLToPath(import.meta.url));
const iconDir = path.resolve(here, '../../../fonts/icons');

const ICONS = [
  { file: 'straw-hat',      name: 'straw_hat',      cp: 'U+100000', what: "Luffy's straw hat",                 use: 'Tabline head, dashboard' },
  { file: 'jolly-roger',    name: 'jolly_roger',    cp: 'U+100001', what: 'Skull, hat and crossed bones',      use: 'Project mark' },
  { file: 'going-merry',    name: 'going_merry',    cp: 'U+100002', what: 'Square-rigged caravel, sheep prow', use: 'Session, workspace' },
  { file: 'thousand-sunny', name: 'thousand_sunny', cp: 'U+100003', what: 'Lion-maned brig',                   use: 'Session, workspace' },
  { file: 'devil-fruit',    name: 'devil_fruit',    cp: 'U+100004', what: 'Swirled fruit',                     use: 'Plugins, extensions' },
  { file: 'log-pose',       name: 'log_pose',       cp: 'U+100005', what: 'Bubble compass on its band',        use: 'Pickers, navigation' },
  { file: 'den-den-mushi',  name: 'den_den_mushi',  cp: 'U+100006', what: 'Transponder snail',                 use: 'Notifications, LSP' },
  { file: 'straw-hat-flag', name: 'straw_hat_flag', cp: 'U+100007', what: 'Hat on a swallowtail pennant',      use: 'Git branch, marks' },
];

// Pull the single <path> out of each source SVG.
const geometry = Object.fromEntries(ICONS.map((i) => {
  const raw = fs.readFileSync(path.join(iconDir, `${i.file}.svg`), 'utf8');
  const d = raw.match(/<path[^>]*\sd="([\s\S]*?)"/);
  if (!d) throw new Error(`no <path d> in ${i.file}.svg`);
  return [i.name, d[1].replace(/\s+/g, ' ').trim()];
}));

const glyph = (name, size, fill) =>
  `<svg width="${size}" height="${size}" viewBox="0 0 1024 1024" role="img" aria-label="${name}" style="display: block; flex: none;"><path fill="${fill}" d="${geometry[name]}"></path></svg>`;

const BG = {
  night: { hex: '#0d1117', label: 'new_world_night', note: 'Primary background' },
  calm:  { hex: '#161b22', label: 'calm_belt',       note: 'Panels and floats' },
  deck:  { hex: '#21262d', label: 'thousand_sunny_deck', note: 'Selection / current line' },
};

const FONTS = `  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=JetBrains+Mono:wght@400;600&family=Space+Grotesk:wght@400;500;600;700&display=swap" rel="stylesheet">`;

const MONO = `'JetBrains Mono', ui-monospace, 'SF Mono', Menlo, monospace`;
const SANS = `'Space Grotesk', system-ui, -apple-system, 'Segoe UI', sans-serif`;
const DISPLAY = `'Bebas Neue', 'Oswald', 'Arial Narrow', sans-serif`;

const heading = (text) => `
      <div style="display: flex; align-items: center; gap: 16px;">
        <div style="width: 4px; height: 28px; border-radius: 2px; background: linear-gradient(180deg, #e63946, #f77f00); flex: none;"></div>
        <h2 style="margin: 0; font-family: ${DISPLAY}; font-size: 28px; font-weight: 400; letter-spacing: 0.1em; line-height: 1; color: #e6edf3;">${text}</h2>
      </div>`;

const lede = (text) => `<p style="margin: 0; max-width: 68ch; font-size: 14px; line-height: 1.55; color: #8b949e; text-wrap: pretty;">${text}</p>`;

const doc = ({ title, body, script = '' }) => `<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <script src="./support.js"></script>
</head>
<body>
<x-dc>
<helmet>
${FONTS}
  <style>
    body { margin: 0; background: #0d1117; color: #e6edf3; font-family: ${SANS}; }
    a { color: #58a6ff; } a:hover { color: #56d4dd; }
  </style>
</helmet>
${body}
</x-dc>
${script}
</body>
</html>
`;

// ─── Main: the set ────────────────────────────────────────────────────────────
const mainCards = ICONS.map((i) => `
        <div style="display: flex; flex-direction: column; gap: 14px; padding: 22px 20px 20px; background: #161b22; border-radius: 12px; box-shadow: inset 0 0 0 1px rgba(230, 237, 243, 0.06);">
          <div style="display: flex; align-items: center; justify-content: center; height: 96px;">${glyph(i.name, 78, '{{accent}}')}</div>
          <div style="display: flex; flex-direction: column; gap: 4px;">
            <div style="font-family: ${MONO}; font-size: 13px; font-weight: 600; line-height: 1.3; color: #e6edf3;">${i.name}</div>
            <div style="font-family: ${MONO}; font-size: 11px; line-height: 1.3; color: #e6b422;">${i.cp}</div>
            <div style="font-size: 12px; line-height: 1.4; color: #8b949e; text-wrap: pretty;">${i.what}</div>
            <div style="font-size: 11px; line-height: 1.4; color: #484f58; text-wrap: pretty;">${i.use}</div>
          </div>
        </div>`).join('');

const main = doc({
  title: 'Grandline Icons',
  body: `<div style="display: flex; flex-direction: column; gap: 44px; padding: 52px 48px; background: #0d1117;">
  <div style="display: flex; flex-direction: column; align-items: center; gap: 12px;">
    ${glyph('jolly_roger', 76, '{{accent}}')}
    <h1 style="margin: 0; font-family: ${DISPLAY}; font-size: 76px; font-weight: 400; letter-spacing: 0.05em; line-height: 0.95; background: linear-gradient(135deg, #e63946 0%, #f77f00 50%, #fcbf49 100%); -webkit-background-clip: text; background-clip: text; -webkit-text-fill-color: transparent; color: #f77f00;">GRANDLINE ICONS</h1>
    <div style="font-family: ${MONO}; font-size: 12px; letter-spacing: 0.22em; text-transform: uppercase; color: #8b949e;">8 glyphs &middot; U+100000&ndash;U+100007</div>
  </div>
  <div style="display: flex; flex-direction: column; gap: 20px;">
${heading('The set')}
      ${lede('Each glyph is one solid path on a 1024&times;1024 grid, so the terminal or the highlight group supplies the colour. Counters &mdash; the hatband, the eye sockets, the compass face &mdash; are reverse-wound subpaths rather than white shapes, which is what lets FontForge import them as real holes.')}
      <div style="display: grid; grid-template-columns: repeat(4, minmax(0, 1fr)); gap: 16px;">${mainCards}
      </div>
  </div>
</div>`,
  script: `<script data-dc-script data-props='{"accent":{"editor":"color","default":"#e6b422","options":["#e6b422","#fcbf49","#56d4dd","#ff6b7a"],"tsType":"string"}}'>
class Component extends DCLogic {
  renderVals() {
    return { accent: this.props.accent ?? '#e6b422' };
  }
}
</script>`,
});

// ─── Sizes: the 16px proof ────────────────────────────────────────────────────
const RAMP = [16, 20, 24, 32, 48];
const rampRows = ICONS.map((i) => `
          <div style="display: grid; grid-template-columns: 150px repeat(${RAMP.length}, minmax(0, 1fr)); align-items: center; gap: 12px; padding: 12px 18px; background: #0d1117; border-radius: 10px;">
            <div style="font-family: ${MONO}; font-size: 12px; color: #8b949e;">${i.name}</div>
${RAMP.map((s) => `            <div style="display: flex; align-items: center; justify-content: center;">${glyph(i.name, s, '{{accent}}')}</div>`).join('\n')}
          </div>`).join('');

const bgBand = (key) => {
  const b = BG[key];
  return `
        <div style="display: flex; flex-direction: column; gap: 14px; padding: 20px 22px; border-radius: 12px; background: ${b.hex}; box-shadow: inset 0 0 0 1px rgba(230, 237, 243, 0.09);">
          <div style="display: flex; align-items: baseline; gap: 10px;">
            <span style="font-family: ${MONO}; font-size: 12px; font-weight: 600; color: #e6edf3;">${b.label}</span>
            <span style="font-family: ${MONO}; font-size: 11px; color: #8b949e;">${b.hex}</span>
            <span style="font-size: 11px; color: #484f58;">${b.note}</span>
          </div>
          <div style="display: flex; align-items: center; gap: 26px; flex-wrap: wrap;">
${ICONS.map((i) => `            <div style="display: flex; align-items: flex-end; gap: 8px;">${glyph(i.name, 16, '{{accent}}')}${glyph(i.name, 32, '{{accent}}')}</div>`).join('\n')}
          </div>
        </div>`;
};

const sizes = doc({
  title: 'Legibility',
  body: `<div style="display: flex; flex-direction: column; gap: 40px; padding: 48px 44px; background: #0d1117;">
  <div style="display: flex; flex-direction: column; gap: 20px;">
${heading('Legibility at size')}
      ${lede('At 16px one em is sixteen device pixels, so the 1024-unit grid maps at <strong style="color: #e6edf3; font-weight: 600;">64 units per pixel</strong>. Every stroke, gap and counter in this set is at least 80 units &mdash; about 1.25px &mdash; which is the floor below which a feature vanishes at 16px and mushes at 32px. The finest feature in the set is the 80-unit bridge between the skull&#39;s eye sockets.')}
      <div style="display: flex; flex-direction: column; gap: 8px; padding: 20px; background: #161b22; border-radius: 12px;">
          <div style="display: grid; grid-template-columns: 150px repeat(${RAMP.length}, minmax(0, 1fr)); gap: 12px; padding: 0 18px 8px;">
            <div style="font-family: ${MONO}; font-size: 11px; letter-spacing: 0.1em; text-transform: uppercase; color: #484f58;">glyph</div>
${RAMP.map((s) => `            <div style="font-family: ${MONO}; font-size: 11px; text-align: center; color: ${s === 16 || s === 32 ? '#e6b422' : '#484f58'};">${s}px</div>`).join('\n')}
          </div>${rampRows}
      </div>
  </div>
  <div style="display: flex; flex-direction: column; gap: 20px;">
${heading('On every background')}
      ${lede('The same eight glyphs at 16px and 32px on all three theme backgrounds. The shape has to survive the lightest one &mdash; <span style="font-family: ${MONO}; color: #e6edf3;">thousand_sunny_deck</span>, the current-line and selection colour &mdash; because that is where a statusline icon has the least contrast to work with.')}
      <div style="display: flex; flex-direction: column; gap: 14px;">
${bgBand('night')}
${bgBand('calm')}
${bgBand('deck')}
      </div>
  </div>
</div>`,
  script: `<script data-dc-script data-props='{"accent":{"editor":"color","default":"#e6b422","options":["#e6b422","#fcbf49","#56d4dd","#ff6b7a"],"tsType":"string"}}'>
class Component extends DCLogic {
  renderVals() {
    return { accent: this.props.accent ?? '#e6b422' };
  }
}
</script>`,
});

fs.writeFileSync(path.join(here, 'Main.dc.html'), main);
fs.writeFileSync(path.join(here, 'Sizes.dc.html'), sizes);
console.log('wrote Main.dc.html, Sizes.dc.html');

export { ICONS, geometry, glyph, doc, heading, lede, BG, MONO, SANS, DISPLAY, here };
