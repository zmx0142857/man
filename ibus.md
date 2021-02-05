ibus - input method framework under gnome

    for full article, see: https://www.2cto.com/os/201207/144189.html

    1. install Chinese language

        System Settings -> Language Support -> Install/Remove Languages

        select both traditional & simplified Chinese

    2. ubuntu <= 16.04: install and switch to ibus

        $ sudo apt install ibus ibus-clutter ibus-gtk ibus-qt4

        $ im-config -s ibus

        logout and login again.

    3. install input method

        choose the one you prefer:

        $ sudo apt install ibus-rime librime-data-wubi # recommended
        $ sudo apt install ibus-table-wubi
        $ sudo apt install ibus-pinyin
        $ sudo apt install ibus-googlepinyin
        $ sudo apt install ibus-sunpinyin

    4. some ibus commands

        $ ibus-setup        # a gui setup page
        $ ibus-daemon -drx  # restart ibus daemon

    5. logout and login.
       click System -> Region & Language -> Input Sources

        unchoose Chinese, then choose Chinese again.
        if everything is alright, intelligent-pinyin and wubi-jidian, etc
        will appear. just choose one from them

    6. (for jidian)
    =================================================================
    jidian-wubi setup                                   * not default
    -----------------------------------------------------------------
    [settings]

    * input mode            direct      # direct=english, table=wubi
    chinese mode            all chinese characters
    char width
      table letter          half
      table puctuation      full        # or half (dealing with math)
      direct letter         half
      * direct puctuation   half
    show candidate list     yes
    orientation             vertical
    page size               10

    [details]

    compose                 phrase
    auto select             no
    auto commit mode        on
    behavior of space key   commit
    auto wildcard           yes         # use 'no' and some phrases
                                        # will be unavailable
    =================================================================

    7. (for rime)

    create file: ~/.config/ibus/rime/default.custom.yaml
    ---------------------------------------
    # default.custom.yaml
    patch:
      schema_list:
        - schema: wubi86
            wubi86.schema.yaml
    ---------------------------------------

    edit file: ~/config/ibus/rime/build/wubi86.schema.yaml
    find "switches" in the file, change "reset" from 1 to 0
    to make rime start at english mode
    ------------------------------------------------------
    switches:
      - name: ascii_mode
        reset: 0
        states: ["中文", "西文"]
      - name: full_shape
        states: ["半角", "全角"]
      - name: extended_charset
        states: ["常用", "增廣"]
      - name: ascii_punct
        states: ["。，", "．，"]
    ------------------------------------------------------

ibus - archlinux
    https://wiki.archlinux.org/index.php/IBus_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)
    $ sudo pacman -S ibus ibus-rime rime-wubi
    $ ibus-setup
    ----~/.xprofile-------------
    export GTK_IM_MODULE=ibus
    export QT_IM_MODULE=ibus
    export XMOODIFIERS="@im=ibus"
    ibus-daemon -x -d
    ----------------------------
