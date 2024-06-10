return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = true,
  lazy = false,
  opts = {
    fast_wrap = {
      map = '<leader>fw',
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%>%]%)%}%,]]=],
      end_key = '$',
      before_key = 'h',
      after_key = 'l',
      cursor_pos_before = true,
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      manual_position = true,
      highlight = 'Search',
      highlight_grey = 'Comment'
    }
  } -- this is equalent to setup({}) function
}
