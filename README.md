# 配置過程

[https://github.com/SolDoesTech/HyprV4](https://github.com/SolDoesTech/HyprV4)

### 一个基本的美化分为以下几部分

- 状态栏美化
- 启动器美化
- 特效美化
- 通知美化
- 其他

1. 窗口管理器
   当然是 i3wm，成熟的社区，完善的文档，规范的代码都是我选择 i3 的原因。
   另外 container 概念的使用，使一个桌面内同时存在多个布局成为了可能。
   当然，如果你并不偏好 i3wm ，使用其他 WM 也是完全可以的，不过可以考虑把 i3 中的部分配置提取出来，包括 picom、polybar 的启动,音量加减快捷键等等。

   - 相关文件夹 `i3`

2. 状态栏美化
   本次选用的是 polybar，一个非常成熟，社区资源非常多的状态栏程序。

   **准备工作**

   - 请自行寻找苹果的 SF Pro 字体
   - 安装 polybar 及相关依赖
   - 相关文件夹 `polybar`

3. 启动器
   当然是 rofi，扩展性 max，现在的程序启动、切换，密码管理等等都已经离不开 rofi。

   **准备工作**

   - 安装 [https://github.com/adi1090x/rofi](rofi themes)
   - 相关文件夹 `rofi`

4. 特效
   就是混成器，窗口阴影、透明之类的都靠它，选用 picom，前身是大名鼎鼎的 compton，后来貌似因为重名太多，现维护者接手后改名为 picom

   - 相关文件夹 `picom`

5. 通知
   当然使用 dunst。表现中规中矩，稳定就是最好的。当然也有一些贴心的小功能。现在加减音量时也搭配 dunst。

   - 相关文件夹 `dunst`

# 安装方法

1. 配置文件或者文件夹请放到 ~/.config/ 下
2. 做完之前的准备工作，再将文件放到对应位置后即可安装完成。
3. 如果需要覆盖，那么覆盖前尽量备份。

# 依赖

- 终端：kitty
- 程序启动器：rofi
- 壁纸设置器：feh
- 特效合成器：picom
- 截图工具：flameshot
- 输入法：fcitx5
- 状态栏：polybar
- 通知管理器：dunst
- 锁屏管理器：betterlockscreen, xautolock
- PDF 阅读器：zathura
- 文本编辑器：nvim
- 屏幕亮度调节器：light
- 字体：JetBrainsMono Nerd Font、Fira Code Mono
