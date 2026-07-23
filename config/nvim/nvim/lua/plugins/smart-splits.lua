return {
    'mrjones2014/smart-splits.nvim',
    -- Automatically compile/link Kitty kittens when the plugin installs/updates
    build = './kitty/install-kittens.bash', 
    lazy = false, -- Needs to load early to capture remote connections
    config = function()
        require('smart-splits').setup({
            -- Tells the plugin to use Kitty's internal socket API
            multiplexer_integration = 'kitty',
        })
    end
}
