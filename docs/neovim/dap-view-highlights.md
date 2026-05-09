# nvim-dap-view Highlight Groups

Reference for theming [nvim-dap-view](https://github.com/igorlfs/nvim-dap-view).
Source: https://igorlfs.github.io/nvim-dap-view/highlight-groups

nvim-dap-view defines 34 highlight groups, each linked to a reasonable default. Override with `vim.api.nvim_set_hl()` to match the colorscheme.

## Values

| Group | Default Link | Purpose |
|---|---|---|
| `NvimDapViewBoolean` | `Boolean` | Boolean value styling |
| `NvimDapViewConstant` | `Constant` | Constant value styling |
| `NvimDapViewFloat` | `Float` | Floating-point value |
| `NvimDapViewFunction` | `Function` | Function name |
| `NvimDapViewNumber` | `Number` | Numeric value |
| `NvimDapViewString` | `String` | String value |

## Controls (toolbar buttons)

| Group | Default Link | Purpose |
|---|---|---|
| `NvimDapViewControlPlay` | `Keyword` | Play / continue |
| `NvimDapViewControlPause` | `Boolean` | Pause execution |
| `NvimDapViewControlRunLast` | `Keyword` | Repeat last run |
| `NvimDapViewControlStepInto` | `Function` | Step into |
| `NvimDapViewControlStepOver` | `Function` | Step over |
| `NvimDapViewControlStepOut` | `Function` | Step out |
| `NvimDapViewControlStepBack` | `Function` | Step backward |
| `NvimDapViewControlTerminate` | `DapBreakpoint` | Terminate session |
| `NvimDapViewControlDisconnect` | `DapBreakpoint` | Disconnect |
| `NvimDapViewControlNC` | `Comment` | Non-current/inactive control |

## Threads & Frames

| Group | Default Link | Purpose |
|---|---|---|
| `NvimDapViewThread` | `Tag` | Thread display |
| `NvimDapViewThreadStopped` | `Conditional` | Stopped thread |
| `NvimDapViewThreadError` | `DiagnosticError` | Thread error |
| `NvimDapViewFrameCurrent` | `DiagnosticVirtualTextWarn` | Current stack frame |

## Watch & Exceptions

| Group | Default Link | Purpose |
|---|---|---|
| `NvimDapViewWatchExpr` | `Identifier` | Watch expression |
| `NvimDapViewWatchUpdated` | `DiagnosticVirtualTextWarn` | Recently updated value |
| `NvimDapViewWatchError` | `DiagnosticError` | Watch error |
| `NvimDapViewExceptionFilterEnabled` | `DiagnosticOk` | Enabled exception filter |
| `NvimDapViewExceptionFilterDisabled` | `DiagnosticError` | Disabled exception filter |

## Misc UI

| Group | Default Link | Purpose |
|---|---|---|
| `NvimDapViewFileName` | `qfFileName` | File name display |
| `NvimDapViewLineNumber` | `qfLineNr` | Line number display |
| `NvimDapViewMissingData` | `DapBreakpoint` | Unavailable data |
| `NvimDapViewSeparator` | `Comment` | UI separator |

## Tab bar

| Group | Default Link | Purpose |
|---|---|---|
| `NvimDapViewTab` | `TabLine` | Inactive tab |
| `NvimDapViewTabSelected` | `TabLineSel` | Active tab |
| `NvimDapViewTabFill` | `TabLineFill` | Tab strip background |

## Virtual Text (Neovim 0.12+)

Dimmed variants are available for Boolean, Constant, Float, Function, Number, and String:

| Group | Default Link | Purpose |
|---|---|---|
| `NvimDapViewVirtualText` | `NonText` | Fallback dimmed text |
| `NvimDapViewVirtualTextUpdated` | `NvimDapViewWatchUpdated` | Updated dimmed value |

Per-type dimmed variants are named with a `Dim` suffix and link to their base group with `dim = true`:
`NvimDapViewBooleanDim`, `NvimDapViewStringDim`, `NvimDapViewNumberDim`, `NvimDapViewFloatDim`, `NvimDapViewFunctionDim`, `NvimDapViewConstantDim`.
