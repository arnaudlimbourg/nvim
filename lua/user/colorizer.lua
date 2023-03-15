local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	return
end

colorizer.setup({
  'css';
  'javascript';
  'json';
  html = {
    mode = 'foreground';
  }
})
