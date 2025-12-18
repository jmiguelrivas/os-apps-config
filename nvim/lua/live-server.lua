local port = 8080

vim.api.nvim_create_user_command("Live", function(opts)
	if opts.args == "stop" then
		-- Kill any process using the port (reliable method)
		vim.fn.system("fuser -k " .. port .. "/tcp")
		vim.notify("🟥 Killed process using port " .. port, vim.log.levels.INFO)
		return
	end

	vim.fn.jobstart({ "python3", "-m", "http.server", tostring(port) }, { cwd = vim.fn.getcwd() })

	vim.notify("✅ Live server started at http://localhost:" .. port, vim.log.levels.INFO)

	vim.fn.jobstart({
		"brave-browser",
		"--disable-cache",
		"http://localhost:" .. port,
	}, { detach = true })
end, { nargs = "?" })
