import { writeFileSync } from 'node:fs';

const MONO = "'JetBrains Mono', ui-monospace, 'SF Mono', Menlo, monospace";
const BODY = "'Space Grotesk', system-ui, -apple-system, 'Segoe UI', sans-serif";
const DISPLAY = "'Bebas Neue', 'Oswald', 'Arial Narrow', sans-serif";

const m = (txt, color, extra = '') => `<span style="color: ${color};${extra}">${txt}</span>`;

// role, resolved palette name, hex, sample HTML, the highlight groups that use this color,
// optional surface the sample sits on. Groups verified against lua/grandline/highlights.lua.
const SECTIONS = [
  { title: 'Surfaces', rows: [
    ['bg', 'New World Night', '#0d1117', m('Normal', '#e6edf3'), 'Normal · LineNr · SignColumn', '#0d1117'],
    ['bg_float', 'Calm Belt', '#161b22', m('NormalFloat', '#e6edf3'), 'Pmenu · StatusLine · Folded', '#161b22'],
    ['bg_highlight', 'Thousand Sunny Deck', '#21262d', m('CursorLine', '#e6edf3'), 'PmenuSel · CursorLineNr', '#21262d'],
    ['bg_dark', 'Haki Black', '#1a1a2e', m('StatusLineNC', '#484f58'), 'TabLine · BufferLineFill', '#1a1a2e'],
  ]},
  { title: 'Text', rows: [
    ['fg', 'Ponegliff White', '#e6edf3', m('local factor', '#e6edf3'), 'Normal · @variable'],
    ['fg_muted', 'Log Pose', '#8b949e', m('= ( ) , / *', '#8b949e'), 'Operator · @punctuation'],
    ['fg_dark', 'Sea Stone', '#484f58', m('--- Lighten a hex color', '#484f58', ' font-style: italic;'), 'Comment · NonText · LineNr'],
  ]},
  { title: 'Structure', rows: [
    ['border', 'Soul King Teal', '#56d4dd',
      `<span style="display: inline-block; padding: 2px 9px; border: 1px solid #56d4dd; border-radius: 4px; color: #56d4dd;">border</span>`,
      'FloatBorder · TelescopeBorder · DiagnosticHint'],
    ['border_contrast', 'Straw', '#e6b422',
      `<span style="display: inline-flex; align-items: center; gap: 9px; color: #8b949e;">left<span style="display: inline-block; width: 2px; height: 17px; background: #e6b422;"></span>right</span>`,
      'WinSeparator · VertSplit · Title'],
    ['scroll_thumb', 'Gol D.', '#fcbf49',
      `<span style="display: inline-block; width: 132px; height: 7px; border-radius: 4px; background: #21262d;"><span style="display: block; width: 54px; height: 7px; border-radius: 4px; background: #fcbf49;"></span></span>`,
      'PmenuThumb · BlinkCmpScrollBarThumb'],
    ['scroll_gutter', 'Thousand Sunny Deck', '#21262d',
      `<span style="display: inline-block; width: 132px; height: 7px; border-radius: 4px; background: #21262d;"></span>`,
      'PmenuSbar · BlinkCmpScrollBarGutter'],
  ]},
  { title: 'Accents', rows: [
    ['primary', 'Straw', '#e6b422', `${m('function', '#e6b422')} M.${m('lighten', '#2d9d4f')}`, '@keyword.function · Title'],
    ['red', 'Gear Red', '#e63946', `${m('local', '#e63946')} r, g, b`, '@keyword · @keyword.import'],
    ['green', 'Ichimonji', '#2d9d4f', `M.${m('hex_to_rgb', '#2d9d4f')}(hex)`, '@function · @function.call'],
    ['yellow', 'Gol D.', '#fcbf49', `clamp(r, ${m('0', '#fcbf49')}, ${m('255', '#fcbf49')})`, '@number · @constant · CursorLineNr'],
    ['blue', 'All Blue', '#2f7ebf', `---@param hex ${m('string', '#2f7ebf')}`, '@type · @type.builtin'],
    ['purple', 'Robin', '#9d4edd', `${m('@deprecated', '#9d4edd')} tag`, 'CurSearch bg · @attribute'],
    ['cyan', 'Radical Beam Cyan', '#00c8d4', `colors${m('.gear_red', '#00c8d4')}`, '@property · @variable.member'],
    ['orange', 'Clima-Tact', '#f77f00', m('"#e63946"', '#f77f00'), '@string · IncSearch bg'],
  ]},
  { title: 'Bright accents', rows: [
    ['bright_red', 'Gear Fifth', '#ff6b7a', `${m('self', '#ff6b7a')}.colors<span style="background: #ff6b7a; color: #0d1117;">&nbsp;</span>`, 'Cursor · @variable.builtin'],
    ['bright_green', 'Enma Glow', '#5bda7c', m('+ added line', '#5bda7c'), 'GitSignsAdd · DiagnosticOk'],
    ['bright_yellow', 'Gol D.', '#fcbf49', m('0xfcbf49', '#fcbf49'), '@number · @constant · CursorLineNr'],
    ['bright_blue', 'Jinbe Tide', '#58a6ff', `require(${m('"grandline"', '#f77f00')})`.replace('require', m('require', '#58a6ff')), '@module · DiagnosticInfo'],
    ['bright_purple', 'Sakura Bloom', '#d970c4', m('%d+%.%d', '#d970c4'), '@string.regex · PreProc'],
    ['bright_cyan', 'Soul King Teal', '#56d4dd', m('hint: inferred', '#56d4dd'), 'FloatBorder · DiagnosticHint'],
  ]},
  { title: 'Diagnostics', rows: [
    ['error', 'Fire Fist', '#ff4500', m('unexpected symbol', '#ff4500', ' font-style: italic;'), 'DiagnosticError · @comment.error', '#2d1a1a'],
    ['warning', 'Straw Yellow', '#e6c200', m('unused local', '#e6c200', ' font-style: italic;'), 'DiagnosticWarn · MatchParen bg', '#2d2a1a'],
    ['info', 'Jinbe Tide', '#58a6ff', m('2 references', '#58a6ff', ' font-style: italic;'), 'DiagnosticInfo · @module', '#1a2a2d'],
    ['hint', 'Soul King Teal', '#56d4dd', m('parameter hex', '#56d4dd', ' font-style: italic;'), 'DiagnosticHint', '#1a2d2d'],
    ['success', 'Enma Glow', '#5bda7c', m('no issues found', '#5bda7c', ' font-style: italic;'), 'DiagnosticOk · GitSignsAdd', '#1a2d1a'],
  ]},
  { title: 'Version control', rows: [
    ['add', 'Enma Glow', '#5bda7c', m('+  local factor = 0', '#5bda7c'), 'GitSignsAdd · DiffAdd', '#1a3d2e'],
    ['change', 'Gol D.', '#fcbf49', m('~  local factor = 1', '#fcbf49'), 'GitSignsChange · DiffChange', '#3d3d1a'],
    ['delete', 'Kabuki Red', '#c41e3a', m('-  local factor', '#c41e3a'), 'GitSignsDelete · DiffDelete', '#3d1a1a'],
  ]},
  { title: 'Selection', rows: [
    ['dropdown_item_fg', 'Gear Fifth', '#ff6b7a', m('M.lighten(hex, amount)', '#ff6b7a'), 'Visual · BlinkCmpMenuSelection', '#4b242c'],
    ['dropdown_item_bg', 'literal hex', '#4b242c', m('M.darken(hex, amount)', '#ff6b7a'), 'Visual bg · BlinkCmpMenuSelection bg', '#4b242c'],
  ]},
];

const row = ([role, name, hex, sample, groups, surface = '#0d1117']) => `        <div style="display: grid; align-items: center; grid-template-columns: 236px 170px minmax(0, 1fr); gap: 14px; min-height: 36px;">
          <div style="display: flex; align-items: center; gap: 10px;">
            <div style="width: 18px; height: 18px; flex-shrink: 0; border-radius: 5px; background: ${hex}; box-shadow: inset 0 0 0 1px rgba(230, 237, 243, 0.14);"></div>
            <div style="font-family: ${MONO}; font-size: 12.5px; color: #484f58;">semantic.<span style="color: #e6edf3;">${role}</span></div>
          </div>
          <div style="display: flex; flex-direction: column; gap: 2px;">
            <div style="font-size: 11.5px; line-height: 1.3; color: #8b949e;">${name}</div>
            <div style="font-family: ${MONO}; font-size: 11px; line-height: 1.3; color: #484f58;">${hex}</div>
          </div>
          <div style="display: flex; align-items: center; justify-content: space-between; gap: 14px; height: 30px; padding: 0 11px; border-radius: 6px; background: ${surface}; box-shadow: inset 0 0 0 1px #21262d;">
            <div style="font-family: ${MONO}; font-size: 11.5px; white-space: nowrap;">${sample}</div>
            <div style="font-family: ${MONO}; font-size: 10.5px; color: #484f58; white-space: nowrap;">${groups}</div>
          </div>
        </div>`;

const section = ({ title, rows }) => `      <div style="display: flex; flex-direction: column; gap: 12px;">
        <div style="font-size: 12px; font-weight: 600; letter-spacing: 0.18em; text-transform: uppercase; line-height: 1.35; color: #8b949e;">${title}</div>
        <div style="display: flex; flex-direction: column; gap: 6px;">
${rows.map(row).join('\n')}
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
<div style="display: flex; flex-direction: column; gap: 28px; padding: 48px; background: #0d1117;">
  <div style="display: flex; align-items: center; gap: 16px;">
    <div style="width: 4px; height: 28px; border-radius: 2px; background: linear-gradient(180deg, #e63946, #f77f00);"></div>
    <h2 style="margin: 0; font-family: ${DISPLAY}; font-size: 28px; font-weight: 400; letter-spacing: 0.1em; line-height: 1; color: #e6edf3;">Semantic roles</h2>
  </div>
  <div style="display: flex; flex-direction: column; gap: 26px;">
${SECTIONS.map(section).join('\n')}
  </div>
  <div style="font-size: 11.5px; line-height: 1.5; color: #484f58; text-wrap: pretty;">Each row shows the role, the palette color it resolves to, and the highlight groups that paint with that color.</div>
</div>
</x-dc>
</body>
</html>
`;

writeFileSync(new URL('./Semantic.dc.html', import.meta.url), html);
console.log('wrote Semantic.dc.html —', SECTIONS.reduce((n, s) => n + s.rows.length, 0), 'roles in', SECTIONS.length, 'sections');
