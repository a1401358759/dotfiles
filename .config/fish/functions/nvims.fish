# 创建用于启动 Neovim 不同配置的别名
function nvim-lazy
    env NVIM_APPNAME=LazyVim nvim
end

function nvim-chad
    env NVIM_APPNAME=NvChad nvim
end

function nvim-astro
    env NVIM_APPNAME=AstroNvim nvim
end

# 定义用于启动 Neovim 用户选择配置的函数
function nvims
    set items LazyVim NvChad AstroNvim
    set config (printf "%s\n" $items | fzf --prompt=" Neovim Config = " --height=~50% --layout=reverse --border --exit-0)
    if [ -z $config ]
        echo "Nothing selected"
        return 0
    else if [ $config = default ]
        set config ""
    end
    env NVIM_APPNAME=$config nvim $argv
end

bind \ca 'nvims\n'```
