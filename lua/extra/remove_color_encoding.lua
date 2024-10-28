vim.paste = (function(overridden)
  return function(lines, phase)
    for i,line in ipairs(lines) do
      -- Scrub ANSI color codes from paste input.
      lines[i] = line:gsub('\27%[[0-9;mK]+', '')
    end
    return overridden(lines, phase)
  end
end)(vim.paste)
