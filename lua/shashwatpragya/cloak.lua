require('cloak').setup({
  patterns = {
    {
      file_pattern = { '.env*', '*.properties' },
      cloak_pattern = '=#B.+',
    },
  },
})
