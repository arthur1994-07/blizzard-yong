package Club_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class Maintain_3 extends MovieClip
    {
        public var CheckBox_List10:MovieClip;
        public var CheckBox_List1:MovieClip;
        public var item5:ListItemRenderer_M;
        public var CheckBox_List11:MovieClip;
        public var item6:ListItemRenderer_M;
        public var CheckBox_List12:MovieClip;
        public var CheckBox_List7:MovieClip;
        public var item7:ListItemRenderer_M;
        public var CheckBox_List6:MovieClip;
        public var item10:ListItemRenderer_M;
        public var item8:ListItemRenderer_M;
        public var CheckBox_List5:MovieClip;
        public var item11:ListItemRenderer_M;
        public var item9:ListItemRenderer_M;
        public var CheckBox_List4:MovieClip;
        public var item12:ListItemRenderer_M;
        public var CheckBox_List9:MovieClip;
        public var CheckBox_List8:MovieClip;
        public var item1:ListItemRenderer_M;
        public var item2:ListItemRenderer_M;
        public var CheckBox_List3:MovieClip;
        public var item3:ListItemRenderer_M;
        public var CheckBox_List2:MovieClip;
        public var item4:ListItemRenderer_M;
        public var labelNickname:Label;
        public var labelMark:Label;
        public var label32Bytes:Label;
        public var labelCLUB_CHANGE_MARK:Label;
        public var labelExpel:Label;
        public var labelWithdraw:Label;
        public var labeLess:Label;
        public var labelOver:Label;
        public var labelHelp_1:Label;
        public var labelRankAuthority:Label;
        public var labelName_1:Label;
        public var checkBoxWithdraw:CheckBox;
        public var checkBoxWithdraw_text:Label;
        public var InputNickname:TextInput;
        public var InputMark:TextInput;
        public var dropdownRank:DropdownMenu;
        public var dropdownDay:DropdownMenu;
        public var btnNickname:Button;
        public var btnMark:Button;
        public var btnSave:Button;
        public var btnWithdrawal:Button;
        public var btnDisband:Button;
        public var btnAuthority:Button;
        public var InputRank1:TextInput;
        public var InputRank2:TextInput;
        public var InputRank3:TextInput;
        public var InputRank4:TextInput;
        public var InputRank5:TextInput;
        public var InputRank6:TextInput;
        public var InputRank7:TextInput;
        public var InputRank8:TextInput;
        public var InputRank9:TextInput;
        public var InputRank10:TextInput;

        public function Maintain_3()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnAuthority_Maintain_button_0();
            this.__setProp_btnDisband_Maintain_button_0();
            this.__setProp_btnWithdrawal_Maintain_button_0();
            this.__setProp_btnSave_Maintain_button_0();
            this.__setProp_btnMark_Maintain_button_0();
            this.__setProp_btnNickname_Maintain_button_0();
            this.__setProp_dropdownRank_Maintain_button_0();
            this.__setProp_dropdownDay_Maintain_button_0();
            this.__setProp_labelName_1_Maintain_Text_0();
            this.__setProp_labelHelp_1_Maintain_Text_0();
            this.__setProp_labelWithdraw_Maintain_Text_0();
            this.__setProp_labelRankAuthority_Maintain_Text_0();
            this.__setProp_InputRank1_Maintain_Text_0();
            this.__setProp_InputRank2_Maintain_Text_0();
            this.__setProp_InputRank3_Maintain_Text_0();
            this.__setProp_InputRank4_Maintain_Text_0();
            this.__setProp_InputRank5_Maintain_Text_0();
            this.__setProp_InputRank6_Maintain_Text_0();
            this.__setProp_InputRank7_Maintain_Text_0();
            this.__setProp_InputRank8_Maintain_Text_0();
            this.__setProp_InputRank9_Maintain_Text_0();
            this.__setProp_InputRank10_Maintain_Text_0();
            return;
        }// end function

        function __setProp_btnAuthority_Maintain_button_0()
        {
            try
            {
                this.btnAuthority["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnAuthority.autoRepeat = false;
            this.btnAuthority.autoSize = "none";
            this.btnAuthority.enabled = true;
            this.btnAuthority.focusable = false;
            this.btnAuthority.groupName = "";
            this.btnAuthority.label = "";
            this.btnAuthority.overlayAlign = "none";
            this.btnAuthority.overlayImg = "";
            this.btnAuthority.overlayPadding = {x:0, y:0};
            this.btnAuthority.selected = false;
            this.btnAuthority.toggle = false;
            this.btnAuthority.visible = true;
            try
            {
                this.btnAuthority["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnDisband_Maintain_button_0()
        {
            try
            {
                this.btnDisband["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnDisband.autoRepeat = false;
            this.btnDisband.autoSize = "none";
            this.btnDisband.enabled = true;
            this.btnDisband.focusable = false;
            this.btnDisband.groupName = "";
            this.btnDisband.label = "";
            this.btnDisband.overlayAlign = "none";
            this.btnDisband.overlayImg = "";
            this.btnDisband.overlayPadding = {x:0, y:0};
            this.btnDisband.selected = false;
            this.btnDisband.toggle = false;
            this.btnDisband.visible = true;
            try
            {
                this.btnDisband["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnWithdrawal_Maintain_button_0()
        {
            try
            {
                this.btnWithdrawal["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnWithdrawal.autoRepeat = false;
            this.btnWithdrawal.autoSize = "none";
            this.btnWithdrawal.enabled = true;
            this.btnWithdrawal.focusable = false;
            this.btnWithdrawal.groupName = "";
            this.btnWithdrawal.label = "";
            this.btnWithdrawal.overlayAlign = "none";
            this.btnWithdrawal.overlayImg = "";
            this.btnWithdrawal.overlayPadding = {x:0, y:0};
            this.btnWithdrawal.selected = false;
            this.btnWithdrawal.toggle = false;
            this.btnWithdrawal.visible = true;
            try
            {
                this.btnWithdrawal["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnSave_Maintain_button_0()
        {
            try
            {
                this.btnSave["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnSave.autoRepeat = false;
            this.btnSave.autoSize = "none";
            this.btnSave.enabled = true;
            this.btnSave.focusable = false;
            this.btnSave.groupName = "";
            this.btnSave.label = "";
            this.btnSave.overlayAlign = "none";
            this.btnSave.overlayImg = "";
            this.btnSave.overlayPadding = {x:0, y:0};
            this.btnSave.selected = false;
            this.btnSave.toggle = false;
            this.btnSave.visible = true;
            try
            {
                this.btnSave["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnMark_Maintain_button_0()
        {
            try
            {
                this.btnMark["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnMark.autoRepeat = false;
            this.btnMark.autoSize = "none";
            this.btnMark.enabled = true;
            this.btnMark.focusable = false;
            this.btnMark.groupName = "";
            this.btnMark.label = "";
            this.btnMark.overlayAlign = "none";
            this.btnMark.overlayImg = "";
            this.btnMark.overlayPadding = {x:0, y:0};
            this.btnMark.selected = false;
            this.btnMark.toggle = false;
            this.btnMark.visible = true;
            try
            {
                this.btnMark["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnNickname_Maintain_button_0()
        {
            try
            {
                this.btnNickname["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnNickname.autoRepeat = false;
            this.btnNickname.autoSize = "none";
            this.btnNickname.enabled = true;
            this.btnNickname.focusable = false;
            this.btnNickname.groupName = "";
            this.btnNickname.label = "";
            this.btnNickname.overlayAlign = "none";
            this.btnNickname.overlayImg = "";
            this.btnNickname.overlayPadding = {x:0, y:0};
            this.btnNickname.selected = false;
            this.btnNickname.toggle = false;
            this.btnNickname.visible = true;
            try
            {
                this.btnNickname["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_dropdownRank_Maintain_button_0()
        {
            try
            {
                this.dropdownRank["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.dropdownRank.autoSize = "none";
            this.dropdownRank.dropdown = "DefaultScrollingList";
            this.dropdownRank.enabled = true;
            this.dropdownRank.focusable = false;
            this.dropdownRank.groupName = "";
            this.dropdownRank.itemRenderer = "DefaultListItemRenderer";
            this.dropdownRank.menuDirection = "down";
            this.dropdownRank.menuMargin = 1;
            this.dropdownRank.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.dropdownRank.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.dropdownRank.menuRowCount = 5;
            this.dropdownRank.menuRowsFixed = false;
            this.dropdownRank.menuWidth = -1;
            this.dropdownRank.menuWrapping = "normal";
            this.dropdownRank.overlayAlign = "none";
            this.dropdownRank.overlayImg = "";
            this.dropdownRank.overlayPadding = {x:0, y:0};
            this.dropdownRank.scrollBar = "DefaultScrollBar";
            this.dropdownRank.inspectableThumbOffset = {top:0, bottom:0};
            this.dropdownRank.visible = true;
            try
            {
                this.dropdownRank["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_dropdownDay_Maintain_button_0()
        {
            try
            {
                this.dropdownDay["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.dropdownDay.autoSize = "none";
            this.dropdownDay.dropdown = "DefaultScrollingList";
            this.dropdownDay.enabled = true;
            this.dropdownDay.focusable = false;
            this.dropdownDay.groupName = "";
            this.dropdownDay.itemRenderer = "DefaultListItemRenderer";
            this.dropdownDay.menuDirection = "down";
            this.dropdownDay.menuMargin = 1;
            this.dropdownDay.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.dropdownDay.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.dropdownDay.menuRowCount = 5;
            this.dropdownDay.menuRowsFixed = false;
            this.dropdownDay.menuWidth = -1;
            this.dropdownDay.menuWrapping = "normal";
            this.dropdownDay.overlayAlign = "none";
            this.dropdownDay.overlayImg = "";
            this.dropdownDay.overlayPadding = {x:0, y:0};
            this.dropdownDay.scrollBar = "DefaultScrollBar";
            this.dropdownDay.inspectableThumbOffset = {top:0, bottom:0};
            this.dropdownDay.visible = true;
            try
            {
                this.dropdownDay["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelName_1_Maintain_Text_0()
        {
            try
            {
                this.labelName_1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelName_1.autoSize = "none";
            this.labelName_1.enabled = true;
            this.labelName_1.text = " ";
            this.labelName_1.visible = true;
            try
            {
                this.labelName_1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelHelp_1_Maintain_Text_0()
        {
            try
            {
                this.labelHelp_1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelHelp_1.autoSize = "none";
            this.labelHelp_1.enabled = true;
            this.labelHelp_1.text = " ";
            this.labelHelp_1.visible = true;
            try
            {
                this.labelHelp_1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelWithdraw_Maintain_Text_0()
        {
            try
            {
                this.labelWithdraw["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelWithdraw.autoSize = "none";
            this.labelWithdraw.enabled = true;
            this.labelWithdraw.text = " ";
            this.labelWithdraw.visible = true;
            try
            {
                this.labelWithdraw["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelRankAuthority_Maintain_Text_0()
        {
            try
            {
                this.labelRankAuthority["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelRankAuthority.autoSize = "none";
            this.labelRankAuthority.enabled = true;
            this.labelRankAuthority.text = " ";
            this.labelRankAuthority.visible = true;
            try
            {
                this.labelRankAuthority["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_InputRank1_Maintain_Text_0()
        {
            try
            {
                this.InputRank1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.InputRank1.defaultText = "";
            this.InputRank1.displayAsPassword = false;
            this.InputRank1.editable = true;
            this.InputRank1.enabled = true;
            this.InputRank1.focusable = true;
            this.InputRank1.maxByte = 0;
            this.InputRank1.maxChars = 0;
            this.InputRank1.OnlyNumber = false;
            this.InputRank1.Restrict = "all";
            this.InputRank1.RestrictAddOn = "";
            this.InputRank1.text = "";
            this.InputRank1.textAlign = "center";
            this.InputRank1.visible = true;
            try
            {
                this.InputRank1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_InputRank2_Maintain_Text_0()
        {
            try
            {
                this.InputRank2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.InputRank2.defaultText = "";
            this.InputRank2.displayAsPassword = false;
            this.InputRank2.editable = true;
            this.InputRank2.enabled = true;
            this.InputRank2.focusable = true;
            this.InputRank2.maxByte = 0;
            this.InputRank2.maxChars = 0;
            this.InputRank2.OnlyNumber = false;
            this.InputRank2.Restrict = "all";
            this.InputRank2.RestrictAddOn = "";
            this.InputRank2.text = "";
            this.InputRank2.textAlign = "center";
            this.InputRank2.visible = true;
            try
            {
                this.InputRank2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_InputRank3_Maintain_Text_0()
        {
            try
            {
                this.InputRank3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.InputRank3.defaultText = "";
            this.InputRank3.displayAsPassword = false;
            this.InputRank3.editable = true;
            this.InputRank3.enabled = true;
            this.InputRank3.focusable = true;
            this.InputRank3.maxByte = 0;
            this.InputRank3.maxChars = 0;
            this.InputRank3.OnlyNumber = false;
            this.InputRank3.Restrict = "all";
            this.InputRank3.RestrictAddOn = "";
            this.InputRank3.text = "";
            this.InputRank3.textAlign = "center";
            this.InputRank3.visible = true;
            try
            {
                this.InputRank3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_InputRank4_Maintain_Text_0()
        {
            try
            {
                this.InputRank4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.InputRank4.defaultText = "";
            this.InputRank4.displayAsPassword = false;
            this.InputRank4.editable = true;
            this.InputRank4.enabled = true;
            this.InputRank4.focusable = true;
            this.InputRank4.maxByte = 0;
            this.InputRank4.maxChars = 0;
            this.InputRank4.OnlyNumber = false;
            this.InputRank4.Restrict = "all";
            this.InputRank4.RestrictAddOn = "";
            this.InputRank4.text = "";
            this.InputRank4.textAlign = "center";
            this.InputRank4.visible = true;
            try
            {
                this.InputRank4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_InputRank5_Maintain_Text_0()
        {
            try
            {
                this.InputRank5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.InputRank5.defaultText = "";
            this.InputRank5.displayAsPassword = false;
            this.InputRank5.editable = true;
            this.InputRank5.enabled = true;
            this.InputRank5.focusable = true;
            this.InputRank5.maxByte = 0;
            this.InputRank5.maxChars = 0;
            this.InputRank5.OnlyNumber = false;
            this.InputRank5.Restrict = "all";
            this.InputRank5.RestrictAddOn = "";
            this.InputRank5.text = "";
            this.InputRank5.textAlign = "center";
            this.InputRank5.visible = true;
            try
            {
                this.InputRank5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_InputRank6_Maintain_Text_0()
        {
            try
            {
                this.InputRank6["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.InputRank6.defaultText = "";
            this.InputRank6.displayAsPassword = false;
            this.InputRank6.editable = true;
            this.InputRank6.enabled = true;
            this.InputRank6.focusable = true;
            this.InputRank6.maxByte = 0;
            this.InputRank6.maxChars = 0;
            this.InputRank6.OnlyNumber = false;
            this.InputRank6.Restrict = "all";
            this.InputRank6.RestrictAddOn = "";
            this.InputRank6.text = "";
            this.InputRank6.textAlign = "center";
            this.InputRank6.visible = true;
            try
            {
                this.InputRank6["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_InputRank7_Maintain_Text_0()
        {
            try
            {
                this.InputRank7["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.InputRank7.defaultText = "";
            this.InputRank7.displayAsPassword = false;
            this.InputRank7.editable = true;
            this.InputRank7.enabled = true;
            this.InputRank7.focusable = true;
            this.InputRank7.maxByte = 0;
            this.InputRank7.maxChars = 0;
            this.InputRank7.OnlyNumber = false;
            this.InputRank7.Restrict = "all";
            this.InputRank7.RestrictAddOn = "";
            this.InputRank7.text = "";
            this.InputRank7.textAlign = "center";
            this.InputRank7.visible = true;
            try
            {
                this.InputRank7["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_InputRank8_Maintain_Text_0()
        {
            try
            {
                this.InputRank8["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.InputRank8.defaultText = "";
            this.InputRank8.displayAsPassword = false;
            this.InputRank8.editable = true;
            this.InputRank8.enabled = true;
            this.InputRank8.focusable = true;
            this.InputRank8.maxByte = 0;
            this.InputRank8.maxChars = 0;
            this.InputRank8.OnlyNumber = false;
            this.InputRank8.Restrict = "all";
            this.InputRank8.RestrictAddOn = "";
            this.InputRank8.text = "";
            this.InputRank8.textAlign = "center";
            this.InputRank8.visible = true;
            try
            {
                this.InputRank8["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_InputRank9_Maintain_Text_0()
        {
            try
            {
                this.InputRank9["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.InputRank9.defaultText = "";
            this.InputRank9.displayAsPassword = false;
            this.InputRank9.editable = true;
            this.InputRank9.enabled = true;
            this.InputRank9.focusable = true;
            this.InputRank9.maxByte = 0;
            this.InputRank9.maxChars = 0;
            this.InputRank9.OnlyNumber = false;
            this.InputRank9.Restrict = "all";
            this.InputRank9.RestrictAddOn = "";
            this.InputRank9.text = "";
            this.InputRank9.textAlign = "center";
            this.InputRank9.visible = true;
            try
            {
                this.InputRank9["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_InputRank10_Maintain_Text_0()
        {
            try
            {
                this.InputRank10["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.InputRank10.defaultText = "";
            this.InputRank10.displayAsPassword = false;
            this.InputRank10.editable = true;
            this.InputRank10.enabled = true;
            this.InputRank10.focusable = true;
            this.InputRank10.maxByte = 0;
            this.InputRank10.maxChars = 0;
            this.InputRank10.OnlyNumber = false;
            this.InputRank10.Restrict = "all";
            this.InputRank10.RestrictAddOn = "";
            this.InputRank10.text = "";
            this.InputRank10.textAlign = "center";
            this.InputRank10.visible = true;
            try
            {
                this.InputRank10["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

    }
}
