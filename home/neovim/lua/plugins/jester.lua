return {
  'David-Kunz/jester',
  config = function()
    local configs = require('jester')

    configs.setup({
        cmd = "npm run test -- -t '$result' $file"
    })
  end
}
