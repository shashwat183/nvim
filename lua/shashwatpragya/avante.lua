require('avante').setup({
  provider = "gemini",
  gemini = {
    endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
    model = "gemini-2.5-flash-preview-04-17",
    timeout = 30000, -- Timeout in milliseconds
    temperature = 0,
    max_tokens = 8192,
  },
})
