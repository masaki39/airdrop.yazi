local selected_or_hovered = ya.sync(function()
    local tab, paths = cx.active, {}
    for _, u in pairs(tab.selected) do
        paths[#paths + 1] = tostring(u)
    end
    if #paths == 0 and tab.current.hovered then
        paths[1] = tostring(tab.current.hovered.url)
    end
    return paths
end)

return {
    entry = function()
        local urls = selected_or_hovered()
        if #urls == 0 then
            return ya.notify({ title = "airdrop.yazi", content = "No file selected or hovered", level = "warn", timeout = 3 })
        end

        -- Reveal (and select) the target file(s) in Finder first, so the
        -- AirDrop shortcut below shares them instead of opening blindly.
        local reveal = Command("open"):arg({ "-R" })
        for _, url in ipairs(urls) do
            reveal = reveal:arg(url)
        end
        local output, err = reveal:stderr(Command.PIPED):output()
        if not output or not output.status.success then
            return ya.notify({
                title = "airdrop.yazi",
                content = tostring(err or (output and output.stderr) or "open -R failed"),
                level = "error",
                timeout = 3,
            })
        end

        -- Give Finder a beat to settle the selection, then trigger its
        -- built-in "Share via AirDrop" shortcut (Cmd+Shift+R) on it.
        local script = table.concat({
            'tell application "Finder" to activate',
            "delay 0.3",
            'tell application "System Events" to keystroke "r" using {command down, shift down}',
        }, "\n")
        local as_output, as_err = Command("osascript"):arg({ "-e", script }):stderr(Command.PIPED):output()
        if not as_output or not as_output.status.success then
            ya.notify({
                title = "airdrop.yazi",
                content = tostring(as_err or (as_output and as_output.stderr) or "osascript failed"),
                level = "error",
                timeout = 3,
            })
        end
    end,
}
