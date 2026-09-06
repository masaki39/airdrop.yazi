return {
    entry = function()
        local output, err = Command("osascript")
            :arg({
                "-e", 'tell application "Finder" to activate',
                "-e", 'tell application "System Events" to keystroke "r" using {command down, shift down}',
            })
            :stderr(Command.PIPED)
            :output()

        if not output or not output.status.success then
            local content = tostring(err or (output and output.stderr) or "osascript failed")
            ya.notify { title = "airdrop.yazi", content = content, level = "error", timeout = 3 }
        end
    end,
}
