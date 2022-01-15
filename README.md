My neovim configuration.

Mainly built from the amazing [neovim from scratch](https://github.com/LunarVim/Neovim-from-scratch) with accompanying [videos](https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ). From @ChristianChiarulli

As per the words of @adamhjk. Everything inside it remains GPLv3, though - because it's not just inspired by, it is a direct continuation of the upstream repo.

Thanks to all plugin authors.

Configuration uses Lua, see ``init.lua``
Plugins used are found in the file ``lua/user/plugins.lua`` file.
In a nutshell, coq for completion, telescope for finding things, chadtree for a file explorer, and more.

Convention from Neovim-from-scratch are used. Having all configuration in a ``user`` (name can be changed) acts as a namespace and prevents conflicts.
