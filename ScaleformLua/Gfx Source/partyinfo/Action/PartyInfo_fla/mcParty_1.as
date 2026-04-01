package PartyInfo_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class mcParty_1 extends MovieClip
    {
        public var idxMaster:MovieClip;
        public var LIRChar2:LIRChar;
        public var idx1:MovieClip;
        public var LIRChar3:LIRChar;
        public var idx2:MovieClip;
        public var idx3:MovieClip;
        public var idx4:MovieClip;
        public var idx5:MovieClip;
        public var idx6:MovieClip;
        public var LIRChar8:LIRChar;
        public var idx7:MovieClip;
        public var LIRChar4:LIRChar;
        public var LIRChar5:LIRChar;
        public var LIRChar6:LIRChar;
        public var LIRChar7:LIRChar;
        public var popupParty:MovieClip;
        public var LIRChar1:LIRChar;
        public var labelItem:Label;
        public var labelMoney:Label;
        public var comboItem:DropdownMenu;
        public var comboItemFilter:DropdownMenu;
        public var comboMoney:DropdownMenu;
        public var checkInfo:CheckBox;
        public var checkInfo_text:Label;
        public var checkBuff:CheckBox;
        public var checkBuff_text:Label;
        public var btnFriend0:Button;
        public var btnFriend1:Button;
        public var btnFriend2:Button;
        public var btnFriend3:Button;
        public var btnFriend4:Button;
        public var btnFriend5:Button;
        public var btnFriend6:Button;
        public var btnFriend7:Button;
        public var btnCharInfo0:Button;
        public var btnCharInfo1:Button;
        public var btnCharInfo2:Button;
        public var btnCharInfo3:Button;
        public var btnCharInfo4:Button;
        public var btnCharInfo5:Button;
        public var btnCharInfo6:Button;
        public var btnCharInfo7:Button;
        public var btnExpel:Button;
        public var btnDelegate:Button;
        public var btnDissolve:Button;
        public var btnLeave:Button;
        public var list:ScrollingList;

        public function mcParty_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_list_mcParty_list_0();
            this.__setProp_comboItem_mcParty_btn_0();
            this.__setProp_comboMoney_mcParty_btn_0();
            this.__setProp_btnExpel_mcParty_btn_0();
            this.__setProp_btnDelegate_mcParty_btn_0();
            this.__setProp_btnDissolve_mcParty_btn_0();
            this.__setProp_btnLeave_mcParty_btn_0();
            this.__setProp_btnFriend0_mcParty_btn_0();
            this.__setProp_btnFriend1_mcParty_btn_0();
            this.__setProp_btnFriend2_mcParty_btn_0();
            this.__setProp_btnFriend3_mcParty_btn_0();
            this.__setProp_btnFriend4_mcParty_btn_0();
            this.__setProp_btnFriend5_mcParty_btn_0();
            this.__setProp_btnFriend6_mcParty_btn_0();
            this.__setProp_btnFriend7_mcParty_btn_0();
            this.__setProp_btnCharInfo0_mcParty_btn_0();
            this.__setProp_btnCharInfo1_mcParty_btn_0();
            this.__setProp_btnCharInfo2_mcParty_btn_0();
            this.__setProp_btnCharInfo3_mcParty_btn_0();
            this.__setProp_btnCharInfo4_mcParty_btn_0();
            this.__setProp_btnCharInfo5_mcParty_btn_0();
            this.__setProp_btnCharInfo6_mcParty_btn_0();
            this.__setProp_btnCharInfo7_mcParty_btn_0();
            this.__setProp_comboItemFilter_mcParty_btn_0();
            return;
        }// end function

        function __setProp_list_mcParty_list_0()
        {
            try
            {
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.list.enabled = true;
            this.list.focusable = false;
            this.list.itemRendererName = "";
            this.list.itemRendererInstanceName = "LIRChar";
            this.list.margin = 0;
            this.list.multiSelect = false;
            this.list.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.list.rowHeight = 47;
            this.list.scrollBar = "";
            this.list.treeButtonClassName = "";
            this.list.treeButtonGap = -1;
            this.list.treeCheckBoxClassName = "";
            this.list.treeList = false;
            this.list.visible = true;
            this.list.wrapping = "normal";
            try
            {
                this.list["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboItem_mcParty_btn_0()
        {
            try
            {
                this.comboItem["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboItem.autoSize = "none";
            this.comboItem.dropdown = "DefaultScrollingList";
            this.comboItem.enabled = true;
            this.comboItem.focusable = false;
            this.comboItem.groupName = "";
            this.comboItem.itemRenderer = "DefaultListItemRenderer";
            this.comboItem.menuDirection = "down";
            this.comboItem.menuMargin = 1;
            this.comboItem.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboItem.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboItem.menuRowCount = 5;
            this.comboItem.menuRowsFixed = true;
            this.comboItem.menuWidth = -1;
            this.comboItem.menuWrapping = "normal";
            this.comboItem.overlayAlign = "none";
            this.comboItem.overlayImg = "";
            this.comboItem.overlayPadding = {x:0, y:0};
            this.comboItem.scrollBar = "DefaultScrollBar";
            this.comboItem.inspectableThumbOffset = {top:0, bottom:0};
            this.comboItem.visible = true;
            try
            {
                this.comboItem["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboMoney_mcParty_btn_0()
        {
            try
            {
                this.comboMoney["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboMoney.autoSize = "none";
            this.comboMoney.dropdown = "DefaultScrollingList";
            this.comboMoney.enabled = true;
            this.comboMoney.focusable = false;
            this.comboMoney.groupName = "";
            this.comboMoney.itemRenderer = "DefaultListItemRenderer";
            this.comboMoney.menuDirection = "down";
            this.comboMoney.menuMargin = 1;
            this.comboMoney.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboMoney.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboMoney.menuRowCount = 5;
            this.comboMoney.menuRowsFixed = true;
            this.comboMoney.menuWidth = -1;
            this.comboMoney.menuWrapping = "normal";
            this.comboMoney.overlayAlign = "none";
            this.comboMoney.overlayImg = "";
            this.comboMoney.overlayPadding = {x:0, y:0};
            this.comboMoney.scrollBar = "DefaultScrollBar";
            this.comboMoney.inspectableThumbOffset = {top:0, bottom:0};
            this.comboMoney.visible = true;
            try
            {
                this.comboMoney["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnExpel_mcParty_btn_0()
        {
            try
            {
                this.btnExpel["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnExpel.autoRepeat = false;
            this.btnExpel.autoSize = "none";
            this.btnExpel.enabled = true;
            this.btnExpel.focusable = false;
            this.btnExpel.groupName = "";
            this.btnExpel.label = "";
            this.btnExpel.overlayAlign = "none";
            this.btnExpel.overlayImg = "";
            this.btnExpel.overlayPadding = {x:0, y:0};
            this.btnExpel.selected = false;
            this.btnExpel.toggle = false;
            this.btnExpel.visible = true;
            try
            {
                this.btnExpel["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnDelegate_mcParty_btn_0()
        {
            try
            {
                this.btnDelegate["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnDelegate.autoRepeat = false;
            this.btnDelegate.autoSize = "none";
            this.btnDelegate.enabled = true;
            this.btnDelegate.focusable = false;
            this.btnDelegate.groupName = "";
            this.btnDelegate.label = "";
            this.btnDelegate.overlayAlign = "none";
            this.btnDelegate.overlayImg = "";
            this.btnDelegate.overlayPadding = {x:0, y:0};
            this.btnDelegate.selected = false;
            this.btnDelegate.toggle = false;
            this.btnDelegate.visible = true;
            try
            {
                this.btnDelegate["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnDissolve_mcParty_btn_0()
        {
            try
            {
                this.btnDissolve["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnDissolve.autoRepeat = false;
            this.btnDissolve.autoSize = "none";
            this.btnDissolve.enabled = true;
            this.btnDissolve.focusable = false;
            this.btnDissolve.groupName = "";
            this.btnDissolve.label = "";
            this.btnDissolve.overlayAlign = "none";
            this.btnDissolve.overlayImg = "";
            this.btnDissolve.overlayPadding = {x:0, y:0};
            this.btnDissolve.selected = false;
            this.btnDissolve.toggle = false;
            this.btnDissolve.visible = true;
            try
            {
                this.btnDissolve["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnLeave_mcParty_btn_0()
        {
            try
            {
                this.btnLeave["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnLeave.autoRepeat = false;
            this.btnLeave.autoSize = "none";
            this.btnLeave.enabled = true;
            this.btnLeave.focusable = false;
            this.btnLeave.groupName = "";
            this.btnLeave.label = "";
            this.btnLeave.overlayAlign = "none";
            this.btnLeave.overlayImg = "";
            this.btnLeave.overlayPadding = {x:0, y:0};
            this.btnLeave.selected = false;
            this.btnLeave.toggle = false;
            this.btnLeave.visible = true;
            try
            {
                this.btnLeave["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnFriend0_mcParty_btn_0()
        {
            try
            {
                this.btnFriend0["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnFriend0.autoRepeat = false;
            this.btnFriend0.autoSize = "none";
            this.btnFriend0.enabled = true;
            this.btnFriend0.focusable = false;
            this.btnFriend0.groupName = "";
            this.btnFriend0.label = "+";
            this.btnFriend0.overlayAlign = "none";
            this.btnFriend0.overlayImg = "";
            this.btnFriend0.overlayPadding = {x:0, y:0};
            this.btnFriend0.selected = false;
            this.btnFriend0.toggle = false;
            this.btnFriend0.visible = true;
            try
            {
                this.btnFriend0["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnFriend1_mcParty_btn_0()
        {
            try
            {
                this.btnFriend1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnFriend1.autoRepeat = false;
            this.btnFriend1.autoSize = "none";
            this.btnFriend1.enabled = true;
            this.btnFriend1.focusable = false;
            this.btnFriend1.groupName = "";
            this.btnFriend1.label = "+";
            this.btnFriend1.overlayAlign = "none";
            this.btnFriend1.overlayImg = "";
            this.btnFriend1.overlayPadding = {x:0, y:0};
            this.btnFriend1.selected = false;
            this.btnFriend1.toggle = false;
            this.btnFriend1.visible = true;
            try
            {
                this.btnFriend1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnFriend2_mcParty_btn_0()
        {
            try
            {
                this.btnFriend2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnFriend2.autoRepeat = false;
            this.btnFriend2.autoSize = "none";
            this.btnFriend2.enabled = true;
            this.btnFriend2.focusable = false;
            this.btnFriend2.groupName = "";
            this.btnFriend2.label = "+";
            this.btnFriend2.overlayAlign = "none";
            this.btnFriend2.overlayImg = "";
            this.btnFriend2.overlayPadding = {x:0, y:0};
            this.btnFriend2.selected = false;
            this.btnFriend2.toggle = false;
            this.btnFriend2.visible = true;
            try
            {
                this.btnFriend2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnFriend3_mcParty_btn_0()
        {
            try
            {
                this.btnFriend3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnFriend3.autoRepeat = false;
            this.btnFriend3.autoSize = "none";
            this.btnFriend3.enabled = true;
            this.btnFriend3.focusable = false;
            this.btnFriend3.groupName = "";
            this.btnFriend3.label = "+";
            this.btnFriend3.overlayAlign = "none";
            this.btnFriend3.overlayImg = "";
            this.btnFriend3.overlayPadding = {x:0, y:0};
            this.btnFriend3.selected = false;
            this.btnFriend3.toggle = false;
            this.btnFriend3.visible = true;
            try
            {
                this.btnFriend3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnFriend4_mcParty_btn_0()
        {
            try
            {
                this.btnFriend4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnFriend4.autoRepeat = false;
            this.btnFriend4.autoSize = "none";
            this.btnFriend4.enabled = true;
            this.btnFriend4.focusable = false;
            this.btnFriend4.groupName = "";
            this.btnFriend4.label = "+";
            this.btnFriend4.overlayAlign = "none";
            this.btnFriend4.overlayImg = "";
            this.btnFriend4.overlayPadding = {x:0, y:0};
            this.btnFriend4.selected = false;
            this.btnFriend4.toggle = false;
            this.btnFriend4.visible = true;
            try
            {
                this.btnFriend4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnFriend5_mcParty_btn_0()
        {
            try
            {
                this.btnFriend5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnFriend5.autoRepeat = false;
            this.btnFriend5.autoSize = "none";
            this.btnFriend5.enabled = true;
            this.btnFriend5.focusable = false;
            this.btnFriend5.groupName = "";
            this.btnFriend5.label = "+";
            this.btnFriend5.overlayAlign = "none";
            this.btnFriend5.overlayImg = "";
            this.btnFriend5.overlayPadding = {x:0, y:0};
            this.btnFriend5.selected = false;
            this.btnFriend5.toggle = false;
            this.btnFriend5.visible = true;
            try
            {
                this.btnFriend5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnFriend6_mcParty_btn_0()
        {
            try
            {
                this.btnFriend6["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnFriend6.autoRepeat = false;
            this.btnFriend6.autoSize = "none";
            this.btnFriend6.enabled = true;
            this.btnFriend6.focusable = false;
            this.btnFriend6.groupName = "";
            this.btnFriend6.label = "+";
            this.btnFriend6.overlayAlign = "none";
            this.btnFriend6.overlayImg = "";
            this.btnFriend6.overlayPadding = {x:0, y:0};
            this.btnFriend6.selected = false;
            this.btnFriend6.toggle = false;
            this.btnFriend6.visible = true;
            try
            {
                this.btnFriend6["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnFriend7_mcParty_btn_0()
        {
            try
            {
                this.btnFriend7["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnFriend7.autoRepeat = false;
            this.btnFriend7.autoSize = "none";
            this.btnFriend7.enabled = true;
            this.btnFriend7.focusable = false;
            this.btnFriend7.groupName = "";
            this.btnFriend7.label = "+";
            this.btnFriend7.overlayAlign = "none";
            this.btnFriend7.overlayImg = "";
            this.btnFriend7.overlayPadding = {x:0, y:0};
            this.btnFriend7.selected = false;
            this.btnFriend7.toggle = false;
            this.btnFriend7.visible = true;
            try
            {
                this.btnFriend7["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnCharInfo0_mcParty_btn_0()
        {
            try
            {
                this.btnCharInfo0["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnCharInfo0.autoRepeat = false;
            this.btnCharInfo0.autoSize = "none";
            this.btnCharInfo0.enabled = true;
            this.btnCharInfo0.focusable = false;
            this.btnCharInfo0.groupName = "";
            this.btnCharInfo0.label = "";
            this.btnCharInfo0.overlayAlign = "none";
            this.btnCharInfo0.overlayImg = "";
            this.btnCharInfo0.overlayPadding = {x:0, y:0};
            this.btnCharInfo0.selected = false;
            this.btnCharInfo0.toggle = false;
            this.btnCharInfo0.visible = true;
            try
            {
                this.btnCharInfo0["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnCharInfo1_mcParty_btn_0()
        {
            try
            {
                this.btnCharInfo1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnCharInfo1.autoRepeat = false;
            this.btnCharInfo1.autoSize = "none";
            this.btnCharInfo1.enabled = true;
            this.btnCharInfo1.focusable = false;
            this.btnCharInfo1.groupName = "";
            this.btnCharInfo1.label = "";
            this.btnCharInfo1.overlayAlign = "none";
            this.btnCharInfo1.overlayImg = "";
            this.btnCharInfo1.overlayPadding = {x:0, y:0};
            this.btnCharInfo1.selected = false;
            this.btnCharInfo1.toggle = false;
            this.btnCharInfo1.visible = true;
            try
            {
                this.btnCharInfo1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnCharInfo2_mcParty_btn_0()
        {
            try
            {
                this.btnCharInfo2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnCharInfo2.autoRepeat = false;
            this.btnCharInfo2.autoSize = "none";
            this.btnCharInfo2.enabled = true;
            this.btnCharInfo2.focusable = false;
            this.btnCharInfo2.groupName = "";
            this.btnCharInfo2.label = "";
            this.btnCharInfo2.overlayAlign = "none";
            this.btnCharInfo2.overlayImg = "";
            this.btnCharInfo2.overlayPadding = {x:0, y:0};
            this.btnCharInfo2.selected = false;
            this.btnCharInfo2.toggle = false;
            this.btnCharInfo2.visible = true;
            try
            {
                this.btnCharInfo2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnCharInfo3_mcParty_btn_0()
        {
            try
            {
                this.btnCharInfo3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnCharInfo3.autoRepeat = false;
            this.btnCharInfo3.autoSize = "none";
            this.btnCharInfo3.enabled = true;
            this.btnCharInfo3.focusable = false;
            this.btnCharInfo3.groupName = "";
            this.btnCharInfo3.label = "";
            this.btnCharInfo3.overlayAlign = "none";
            this.btnCharInfo3.overlayImg = "";
            this.btnCharInfo3.overlayPadding = {x:0, y:0};
            this.btnCharInfo3.selected = false;
            this.btnCharInfo3.toggle = false;
            this.btnCharInfo3.visible = true;
            try
            {
                this.btnCharInfo3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnCharInfo4_mcParty_btn_0()
        {
            try
            {
                this.btnCharInfo4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnCharInfo4.autoRepeat = false;
            this.btnCharInfo4.autoSize = "none";
            this.btnCharInfo4.enabled = true;
            this.btnCharInfo4.focusable = false;
            this.btnCharInfo4.groupName = "";
            this.btnCharInfo4.label = "";
            this.btnCharInfo4.overlayAlign = "none";
            this.btnCharInfo4.overlayImg = "";
            this.btnCharInfo4.overlayPadding = {x:0, y:0};
            this.btnCharInfo4.selected = false;
            this.btnCharInfo4.toggle = false;
            this.btnCharInfo4.visible = true;
            try
            {
                this.btnCharInfo4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnCharInfo5_mcParty_btn_0()
        {
            try
            {
                this.btnCharInfo5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnCharInfo5.autoRepeat = false;
            this.btnCharInfo5.autoSize = "none";
            this.btnCharInfo5.enabled = true;
            this.btnCharInfo5.focusable = false;
            this.btnCharInfo5.groupName = "";
            this.btnCharInfo5.label = "";
            this.btnCharInfo5.overlayAlign = "none";
            this.btnCharInfo5.overlayImg = "";
            this.btnCharInfo5.overlayPadding = {x:0, y:0};
            this.btnCharInfo5.selected = false;
            this.btnCharInfo5.toggle = false;
            this.btnCharInfo5.visible = true;
            try
            {
                this.btnCharInfo5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnCharInfo6_mcParty_btn_0()
        {
            try
            {
                this.btnCharInfo6["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnCharInfo6.autoRepeat = false;
            this.btnCharInfo6.autoSize = "none";
            this.btnCharInfo6.enabled = true;
            this.btnCharInfo6.focusable = false;
            this.btnCharInfo6.groupName = "";
            this.btnCharInfo6.label = "";
            this.btnCharInfo6.overlayAlign = "none";
            this.btnCharInfo6.overlayImg = "";
            this.btnCharInfo6.overlayPadding = {x:0, y:0};
            this.btnCharInfo6.selected = false;
            this.btnCharInfo6.toggle = false;
            this.btnCharInfo6.visible = true;
            try
            {
                this.btnCharInfo6["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnCharInfo7_mcParty_btn_0()
        {
            try
            {
                this.btnCharInfo7["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnCharInfo7.autoRepeat = false;
            this.btnCharInfo7.autoSize = "none";
            this.btnCharInfo7.enabled = true;
            this.btnCharInfo7.focusable = false;
            this.btnCharInfo7.groupName = "";
            this.btnCharInfo7.label = "";
            this.btnCharInfo7.overlayAlign = "none";
            this.btnCharInfo7.overlayImg = "";
            this.btnCharInfo7.overlayPadding = {x:0, y:0};
            this.btnCharInfo7.selected = false;
            this.btnCharInfo7.toggle = false;
            this.btnCharInfo7.visible = true;
            try
            {
                this.btnCharInfo7["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboItemFilter_mcParty_btn_0()
        {
            try
            {
                this.comboItemFilter["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboItemFilter.autoSize = "none";
            this.comboItemFilter.dropdown = "DefaultScrollingList";
            this.comboItemFilter.enabled = true;
            this.comboItemFilter.focusable = false;
            this.comboItemFilter.groupName = "";
            this.comboItemFilter.itemRenderer = "DefaultListItemRenderer";
            this.comboItemFilter.menuDirection = "down";
            this.comboItemFilter.menuMargin = 1;
            this.comboItemFilter.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboItemFilter.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboItemFilter.menuRowCount = 5;
            this.comboItemFilter.menuRowsFixed = true;
            this.comboItemFilter.menuWidth = -1;
            this.comboItemFilter.menuWrapping = "normal";
            this.comboItemFilter.overlayAlign = "none";
            this.comboItemFilter.overlayImg = "";
            this.comboItemFilter.overlayPadding = {x:0, y:0};
            this.comboItemFilter.scrollBar = "DefaultScrollBar";
            this.comboItemFilter.inspectableThumbOffset = {top:0, bottom:0};
            this.comboItemFilter.visible = true;
            try
            {
                this.comboItemFilter["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            this.idx1.tf.text = "1";
            this.idx2.tf.text = "2";
            this.idx3.tf.text = "3";
            this.idx4.tf.text = "4";
            this.idx5.tf.text = "5";
            this.idx6.tf.text = "6";
            this.idx7.tf.text = "7";
            return;
        }// end function

    }
}
