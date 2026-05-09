  Neovim Options                                                                
                                                                                
  vim.opt.cursorline = true       -- Enable cursor line highlighting            
  vim.opt.cursorlineopt = "both"  -- What to highlight                          
                                                                                
  cursorlineopt values:                                                         
  ┌──────────────┬─────────────────────────────────────────────┐                
  │    Value     │                   Effect                    │                
  ├──────────────┼─────────────────────────────────────────────┤                
  │ "line"       │ Highlights entire line background (default) │                
  ├──────────────┼─────────────────────────────────────────────┤                
  │ "number"     │ Highlights only the line number             │                
  ├──────────────┼─────────────────────────────────────────────┤                
  │ "both"       │ Highlights both line and number             │                
  ├──────────────┼─────────────────────────────────────────────┤                
  │ "screenline" │ Only visible screen line (for wrapped text) │                
  └──────────────┴─────────────────────────────────────────────┘                
  Highlight Groups                                                              
  ┌────────────────┬────────────────────────────────┐                           
  │     Group      │            Purpose             │                           
  ├────────────────┼────────────────────────────────┤                           
  │ CursorLine     │ Background of the cursor line  │                           
  ├────────────────┼────────────────────────────────┤                           
  │ CursorLineNr   │ Line number on the cursor line │                           
  ├────────────────┼────────────────────────────────┤                           
  │ CursorColumn   │ Vertical column highlight      │                           
  ├────────────────┼────────────────────────────────┤                           
  │ CursorLineFold │ Fold column at cursor line     │                           
  ├────────────────┼────────────────────────────────┤                           
  │ CursorLineSign │ Sign column at cursor line     │                           
  └────────────────┴────────────────────────────────┘                           
  Your Current Implementation                                                   
                                                                                
  Your theme already defines these in lua/grandline/highlights.lua:25-29:       
                                                                                
  hi("CursorLine", { bg = c.thousand_sunny_deck })                              
  hi("CursorLineNr", { fg = c.gol_d, bg = c.thousand_sunny_deck, bold = true }) 
  hi("CursorColumn", { bg = c.thousand_sunny_deck })                            
                                                                                
  Suggested Additions                                                           
                                                                                
  For complete coverage, you could add:                                         
                                                                                
  hi("CursorLineFold", { link = "CursorLineNr" })                               
  hi("CursorLineSign", { bg = c.thousand_sunny_deck })                          
                                                                                
  This ensures sign column and fold indicators stay consistent when on the      
  cursor line.                                                                  
                                                                                
