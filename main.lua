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

        local cmd = Command("airdrop")
        for _, url in ipairs(urls) do
            cmd = cmd:arg(url)
        end

        local output, err = cmd:stderr(Command.PIPED):output()
        if not output then
            return ya.notify({
                title = "airdrop.yazi",
                content = "`airdrop` command not found. Install it with: brew install vldmrkl/formulae/airdrop-cli ("
                    .. tostring(err)
                    .. ")",
                level = "error",
                timeout = 5,
            })
        end
        if not output.status.success then
            ya.notify({
                title = "airdrop.yazi",
                content = tostring(output.stderr ~= "" and output.stderr or "airdrop command failed"),
                level = "error",
                timeout = 5,
            })
        end
    end,
}
