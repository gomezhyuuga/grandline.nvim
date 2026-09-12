// Generates Contrast.dc.html and InContext.dc.html.
//   node docs/design/icons/gen-context.mjs
import fs from 'node:fs';
import path from 'node:path';
import { ICONS, glyph, doc, heading, lede, BG, MONO, DISPLAY, here } from './gen-boards.mjs';

// Ratios computed from the palette against each theme background (WCAG 2.x).
const RATIOS = [
  ['ponegliff_white',   '#e6edf3', 16.02, 14.64, 12.88],
  ['beli_gold',         '#ffd700', 13.49, 12.33, 10.85],
  ['gol_d',             '#fcbf49', 11.43, 10.45,  9.20],
  ['soul_king_teal',    '#56d4dd', 10.69,  9.77,  8.59],
  ['enma_glow',         '#5bda7c', 10.60,  9.69,  8.53],
  ['straw',             '#e6b422',  9.84,  8.99,  7.91],
  ['radical_beam_cyan', '#00c8d4',  9.20,  8.41,  7.40],
  ['jinbe_tide',        '#58a6ff',  7.49,  6.85,  6.03],
  ['clima_tact',        '#f77f00',  7.20,  6.58,  5.79],
  ['gear_fifth',        '#ff6b7a',  6.88,  6.29,  5.53],
  ['sakura_bloom',      '#d970c4',  6.37,  5.82,  5.12],
  ['fire_fist',         '#ff4500',  5.50,  5.03,  4.42],
  ['gray_terminal',     '#7d8590',  5.07,  4.64,  4.08],
  ['gear_red',          '#e63946',  4.54,  4.15,  3.65],
  ['all_blue',          '#2f7ebf',  4.38,  4.00,  3.52],
  ['robin',             '#9d4edd',  4.12,  3.76,  3.31],
  ['sea_stone',         '#484f58',  2.28,  2.09,  1.84],
];

const BAR = '#484f58';
const cell = (v, weak) => `<div style="font-family: ${MONO}; font-size: 12px; text-align: right; color: ${v < 3 ? '#ff6b7a' : weak ? '#e6b422' : '#8b949e'};">${v.toFixed(2)}</div>`;

const ratioRows = RATIOS.map(([name, hex, a, b, c]) => {
  const fails = c < 3;
  const weak = !fails && c < 4;
  const verdict = fails
    ? `<span style="font-size: 11px; font-weight: 600; color: #ff6b7a;">FAILS 3:1</span>`
    : weak
      ? `<span style="font-size: 11px; font-weight: 600; color: #e6b422;">MARGINAL</span>`
      : `<span style="font-size: 11px; color: #5bda7c;">PASSES</span>`;
  return `
          <div style="display: grid; grid-template-columns: 24px 176px 96px repeat(3, minmax(0, 1fr)) 96px; align-items: center; gap: 14px; padding: 9px 16px; border-radius: 8px; background: ${fails ? 'rgba(255, 107, 122, 0.08)' : 'transparent'};">
            <div style="width: 20px; height: 20px; border-radius: 5px; background: ${hex}; box-shadow: inset 0 0 0 1px rgba(230, 237, 243, 0.12);"></div>
            <div style="font-family: ${MONO}; font-size: 12px; color: #e6edf3;">${name}</div>
            <div style="font-family: ${MONO}; font-size: 12px; color: #484f58;">${hex}</div>
            ${cell(a, false)}${cell(b, false)}${cell(c, weak)}
            <div style="text-align: right;">${verdict}</div>
          </div>`;
}).join('');

const swatchStrip = (bgKey) => {
  const b = BG[bgKey];
  const picks = ['#e6b422', '#fcbf49', '#56d4dd', '#5bda7c', '#58a6ff', '#ff6b7a', '#7d8590'];
  return `
        <div style="display: flex; flex-direction: column; gap: 12px; padding: 18px 20px; border-radius: 12px; background: ${b.hex}; box-shadow: inset 0 0 0 1px rgba(230, 237, 243, 0.09);">
          <div style="font-family: ${MONO}; font-size: 11px; color: #8b949e;">${b.label} &middot; ${b.hex}</div>
          <div style="display: flex; align-items: flex-end; gap: 22px; flex-wrap: wrap;">
${picks.map((c) => `            <div style="display: flex; align-items: flex-end; gap: 7px;">${glyph('log_pose', 16, c)}${glyph('log_pose', 32, c)}</div>`).join('\n')}
          </div>
        </div>`;
};

const contrast = doc({
  body: `<div style="display: flex; flex-direction: column; gap: 40px; padding: 48px 44px; background: #0d1117;">
  <div style="display: flex; flex-direction: column; gap: 20px;">
${heading('Colour and contrast')}
      ${lede('The glyph carries no colour of its own, so contrast is entirely the highlight group&#39;s job. These are measured WCAG ratios against the three theme backgrounds. Icons are non-text content, so the bar is <strong style="color: #e6edf3; font-weight: 600;">3:1</strong>, and the column that decides it is the lightest background &mdash; <span style="font-family: ${MONO};">thousand_sunny_deck</span>.')}
      <div style="display: flex; flex-direction: column; gap: 2px; padding: 18px 8px; background: #161b22; border-radius: 12px;">
          <div style="display: grid; grid-template-columns: 24px 176px 96px repeat(3, minmax(0, 1fr)) 96px; align-items: end; gap: 14px; padding: 0 16px 10px;">
            <div></div><div></div><div></div>
            <div style="font-family: ${MONO}; font-size: 11px; text-align: right; color: ${BAR};">#0d1117</div>
            <div style="font-family: ${MONO}; font-size: 11px; text-align: right; color: ${BAR};">#161b22</div>
            <div style="font-family: ${MONO}; font-size: 11px; text-align: right; color: #e6b422;">#21262d</div>
            <div></div>
          </div>${ratioRows}
      </div>
      <div style="display: flex; gap: 14px; padding: 18px 20px; background: rgba(255, 107, 122, 0.08); border-radius: 12px; box-shadow: inset 0 0 0 1px rgba(255, 107, 122, 0.28);">
        <div style="width: 4px; border-radius: 2px; background: #ff6b7a; flex: none;"></div>
        <div style="display: flex; flex-direction: column; gap: 5px;">
          <div style="font-size: 14px; font-weight: 600; color: #ff6b7a;">Never tint an icon with sea_stone</div>
          <div style="max-width: 62ch; font-size: 13px; line-height: 1.5; color: #8b949e; text-wrap: pretty;"><span style="font-family: ${MONO}; color: #e6edf3;">#484f58</span> is UI chrome &mdash; line numbers, borders, split rules &mdash; not ink. It reaches only 2.28:1 on the darkest background and 1.84:1 on the lightest, so it fails 3:1 everywhere in the theme. For a muted or inactive icon use <span style="font-family: ${MONO}; color: #7d8590;">gray_terminal</span> (4.08:1) or <span style="font-family: ${MONO}; color: #8b949e;">log_pose</span> (4.95:1).</div>
        </div>
      </div>
      <div style="display: flex; gap: 14px; padding: 18px 20px; background: rgba(230, 180, 34, 0.07); border-radius: 12px; box-shadow: inset 0 0 0 1px rgba(230, 180, 34, 0.26);">
        <div style="width: 4px; border-radius: 2px; background: #e6b422; flex: none;"></div>
        <div style="display: flex; flex-direction: column; gap: 5px;">
          <div style="font-size: 14px; font-weight: 600; color: #e6b422;">robin and all_blue clear 3:1 only just</div>
          <div style="max-width: 62ch; font-size: 13px; line-height: 1.5; color: #8b949e; text-wrap: pretty;">3.31:1 and 3.52:1 on <span style="font-family: ${MONO}; color: #e6edf3;">thousand_sunny_deck</span>. They are fine at 32px on a dark panel; keep them off 16px glyphs and off selected rows, where a thin counter and a weak tint compound.</div>
        </div>
      </div>
  </div>
  <div style="display: flex; flex-direction: column; gap: 20px;">
${heading('The safe tints, at size')}
      ${lede('<span style="font-family: ${MONO};">log_pose</span> at 16px and 32px in every colour that passes on all three backgrounds, shown on each of them.')}
      <div style="display: flex; flex-direction: column; gap: 14px;">
${swatchStrip('night')}
${swatchStrip('calm')}
${swatchStrip('deck')}
      </div>
  </div>
</div>`,
});

// ─── In context ───────────────────────────────────────────────────────────────
const mono13 = `font-family: ${MONO}; font-size: 13px;`;
const seg = (bg, fg, content, weight = '400') =>
  `<div style="display: flex; align-items: center; gap: 8px; padding: 0 14px; height: 34px; background: ${bg}; color: ${fg}; ${mono13} font-weight: ${weight};">${content}</div>`;

const panelLabel = (text, note) => `
      <div style="display: flex; align-items: baseline; gap: 10px;">
        <span style="font-family: ${MONO}; font-size: 12px; font-weight: 600; color: #e6edf3;">${text}</span>
        <span style="font-size: 12px; color: #484f58;">${note}</span>
      </div>`;

const inContext = doc({
  body: `<div style="display: flex; flex-direction: column; gap: 40px; padding: 48px 44px; background: #0d1117;">
  <div style="display: flex; flex-direction: column; gap: 20px;">
${heading('In place')}
      ${lede('Every icon below is rendered at 16px &mdash; the size it actually appears at in a statusline &mdash; against the real lualine and tabline colours from <span style="font-family: ${MONO};">lua/lualine/themes/grandline.lua</span>. Note the inversion: on the <span style="font-family: ${MONO}; color: #e6b422;">straw</span> mode block the glyph has to be dark ink (<span style="font-family: ${MONO};">#0d1117</span>, 9.84:1), not light.')}

      <div style="display: flex; flex-direction: column; gap: 12px;">
${panelLabel('Tabline', 'tabby head + tabs')}
        <div style="display: flex; overflow: hidden; border-radius: 8px; background: #161b22;">
          ${seg('#e6b422', '#0d1117', `${glyph('straw_hat', 16, '#0d1117')}<span>GRAND LINE</span>`, '600')}
          ${seg('#21262d', '#e6edf3', `${glyph('going_merry', 16, '#e6b422')}<span>palette.lua</span>`)}
          ${seg('#161b22', '#8b949e', `${glyph('thousand_sunny', 16, '#7d8590')}<span>highlights.lua</span>`)}
          ${seg('#161b22', '#8b949e', `${glyph('devil_fruit', 16, '#7d8590')}<span>init.lua</span>`)}
        </div>
      </div>

      <div style="display: flex; flex-direction: column; gap: 12px;">
${panelLabel('Statusline', 'normal mode')}
        <div style="display: flex; overflow: hidden; border-radius: 8px; background: #161b22;">
          ${seg('#e6b422', '#0d1117', `${glyph('straw_hat', 16, '#0d1117')}<span>NORMAL</span>`, '600')}
          ${seg('#21262d', '#e6edf3', `${glyph('straw_hat_flag', 16, '#fcbf49')}<span>main</span>`)}
          ${seg('#161b22', '#8b949e', `${glyph('den_den_mushi', 16, '#ff6b7a')}<span>2</span>${glyph('log_pose', 16, '#58a6ff')}<span>7</span>`)}
          <div style="flex-grow: 1; background: #161b22;"></div>
          ${seg('#21262d', '#e6edf3', `${glyph('devil_fruit', 16, '#56d4dd')}<span>lua</span>`)}
          ${seg('#21262d', '#e6edf3', '<span>142:18</span>')}
        </div>
      </div>

      <div style="display: flex; flex-direction: column; gap: 12px;">
${panelLabel('Statusline', 'inactive window')}
        <div style="display: flex; overflow: hidden; border-radius: 8px; background: #1a1a2e;">
          ${seg('#1a1a2e', '#7d8590', `${glyph('straw_hat', 16, '#7d8590')}<span>grandline.nvim</span>`)}
          <div style="flex-grow: 1; background: #1a1a2e;"></div>
          ${seg('#1a1a2e', '#7d8590', '<span>18:4</span>')}
        </div>
        <div style="max-width: 68ch; font-size: 12px; line-height: 1.5; color: #484f58; text-wrap: pretty;">The lualine <span style="font-family: ${MONO};">inactive</span> group paints text in <span style="font-family: ${MONO};">sea_stone</span> on <span style="font-family: ${MONO};">haki_black</span>. That is 1.9:1 &mdash; fine for dimmed text, too weak for a glyph, so the icon here is lifted to <span style="font-family: ${MONO}; color: #7d8590;">gray_terminal</span>.</div>
      </div>
  </div>

  <div style="display: flex; flex-direction: column; gap: 20px;">
${heading('Floats and pickers')}
      <div style="display: flex; gap: 18px; flex-wrap: wrap;">
        <div style="display: flex; flex-direction: column; gap: 2px; padding: 14px 0; min-width: 340px; flex-grow: 1; background: #161b22; border-radius: 10px; box-shadow: inset 0 0 0 1px #56d4dd;">
          <div style="padding: 0 16px 10px; font-family: ${MONO}; font-size: 11px; letter-spacing: 0.1em; text-transform: uppercase; color: #484f58;">find files</div>
          <div style="display: flex; align-items: center; gap: 10px; padding: 8px 16px; background: #21262d; ${mono13} color: #e6edf3;">${glyph('log_pose', 16, '#e6b422')}<span>lua/grandline/palette.lua</span></div>
          <div style="display: flex; align-items: center; gap: 10px; padding: 8px 16px; ${mono13} color: #8b949e;">${glyph('log_pose', 16, '#7d8590')}<span>lua/grandline/highlights.lua</span></div>
          <div style="display: flex; align-items: center; gap: 10px; padding: 8px 16px; ${mono13} color: #8b949e;">${glyph('log_pose', 16, '#7d8590')}<span>fonts/icons/straw-hat.svg</span></div>
        </div>
        <div style="display: flex; flex-direction: column; gap: 10px; padding: 16px 18px; min-width: 320px; flex-grow: 1; background: #161b22; border-radius: 10px; box-shadow: inset 0 0 0 1px rgba(230, 237, 243, 0.09);">
          <div style="display: flex; align-items: center; gap: 10px;">${glyph('den_den_mushi', 16, '#5bda7c')}<span style="${mono13} font-weight: 600; color: #e6edf3;">lua_ls</span><span style="${mono13} color: #484f58;">attached</span></div>
          <div style="display: flex; align-items: center; gap: 10px;">${glyph('den_den_mushi', 16, '#e6b422')}<span style="${mono13} font-weight: 600; color: #e6edf3;">stylua</span><span style="${mono13} color: #484f58;">formatting&hellip;</span></div>
          <div style="display: flex; align-items: center; gap: 10px;">${glyph('jolly_roger', 16, '#ff6b7a')}<span style="${mono13} font-weight: 600; color: #e6edf3;">1 error</span><span style="${mono13} color: #484f58;">palette.lua:118</span></div>
        </div>
      </div>
  </div>
</div>`,
});

fs.writeFileSync(path.join(here, 'Contrast.dc.html'), contrast);
fs.writeFileSync(path.join(here, 'InContext.dc.html'), inContext);
console.log('wrote Contrast.dc.html, InContext.dc.html');
