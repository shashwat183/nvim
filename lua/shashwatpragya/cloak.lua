require('cloak').setup({
  patterns = {
    {
      file_pattern = { '.env*', '*.properties', 'config' },
      cloak_pattern = {
        '=#B.+',
        '"#D.+',
      },
    },
  },
})
