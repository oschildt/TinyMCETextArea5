{
    "xdsVersion": "2.1.0",
    "frameworkVersion": "ext41",
    "internals": {
        "type": "textareafield",
        "reference": {
            "name": "items",
            "type": "array"
        },
        "codeClass": null,
        "userConfig": {
            "designer|userClassName": "Ext.ux.form.TinyMCETextArea",
            "designer|userAlias": "tinymce_textarea",
            "wysiwygIntialized": false,
            "intializationInProgress": false,
            "lastWidth": 0,
            "lastHeight": 0,
            "positionBeforeBlur": "",
            "noWysiwyg": false,
            "tinyMCEConfig": "{}"
        },
        "customConfigs": [
            {
                "group": "(Custom Properties)",
                "name": "wysiwygIntialized",
                "type": "boolean",
                "basic": true,
                "alternates": [
                    {
                        "type": "array"
                    },
                    {
                        "type": "number"
                    },
                    {
                        "type": "object"
                    },
                    {
                        "type": "string"
                    }
                ],
                "isCustomConfig": true,
                "obscure": false
            },
            {
                "group": "(Custom Properties)",
                "name": "intializationInProgress",
                "type": "boolean",
                "basic": true,
                "alternates": [
                    {
                        "type": "array"
                    },
                    {
                        "type": "number"
                    },
                    {
                        "type": "object"
                    },
                    {
                        "type": "string"
                    }
                ],
                "isCustomConfig": true,
                "obscure": false
            },
            {
                "group": "(Custom Properties)",
                "name": "lastWidth",
                "type": "number",
                "basic": true,
                "alternates": [
                    {
                        "type": "array"
                    },
                    {
                        "type": "boolean"
                    },
                    {
                        "type": "object"
                    },
                    {
                        "type": "string"
                    }
                ],
                "isCustomConfig": true,
                "obscure": false
            },
            {
                "group": "(Custom Properties)",
                "name": "lastHeight",
                "type": "number",
                "basic": true,
                "alternates": [
                    {
                        "type": "array"
                    },
                    {
                        "type": "boolean"
                    },
                    {
                        "type": "object"
                    },
                    {
                        "type": "string"
                    }
                ],
                "isCustomConfig": true,
                "obscure": false
            },
            {
                "group": "(Custom Properties)",
                "name": "positionBeforeBlur",
                "type": "string",
                "basic": true,
                "alternates": [
                    {
                        "type": "array"
                    },
                    {
                        "type": "boolean"
                    },
                    {
                        "type": "number"
                    },
                    {
                        "type": "object"
                    }
                ],
                "isCustomConfig": true,
                "obscure": false
            },
            {
                "group": "(Custom Properties)",
                "name": "storedCursorPosition",
                "type": "string",
                "basic": true,
                "alternates": [
                    {
                        "type": "array"
                    },
                    {
                        "type": "boolean"
                    },
                    {
                        "type": "number"
                    },
                    {
                        "type": "object"
                    }
                ],
                "isCustomConfig": true,
                "obscure": false
            },
            {
                "group": "(Custom Properties)",
                "name": "noWysiwyg",
                "type": "boolean",
                "basic": true,
                "alternates": [
                    {
                        "type": "array"
                    },
                    {
                        "type": "number"
                    },
                    {
                        "type": "object"
                    },
                    {
                        "type": "string"
                    }
                ],
                "isCustomConfig": true,
                "obscure": false
            },
            {
                "group": "(Custom Properties)",
                "name": "tinyMCEConfig",
                "type": "object",
                "basic": true,
                "alternates": [
                    {
                        "type": "array"
                    },
                    {
                        "type": "boolean"
                    },
                    {
                        "type": "number"
                    },
                    {
                        "type": "string"
                    }
                ],
                "isCustomConfig": true,
                "obscure": false
            }
        ],
        "cn": [
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "afterRender",
                    "fn": "afterRender",
                    "implHandler": [
                        "var me = this;\r",
                        "\r",
                        "    me.callParent(arguments);\r",
                        "    \r",
                        "    // If an element is a child of an invisible container like tab,\r",
                        "    // there are a number of issues which make the life complicated:\r",
                        "    //\r",
                        "    // - The element might not be completely rendered; it will be\r",
                        "    //   completely rendered only when the container becomes visible.\r",
                        "    // - The size of the element might be unknown until the container becomes\r",
                        "    //   visible. If you do size adjustment, while the container is \r",
                        "    //   not visible, the size might be calculated and set incorrectly.\r",
                        "    // - No show/hide event is fired for the element self if the container\r",
                        "    //   becomes visible or hidden. The event is fired only for that parent\r",
                        "    //   container, which is being actively shown or hidden.  \r",
                        "    // - You have to attach the event handler to the correct parent container \r",
                        "    //   and do size adjustment only if the container becomes visible.\r",
                        "    //\r",
                        "    // We check whether our TinyMCETextArea is a child of a tab panel. If yes,\r",
                        "    // we attach the event handler to the tab change event and do\r",
                        "    // size adjustment if the parent tab, which contains our TinyMCETextArea,\r",
                        "    // becomes visible.\r",
                        "    //\r",
                        "    // PS: It will not work if you have a tab control within another tab control!\r",
                        "    \r",
                        "    var tabpanel = me.findParentByType('tabpanel');\r",
                        "    if(tabpanel)\r",
                        "    {\r",
                        "      tabpanel.on('tabchange', function(tabPanel, newCard, oldCard, eOpts) {\r",
                        "        \r",
                        "        var myCard = me.findParentBy(function(cont, elm) { return cont.getId() == newCard.getId(); });         \r",
                        "        if(myCard)\r",
                        "        {\r",
                        "          me.syncEditorSize(me.lastWidth, me.lastHeight);\r",
                        "        }\r",
                        "      }, me);   \r",
                        "    }\r",
                        "    \r",
                        "    me.on('blur', function(elm, ev, eOpts) {\r",
                        "      \r",
                        "      var ctrl = document.getElementById(me.getInputId());\r",
                        "      \r",
                        "      if(me.wysiwygIntialized)\r",
                        "      {\r",
                        "        var ed = tinymce.get(me.getInputId());\r",
                        "        \r",
                        "        // In the HTML text modus, the contents should be\r",
                        "        // synchronized upon the blur event.\r",
                        "        if(ed && ed.isHidden()) \r",
                        "        {\r",
                        "          if(ctrl) \r",
                        "          {\r",
                        "            me.positionBeforeBlur = { start: ctrl.selectionStart, end: ctrl.selectionEnd };\r",
                        "          }\r",
                        "          \r",
                        "          ed.load();\r",
                        "        }\r",
                        "      }\r",
                        "      else\r",
                        "      {\r",
                        "        if(ctrl) \r",
                        "        {\r",
                        "          me.positionBeforeBlur = { start: ctrl.selectionStart, end: ctrl.selectionEnd };\r",
                        "        }  \r",
                        "      }\r",
                        "    }, me);     \r",
                        "    \r",
                        "    me.on('resize', function(elm, width, height, oldWidth, oldHeight, eOpts) {\r",
                        "      /*\r",
                        "      alert('width:' + width + '\\n' +\r",
                        "            'height:' + height + '\\n' +\r",
                        "            'oldWidth:' + oldWidth + '\\n' +\r",
                        "            'oldHeight:' + oldHeight \r",
                        "      );\r",
                        "      */\r",
                        "      \r",
                        "      if(elm.hasVisibleLabel()) \r",
                        "      {\r",
                        "        width = width - (elm.labelWidth + elm.labelPad);\r",
                        "      }\r",
                        "      \r",
                        "      me.lastWidth = width;\r",
                        "      me.lastHeight = height;\r",
                        "    \r",
                        "      if(!me.noWysiwyg && !me.wysiwygIntialized) me.initEditor();\r",
                        "      else me.syncEditorSize(me.lastWidth, me.lastHeight);\r",
                        "    }, me);  "
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "getWidthCorrection",
                    "fn": "getWidthCorrection",
                    "implHandler": [
                        "var me = this;      var widthCorrection = 0;     if(Ext.isGecko) widthCorrection = -2;     if(Ext.isOpera) widthCorrection = -2;     if(Ext.isIE) widthCorrection = -2;          return widthCorrection;"
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "syncEditorSize",
                    "fn": "syncEditorSize",
                    "designer|params": [
                        "w",
                        "h"
                    ],
                    "implHandler": [
                        "var me = this;\r",
                        "    \r",
                        "    if(!me.wysiwygIntialized || !me.rendered) return;\r",
                        "var ed = tinymce.get(me.getInputId());\r",
                        "    \r",
                        "    // if the editor is hidden, we do not syncronize\r",
                        "    \r",
                        "// because the size values of the hidden editor\r",
                        "    // are calculated wrong.\r",
                        "    \r",
                        "    if(ed.isHidden()) return;\r",
                        "    \r",
                        "    // Unfortunately, the TinyMCE has no setSize method\r",
                        "    // This method would help enormly and make the integration\r",
                        "    // very easy.\r",
                        "    //\r",
                        "    // So, we have to deal with internal issues of the editor.\r",
                        "    // We get the height of the tool bar and the status bar and\r",
                        "    // calculate the height of the content frame.\r",
                        "    \r",
                        "    var edTable = Ext.get(me.getInputId() + \"_tbl\");\r",
                        "    var edIframe = Ext.get(me.getInputId() + \"_ifr\");\r",
                        "    \r",
                        "    var edToolbar = edTable.down(\".mceToolbar\");\r",
                        "    var edStatusbar = edTable.down(\".mceStatusbar\");\r",
                        "    \r",
                        "    var frameHeight = h - 2;\r",
                        "    \r",
                        "    if(edToolbar) frameHeight -= edToolbar.getHeight();\r",
                        "    if(edStatusbar) frameHeight -= edStatusbar.getHeight();\r",
                        "\r",
                        "    edIframe.setHeight(frameHeight);\r",
                        "    \r",
                        "    edTable.setWidth(w + me.getWidthCorrection());\r",
                        "    edTable.setHeight(h);"
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "initEditor",
                    "fn": "initEditor",
                    "implHandler": [
                        "var me = this;\r",
                        "    \r",
                        "    if(me.noWysiwyg || me.intializationInProgress || me.wysiwygIntialized) return;\r",
                        "    \r",
                        "    me.intializationInProgress = true;\r",
                        "    \r",
                        "    if(!me.tinyMCEConfig) me.tinyMCEConfig = {};\r",
                        "    \r",
                        "    me.tinyMCEConfig.mode = \"exact\";\r",
                        "\t\tme.tinyMCEConfig.elements = me.getInputId();\r",
                        "\r",
                        "    // This type of resizing s very harmful by integration with ExtJS.\r",
                        "    // The editor should occupy only the place given to it by the\r",
                        "    // layout manager.\r",
                        "    me.tinyMCEConfig.theme_advanced_resizing = false;\r",
                        "    \r",
                        "    // we pass the height and width explicitly to the editor\r",
                        "    me.tinyMCEConfig.width = me.lastWidth + me.getWidthCorrection();\r",
                        "    me.tinyMCEConfig.height = me.lastHeight;\r",
                        "    \r",
                        "    if(me.readOnly) \r",
                        "    {\r",
                        "      me.tinyMCEConfig.readonly = true;\r",
                        "      me.tinyMCEConfig.height -= 3;\r",
                        "    }\r",
                        "\r",
                        "    if(me.labelEl)\r",
                        "    {\r",
                        "      me.labelEl.on('click', function(ev, elm, opts) {\r",
                        "        me.focus(false);\r",
                        "      }, me.labelEl);         \r",
                        "    }\r",
                        "    \r",
                        "    var user_setup = null;\r",
                        "    var user_onchange_callback = null;\r",
                        "    \r",
                        "    if(me.tinyMCEConfig.setup) user_setup = me.tinyMCEConfig.setup;\r",
                        "    if(me.tinyMCEConfig.onchange_callback) user_onchange_callback = me.tinyMCEConfig.onchange_callback;\r",
                        "    \r",
                        "    me.tinyMCEConfig.onchange_callback = function(ed) {\r",
                        "\r",
                        "      var oldval = me.getValue();\r",
                        "      var newval = ed.getContent();\r",
                        "    \r",
                        "      ed.save();\r",
                        "      \r",
                        "      me.fireEvent('change', me, newval, oldval, {}); \r",
                        "      \r",
                        "      if(user_onchange_callback) user_onchange_callback(ed);\r",
                        "    };\r",
                        "    \r",
                        "    me.tinyMCEConfig.setup = function(ed) {\r",
                        "    \r",
                        "      ed.onExecCommand.add(function(ed, cmd, ui, val) {\r",
                        "        if(cmd != 'mceFullScreen') return;\r",
                        "\r",
                        "        var fullscreen_container = document.getElementById(\"mce_fullscreen_container\");\r",
                        "        if(!fullscreen_container) return;\r",
                        "        \r",
                        "        fullscreen_container.style.zIndex = Ext.ZIndexManager.zBase + 2;\r",
                        "        \r",
                        "        var fullscreen_ed = tinyMCE.get(ed.getParam('fullscreen_editor_id'));\r",
                        "        if(fullscreen_ed)\r",
                        "        {\r",
                        "          fullscreen_ed.windowManager = Ext.create('Ext.ux.form.TinyMCETextAreaWindowManager', {\r",
                        "            control: me,\r",
                        "            editor: fullscreen_ed\r",
                        "          });     \r",
                        "        }\r",
                        "      });\r",
                        "      \r",
                        "      ed.onInit.add(function(ed) {\r",
                        "        me.wysiwygIntialized = true;\r",
                        "        me.intializationInProgress = false;\r",
                        "        \r",
                        "        if(me.isDisabled()) me.disableEditor();\r",
                        "      });\r",
                        "      \r",
                        "      ed.onPostRender.add(function(ed, controlManager) {\r",
                        "        ed.windowManager = Ext.create('Ext.ux.form.TinyMCETextAreaWindowManager', {\r",
                        "          control: me,\r",
                        "          editor: ed\r",
                        "        });     \r",
                        "      });\r",
                        "      \r",
                        "      if(user_setup) user_setup(ed);\r",
                        "    };  \r",
                        "    \r",
                        "    if (!tinymce.dom.Event.domLoaded) {\r",
                        "      tinymce.dom.Event.domLoaded = true;\r",
                        "    }      \r",
                        "\t\t\t    \r",
                        "    tinymce.init(me.tinyMCEConfig);"
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "getEditor",
                    "fn": "getEditor",
                    "implHandler": [
                        "var me = this;          if(!me.wysiwygIntialized)     {       return null;     }          return tinymce.get(me.getInputId());"
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "isEditorHidden",
                    "fn": "isEditorHidden",
                    "implHandler": [
                        "var me = this;          if(!me.wysiwygIntialized) return true;          var ed = tinymce.get(me.getInputId());     if(!ed) return true;          return ed.isHidden();"
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "showEditor",
                    "fn": "showEditor",
                    "implHandler": [
                        "var me = this;          me.storedCursorPosition = null;          if(!me.wysiwygIntialized)     {       me.noWysiwyg = false;       me.initEditor();       return;     }          var ed = tinymce.get(me.getInputId());      if(ed)     {       ed.show();              ed.nodeChanged();       me.syncEditorSize(me.lastWidth, me.lastHeight);       me.focus();     }"
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "hideEditor",
                    "fn": "hideEditor",
                    "implHandler": [
                        "var me = this;\r",
                        "    \r",
                        "    if(!me.wysiwygIntialized) return;\r",
                        "    \r",
                        "    var ed = tinymce.get(me.getInputId());\r",
                        "    if(!ed) return;\r",
                        "    \r",
                        "    var node = ed.selection.getNode();\r",
                        "    \r",
                        "    me.storedCursorPosition = null;\r",
                        "    \r",
                        "    // no selection, just hide\r",
                        "    \r",
                        "    if(!node || node.nodeName == \"#document\" || node.nodeName == \"BODY\" || node.nodeName == \"body\")\r",
                        "    {\r",
                        "      ed.hide();\r",
                        "\r",
                        "      return;\r",
                        "    }\r",
                        "    \r",
                        "    // otherwise try to position the cursor\r",
                        "    \r",
                        "    var marker = '<a id=\"_____sys__11223___\"></a>';\r",
                        "    ed.selection.collapse(true);\r",
                        "    ed.execCommand('mceInsertContent', 0, marker);\r",
                        "    \r",
                        "    ed.hide();\r",
                        "\r",
                        "    var ctrl = document.getElementById(me.getInputId());\r",
                        "    \r",
                        "    var pos = -1;\r",
                        "    var txt = \"\";\r",
                        "    \r",
                        "    if(ctrl) \r",
                        "    {\r",
                        "      txt = ctrl.value;\r",
                        "      pos = txt.indexOf(marker);\r",
                        "    }\r",
                        "    \r",
                        "    if(pos != -1)\r",
                        "    {\r",
                        "      var re = new RegExp(marker, \"g\");\r",
                        "      txt = txt.replace(re, \"\");\r",
                        "      ctrl.value = txt;\r",
                        "      \r",
                        "      if(ctrl.setSelectionRange)\r",
                        "      {\r",
                        "        ctrl.focus();\r",
                        "        ctrl.setSelectionRange(pos, pos);\r",
                        "      }\r",
                        "    }"
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "toggleEditor",
                    "fn": "toggleEditor",
                    "implHandler": [
                        "var me = this;          if(!me.wysiwygIntialized)      {       me.showEditor();       return;     }          var ed = tinymce.get(me.getInputId());          if (ed.isHidden())       me.showEditor();     else       me.hideEditor();"
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "removeEditor",
                    "fn": "removeEditor",
                    "implHandler": [
                        "var me = this;          if(me.intializationInProgress) return me;          if(!me.wysiwygIntialized) return me;          var ed = tinymce.get(me.getInputId());     if(ed)      {       ed.save();     }          tinyMCE.execCommand('mceRemoveControl', false, me.getInputId());      me.wysiwygIntialized = false;          return me;"
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "reinitEditor",
                    "fn": "reinitEditor",
                    "designer|params": [
                        "cfg"
                    ],
                    "implHandler": [
                        "var me = this;          if(me.noWysiwyg || me.intializationInProgress) return me;          if(!me.tinyMCEConfig) me.tinyMCEConfig = {};     if(!cfg) cfg = {};          Ext.apply(me.tinyMCEConfig, cfg);          if(!me.wysiwygIntialized) return me;          var hidden = true;          var ed = tinymce.get(me.getInputId());     if(ed)      {       hidden = ed.isHidden();       ed.save();     }          tinyMCE.execCommand('mceRemoveControl', false, me.getInputId());      me.wysiwygIntialized = false;          if(!hidden) me.initEditor();          return me;"
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "setValue",
                    "fn": "setValue",
                    "designer|params": [
                        "v"
                    ],
                    "implHandler": [
                        "var me = this;\r",
                        "    \r",
                        "    var res = me.callParent(arguments);\r",
                        "    \r",
                        "    if(me.wysiwygIntialized)\r",
                        "    {\r",
                        "      // The editor does some preformatting of the HTML text\r",
                        "      // entered by the user. \r",
                        "      // The method setValue sets the value of the textarea.\r",
                        "      // We have to load the text into editor for the\r",
                        "      // preformatting and then to save it back to the textarea.\r",
                        "      \r",
                        "      var ed = tinymce.get(me.getInputId());\r",
                        "      if(ed) \r",
                        "      {\r",
                        "        ed.load();\r",
                        "        ed.save();\r",
                        "      }\r",
                        "    }\r",
                        "    \r",
                        "    return res;  "
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "enableEditorControls",
                    "fn": "enableEditorControls",
                    "designer|params": [
                        "state"
                    ],
                    "implHandler": [
                        "var me = this;     var ed = tinymce.get(me.getInputId());     if(!ed) return;          tinymce.each(ed.controlManager.controls, function(c) {       c.setDisabled(!state);     });"
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "enable",
                    "fn": "enable",
                    "designer|params": [
                        "silent"
                    ],
                    "implHandler": [
                        "var me = this;\r",
                        "\r",
                        "    if(!me.isDisabled()) return;\r",
                        "    \r",
                        "    var ed = tinymce.get(me.getInputId());\r",
                        "    if(ed) \r",
                        "    {\r",
                        "      // We restore contentEditable to true\r",
                        "      \r",
                        "      var edIframe = Ext.get(me.getInputId() + \"_ifr\");\r",
                        "      edIframe.dom.contentDocument.body.contentEditable = true;\r",
                        "      \r",
                        "      // We have luck, because there is this useful internal method\r",
                        "      // to add all events unbound in the disable command\r",
                        "      ed.bindNativeEvents();\r",
                        "      \r",
                        "      me.enableEditorControls(true);\r",
                        "      \r",
                        "      // The call above enables ALL tollbar buttons\r",
                        "      // It is wrong. We fire this event to force adjusting \r",
                        "      // of the enabled/disabled state of the buttons to the\r",
                        "      // actual state of the editor.\r",
                        "      \r",
                        "      ed.nodeChanged();\r",
                        "    }\r",
                        "    \r",
                        "    return me.callParent(arguments);"
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "disableEditor",
                    "fn": "disableEditor",
                    "implHandler": [
                        "var me = this;\r",
                        "    \r",
                        "    var ed = tinymce.get(me.getInputId());\r",
                        "    if(ed) \r",
                        "    {\r",
                        "      // The body cannot be disabled,\r",
                        "      // So we remove events from the \r",
                        "      \r",
                        "      tinymce.dom.Event.clear(ed.getBody());\r",
                        "\t\t\ttinymce.dom.Event.clear(ed.getWin());\r",
                        "\t\t\ttinymce.dom.Event.clear(ed.getDoc());\r",
                        "      tinymce.dom.Event.clear(ed.formElement);\r",
                        "\r",
                        "      ed.onExecCommand.listeners = [];\r",
                        "      \r",
                        "      // We set the contentEditable to false\r",
                        "      var edIframe = Ext.get(me.getInputId() + \"_ifr\");\r",
                        "      edIframe.dom.contentDocument.body.contentEditable = false;\r",
                        "      \r",
                        "      // We disable all tool bar controls      \r",
                        "      me.enableEditorControls(false);\r",
                        "    }"
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "disable",
                    "fn": "disable",
                    "designer|params": [
                        "silent"
                    ],
                    "implHandler": [
                        "var me = this;          if(me.isDisabled()) return;          me.disableEditor();          return me.callParent(arguments);"
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "setReadOnly",
                    "fn": "setReadOnly",
                    "designer|params": [
                        "readOnly"
                    ],
                    "implHandler": [
                        "var me = this;          var result = me.callParent(arguments);      if(readOnly != me.tinyMCEConfig.readonly)     {       me.reinitEditor({          readonly : readOnly       });              me.syncEditorSize(me.lastWidth, me.lastHeight);     }          return result;"
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "focus",
                    "fn": "focus",
                    "designer|params": [
                        "selectText",
                        "delay"
                    ],
                    "implHandler": [
                        "var me = this;          if(me.isDisabled()) return me;      if (delay) {       if(isNaN(delay)) delay = 10;              setTimeout(function () { me.focus.call(me, selectText, false); }, delay);       return me;     }      if(!me.wysiwygIntialized)     {       return me.callParent(arguments);     }      var ed = tinymce.get(me.getInputId());          if(ed && !ed.isHidden())      {       me.callParent(arguments);              ed.focus();     }     else      {       return me.callParent(arguments);     }      return me;"
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "storeCurrentSelection",
                    "fn": "storeCurrentSelection",
                    "implHandler": [
                        "var me = this;          var wwg_mode = false;          if(me.wysiwygIntialized)     {       var ed = tinymce.get(me.getInputId());       if(ed && !ed.isHidden()) wwg_mode = true;     }          var ctrl = document.getElementById(me.getInputId());          if(wwg_mode)     {       me.storedCursorPosition = ed.selection.getBookmark('simple');     }     else if(ctrl)     {       me.storedCursorPosition = me.positionBeforeBlur;     }"
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "restoreCurrentSelection",
                    "fn": "restoreCurrentSelection",
                    "implHandler": [
                        "var me = this;          if(!me.storedCursorPosition) return;         var wwg_mode = false;          if(me.wysiwygIntialized)     {       var ed = tinymce.get(me.getInputId());       if(ed && !ed.isHidden()) wwg_mode = true;     }          var ctrl = document.getElementById(me.getInputId());          if(wwg_mode)     {       ed.selection.moveToBookmark(me.storedCursorPosition);     }     else if(ctrl)     {       ctrl.setSelectionRange(me.storedCursorPosition.start, me.storedCursorPosition.end);     }"
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "insertText",
                    "fn": "insertText",
                    "designer|params": [
                        "txt"
                    ],
                    "implHandler": [
                        "var me = this;      var wwg_mode = false;          if(me.wysiwygIntialized)     {       var ed = tinymce.get(me.getInputId());       if(ed && !ed.isHidden()) wwg_mode = true;     }          var ctrl = document.getElementById(me.getInputId());      if(wwg_mode)     {       ed.focus();       ed.execCommand('mceInsertContent', 0, txt);     }     else if(ctrl)     {       ctrl.focus();              var start = ctrl.selectionStart + txt.length;              ctrl.value = ctrl.value.slice(0, ctrl.selectionStart) + txt + ctrl.value.slice(ctrl.selectionEnd);              ctrl.setSelectionRange(start, start);     }"
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "beforeDestroy",
                    "fn": "beforeDestroy",
                    "implHandler": [
                        "var me = this;     tinyMCE.execCommand('mceRemoveControl', false, me.getInputId());"
                    ]
                }
            },
            {
                "type": "basicfunction",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "renderActiveError",
                    "fn": "renderActiveError",
                    "implHandler": [
                        " var me = this,\r",
                        "        activeError = me.getActiveError(),\r",
                        "        hasError = !!activeError;\r",
                        "\r",
                        "    var edTable = Ext.get(me.getInputId() + \"_tbl\");\r",
                        "    var edIframe = Ext.get(me.getInputId() + \"_ifr\");\r",
                        "    \r",
                        "    if(!edTable) return me.callParent(arguments);\r",
                        "    \r",
                        "    /*\r",
                        "    Adding the red border to the mceIframeContainer is the most sure\r",
                        "    way to do it without harming sizing and positioning.\r",
                        "    */    \r",
                        "    var edFrameContainer = edTable.down(\".mceIframeContainer\");\r",
                        "    \r",
                        "    if(edFrameContainer && me.rendered && !me.isDestroyed && !me.preventMark) \r",
                        "    {\r",
                        "      var ed = tinymce.get(me.getInputId());\r",
                        "      \r",
                        "      var evHandler = function(ed, e) { me.clearInvalid(); };\r",
                        "      \r",
                        "      // Add/remove invalid class\r",
                        "      if(hasError)\r",
                        "      {\r",
                        "        edFrameContainer.addCls('tinymce-error-field'); \r",
                        "        \r",
                        "        // this dirty hack is required for WebKit browsers - Safari and Chrome\r",
                        "        edIframe.setHeight(edIframe.getHeight()-1);\r",
                        "        edIframe.setHeight(edIframe.getHeight()+1);\r",
                        "        \r",
                        "        if(ed) \r",
                        "        {\r",
                        "          // the invalid mark should be removed after any \r",
                        "          // change of the contents (ExtJS standard behaviour)\r",
                        "          ed.onKeyDown.add(evHandler);\r",
                        "          ed.onChange.add(evHandler);\r",
                        "        }  \r",
                        "      }\r",
                        "      else\r",
                        "      {\r",
                        "        edFrameContainer.removeCls('tinymce-error-field'); \r",
                        "\r",
                        "        // this dirty hack is required for WebKit browsers - Safari and Chrome\r",
                        "        edIframe.setHeight(edIframe.getHeight()-1);\r",
                        "        edIframe.setHeight(edIframe.getHeight()+1);\r",
                        "        \r",
                        "        if(ed) \r",
                        "        {\r",
                        "          ed.onKeyDown.remove(evHandler);\r",
                        "          ed.onChange.remove(evHandler);\r",
                        "        }  \r",
                        "      }\r",
                        "    }\r",
                        "\r",
                        "    return me.callParent(arguments);"
                    ]
                }
            }
        ]
    },
    "linkedNodes": {},
    "boundStores": {},
    "boundModels": {},
    "id": "ucmpTinyMCETextArea",
    "name": "TinyMCETextArea",
    "category": {
        "id": "xdcForm Fields",
        "name": "Form Fields"
    }
}