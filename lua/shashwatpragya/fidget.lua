require('fidget').setup({
  text = {
    done = "", -- character shown when all tasks are complete
  },
  timer = {
    spinner_rate = 1000, -- frame rate of spinner animation, in ms
    fidget_decay = 2000, -- how long to keep around empty fidget, in ms
    task_decay = 3000,   -- how long to keep around completed task, in ms
  },
})
