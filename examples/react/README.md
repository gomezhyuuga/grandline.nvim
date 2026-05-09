# Grand Line Theme Examples

This folder contains example code files to showcase the syntax highlighting provided by the grandline.nvim colorscheme.

## Files

| File | Description |
|------|-------------|
| `typescript-example.ts` | TypeScript features: interfaces, types, classes, generics, decorators, etc. |
| `react-example.tsx` | React components: functional components, hooks, JSX, context, forms |
| `hooks-example.tsx` | Advanced React hooks: useReducer, useRef, custom hooks, forwardRef |

## Usage

Open these files in Neovim with the grandline colorscheme enabled to see how different syntax elements are highlighted:

```vim
:colorscheme grandline
:e examples/typescript-example.ts
```

## Highlight Groups Demonstrated

### TypeScript (`typescript-example.ts`)

| Element | Highlight Group | Color | Hex |
|---------|-----------------|-------|-----|
| Keywords (`const`, `let`, `function`) | `@keyword` | `straw` | #e6b422 |
| Types & Interfaces | `@type` | `all_blue` | #2f7ebf |
| Functions | `@function` | `ichimonji` | #2d9d4f |
| Strings | `@string` | `clima_tact` | #f77f00 |
| Numbers | `@number` | `gol_d` | #fcbf49 |
| Comments | `@comment` | `sea_stone` | #484f58 |
| Properties | `@property` | `radical_beam_cyan` | #00c8d4 |
| Decorators | `@attribute` | `robin` | #9d4edd |

### React/TSX (`react-example.tsx`, `hooks-example.tsx`)

| Element | Highlight Group | Color | Hex |
|---------|-----------------|-------|-----|
| JSX Tags | `@tag` | `straw` | #e6b422 |
| JSX Attributes | `@tag.attribute` | `robin` | #9d4edd |
| Component Names | `@type` | `all_blue` | #2f7ebf |
| Hooks | `@function.builtin` | `ichimonji` | #2d9d4f |
| Props | `@variable.parameter` | `ponegliff_white` | #e6edf3 |

## Testing the Theme

1. Ensure Treesitter is installed with TypeScript and TSX parsers:
   ```vim
   :TSInstall typescript tsx
   ```

2. Open an example file and verify colors match the expected palette.

3. Check LSP semantic tokens are working:
   ```vim
   :Inspect
   ```
