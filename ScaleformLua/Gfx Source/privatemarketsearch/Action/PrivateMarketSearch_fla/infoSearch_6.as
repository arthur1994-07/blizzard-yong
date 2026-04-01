package PrivateMarketSearch_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class infoSearch_6 extends MovieClip
    {
        public var labelType:Label;
        public var labelCondition:Label;
        public var labelWearPos:Label;
        public var labelSpec:Label;
        public var labelAddOn:Label;
        public var comboWearPos:DropdownMenu;
        public var comboType:DropdownMenu;
        public var comboRequire:DropdownMenu;
        public var comboGrade:DropdownMenu;
        public var comboClass:DropdownMenu;
        public var comboSex:DropdownMenu;
        public var comboSpec1:DropdownMenu;
        public var comboSpec2:DropdownMenu;
        public var comboSpec3:DropdownMenu;
        public var comboSpec4:DropdownMenu;
        public var comboAddOn1:DropdownMenu;
        public var comboAddOn2:DropdownMenu;
        public var comboAddOn3:DropdownMenu;
        public var comboAddOn4:DropdownMenu;
        public var checkMoney:CheckBox;
        public var checkPoint:CheckBox;
        public var checkTerm:CheckBox;
        public var checkTerm_text:Label;
        public var inputRequire:TextInput;
        public var inputSpec1:TextInput;
        public var inputSpec2:TextInput;
        public var inputSpec3:TextInput;
        public var inputSpec4:TextInput;
        public var inputAddOn1:TextInput;
        public var inputAddOn2:TextInput;
        public var inputAddOn3:TextInput;
        public var inputAddOn4:TextInput;
        public var inputCount:TextInput;
        public var btnReset:Button;
        public var btnSearch:Button;
        public var inputName:AutocompleteTextBox;

        public function infoSearch_6()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_inputRequire_infoSearch_input_0();
            this.__setProp_inputSpec1_infoSearch_input_0();
            this.__setProp_inputSpec2_infoSearch_input_0();
            this.__setProp_inputSpec3_infoSearch_input_0();
            this.__setProp_inputSpec4_infoSearch_input_0();
            this.__setProp_inputAddOn1_infoSearch_input_0();
            this.__setProp_inputAddOn2_infoSearch_input_0();
            this.__setProp_inputAddOn3_infoSearch_input_0();
            this.__setProp_inputAddOn4_infoSearch_input_0();
            this.__setProp_labelType_infoSearch_label_0();
            this.__setProp_labelCondition_infoSearch_label_0();
            this.__setProp_labelWearPos_infoSearch_label_0();
            this.__setProp_labelSpec_infoSearch_label_0();
            this.__setProp_labelAddOn_infoSearch_label_0();
            this.__setProp_checkMoney_infoSearch_check_0();
            this.__setProp_checkPoint_infoSearch_check_0();
            this.__setProp_comboType_infoSearch_combo_0();
            this.__setProp_comboRequire_infoSearch_combo_0();
            this.__setProp_comboGrade_infoSearch_combo_0();
            this.__setProp_comboClass_infoSearch_combo_0();
            this.__setProp_comboSex_infoSearch_combo_0();
            this.__setProp_comboSpec1_infoSearch_combo_0();
            this.__setProp_comboSpec2_infoSearch_combo_0();
            this.__setProp_comboSpec3_infoSearch_combo_0();
            this.__setProp_comboSpec4_infoSearch_combo_0();
            this.__setProp_comboAddOn1_infoSearch_combo_0();
            this.__setProp_comboAddOn2_infoSearch_combo_0();
            this.__setProp_comboAddOn3_infoSearch_combo_0();
            this.__setProp_comboAddOn4_infoSearch_combo_0();
            this.__setProp_comboWearPos_infoSearch_combo_0();
            this.__setProp_btnReset_infoSearch_btn_0();
            this.__setProp_btnSearch_infoSearch_btn_0();
            return;
        }// end function

        function __setProp_inputRequire_infoSearch_input_0()
        {
            try
            {
                this.inputRequire["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputRequire.defaultText = "";
            this.inputRequire.displayAsPassword = false;
            this.inputRequire.editable = true;
            this.inputRequire.enabled = true;
            this.inputRequire.focusable = true;
            this.inputRequire.maxByte = 0;
            this.inputRequire.maxChars = 0;
            this.inputRequire.OnlyNumber = false;
            this.inputRequire.Restrict = "number";
            this.inputRequire.RestrictAddOn = "";
            this.inputRequire.text = "";
            this.inputRequire.textAlign = "left";
            this.inputRequire.visible = true;
            try
            {
                this.inputRequire["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_inputSpec1_infoSearch_input_0()
        {
            try
            {
                this.inputSpec1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputSpec1.defaultText = "";
            this.inputSpec1.displayAsPassword = false;
            this.inputSpec1.editable = true;
            this.inputSpec1.enabled = true;
            this.inputSpec1.focusable = true;
            this.inputSpec1.maxByte = 0;
            this.inputSpec1.maxChars = 0;
            this.inputSpec1.OnlyNumber = false;
            this.inputSpec1.Restrict = "number";
            this.inputSpec1.RestrictAddOn = "";
            this.inputSpec1.text = "";
            this.inputSpec1.textAlign = "left";
            this.inputSpec1.visible = true;
            try
            {
                this.inputSpec1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_inputSpec2_infoSearch_input_0()
        {
            try
            {
                this.inputSpec2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputSpec2.defaultText = "";
            this.inputSpec2.displayAsPassword = false;
            this.inputSpec2.editable = true;
            this.inputSpec2.enabled = true;
            this.inputSpec2.focusable = true;
            this.inputSpec2.maxByte = 0;
            this.inputSpec2.maxChars = 0;
            this.inputSpec2.OnlyNumber = false;
            this.inputSpec2.Restrict = "number";
            this.inputSpec2.RestrictAddOn = "";
            this.inputSpec2.text = "";
            this.inputSpec2.textAlign = "left";
            this.inputSpec2.visible = true;
            try
            {
                this.inputSpec2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_inputSpec3_infoSearch_input_0()
        {
            try
            {
                this.inputSpec3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputSpec3.defaultText = "";
            this.inputSpec3.displayAsPassword = false;
            this.inputSpec3.editable = true;
            this.inputSpec3.enabled = true;
            this.inputSpec3.focusable = true;
            this.inputSpec3.maxByte = 0;
            this.inputSpec3.maxChars = 0;
            this.inputSpec3.OnlyNumber = false;
            this.inputSpec3.Restrict = "number";
            this.inputSpec3.RestrictAddOn = "";
            this.inputSpec3.text = "";
            this.inputSpec3.textAlign = "left";
            this.inputSpec3.visible = true;
            try
            {
                this.inputSpec3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_inputSpec4_infoSearch_input_0()
        {
            try
            {
                this.inputSpec4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputSpec4.defaultText = "";
            this.inputSpec4.displayAsPassword = false;
            this.inputSpec4.editable = true;
            this.inputSpec4.enabled = true;
            this.inputSpec4.focusable = true;
            this.inputSpec4.maxByte = 0;
            this.inputSpec4.maxChars = 0;
            this.inputSpec4.OnlyNumber = false;
            this.inputSpec4.Restrict = "number";
            this.inputSpec4.RestrictAddOn = "";
            this.inputSpec4.text = "";
            this.inputSpec4.textAlign = "left";
            this.inputSpec4.visible = true;
            try
            {
                this.inputSpec4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_inputAddOn1_infoSearch_input_0()
        {
            try
            {
                this.inputAddOn1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputAddOn1.defaultText = "";
            this.inputAddOn1.displayAsPassword = false;
            this.inputAddOn1.editable = true;
            this.inputAddOn1.enabled = true;
            this.inputAddOn1.focusable = true;
            this.inputAddOn1.maxByte = 0;
            this.inputAddOn1.maxChars = 0;
            this.inputAddOn1.OnlyNumber = false;
            this.inputAddOn1.Restrict = "number";
            this.inputAddOn1.RestrictAddOn = "";
            this.inputAddOn1.text = "";
            this.inputAddOn1.textAlign = "left";
            this.inputAddOn1.visible = true;
            try
            {
                this.inputAddOn1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_inputAddOn2_infoSearch_input_0()
        {
            try
            {
                this.inputAddOn2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputAddOn2.defaultText = "";
            this.inputAddOn2.displayAsPassword = false;
            this.inputAddOn2.editable = true;
            this.inputAddOn2.enabled = true;
            this.inputAddOn2.focusable = true;
            this.inputAddOn2.maxByte = 0;
            this.inputAddOn2.maxChars = 0;
            this.inputAddOn2.OnlyNumber = false;
            this.inputAddOn2.Restrict = "number";
            this.inputAddOn2.RestrictAddOn = "";
            this.inputAddOn2.text = "";
            this.inputAddOn2.textAlign = "left";
            this.inputAddOn2.visible = true;
            try
            {
                this.inputAddOn2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_inputAddOn3_infoSearch_input_0()
        {
            try
            {
                this.inputAddOn3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputAddOn3.defaultText = "";
            this.inputAddOn3.displayAsPassword = false;
            this.inputAddOn3.editable = true;
            this.inputAddOn3.enabled = true;
            this.inputAddOn3.focusable = true;
            this.inputAddOn3.maxByte = 0;
            this.inputAddOn3.maxChars = 0;
            this.inputAddOn3.OnlyNumber = false;
            this.inputAddOn3.Restrict = "number";
            this.inputAddOn3.RestrictAddOn = "";
            this.inputAddOn3.text = "";
            this.inputAddOn3.textAlign = "left";
            this.inputAddOn3.visible = true;
            try
            {
                this.inputAddOn3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_inputAddOn4_infoSearch_input_0()
        {
            try
            {
                this.inputAddOn4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputAddOn4.defaultText = "";
            this.inputAddOn4.displayAsPassword = false;
            this.inputAddOn4.editable = true;
            this.inputAddOn4.enabled = true;
            this.inputAddOn4.focusable = true;
            this.inputAddOn4.maxByte = 0;
            this.inputAddOn4.maxChars = 0;
            this.inputAddOn4.OnlyNumber = false;
            this.inputAddOn4.Restrict = "number";
            this.inputAddOn4.RestrictAddOn = "";
            this.inputAddOn4.text = "";
            this.inputAddOn4.textAlign = "left";
            this.inputAddOn4.visible = true;
            try
            {
                this.inputAddOn4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelType_infoSearch_label_0()
        {
            try
            {
                this.labelType["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelType.autoSize = "left";
            this.labelType.enabled = true;
            this.labelType.text = "";
            this.labelType.visible = true;
            try
            {
                this.labelType["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelCondition_infoSearch_label_0()
        {
            try
            {
                this.labelCondition["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelCondition.autoSize = "left";
            this.labelCondition.enabled = true;
            this.labelCondition.text = "";
            this.labelCondition.visible = true;
            try
            {
                this.labelCondition["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelWearPos_infoSearch_label_0()
        {
            try
            {
                this.labelWearPos["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelWearPos.autoSize = "left";
            this.labelWearPos.enabled = true;
            this.labelWearPos.text = "";
            this.labelWearPos.visible = true;
            try
            {
                this.labelWearPos["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelSpec_infoSearch_label_0()
        {
            try
            {
                this.labelSpec["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelSpec.autoSize = "left";
            this.labelSpec.enabled = true;
            this.labelSpec.text = "";
            this.labelSpec.visible = true;
            try
            {
                this.labelSpec["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelAddOn_infoSearch_label_0()
        {
            try
            {
                this.labelAddOn["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelAddOn.autoSize = "left";
            this.labelAddOn.enabled = true;
            this.labelAddOn.text = "";
            this.labelAddOn.visible = true;
            try
            {
                this.labelAddOn["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_checkMoney_infoSearch_check_0()
        {
            try
            {
                this.checkMoney["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.checkMoney.autoSize = "none";
            this.checkMoney.enabled = true;
            this.checkMoney.focusable = false;
            this.checkMoney.groupName = "";
            this.checkMoney.label = "";
            this.checkMoney.overlayAlign = "none";
            this.checkMoney.overlayImg = "";
            this.checkMoney.overlayPadding = {x:0, y:0};
            this.checkMoney.selected = false;
            this.checkMoney.visible = true;
            try
            {
                this.checkMoney["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_checkPoint_infoSearch_check_0()
        {
            try
            {
                this.checkPoint["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.checkPoint.autoSize = "none";
            this.checkPoint.enabled = true;
            this.checkPoint.focusable = false;
            this.checkPoint.groupName = "";
            this.checkPoint.label = "";
            this.checkPoint.overlayAlign = "none";
            this.checkPoint.overlayImg = "";
            this.checkPoint.overlayPadding = {x:0, y:0};
            this.checkPoint.selected = false;
            this.checkPoint.visible = true;
            try
            {
                this.checkPoint["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboType_infoSearch_combo_0()
        {
            try
            {
                this.comboType["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboType.autoSize = "none";
            this.comboType.dropdown = "DefaultScrollingList";
            this.comboType.enabled = true;
            this.comboType.focusable = false;
            this.comboType.groupName = "";
            this.comboType.itemRenderer = "DefaultListItemRenderer";
            this.comboType.menuDirection = "down";
            this.comboType.menuMargin = 0;
            this.comboType.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboType.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboType.menuRowCount = 5;
            this.comboType.menuRowsFixed = false;
            this.comboType.menuWidth = -1;
            this.comboType.menuWrapping = "normal";
            this.comboType.overlayAlign = "none";
            this.comboType.overlayImg = "";
            this.comboType.overlayPadding = {x:0, y:0};
            this.comboType.scrollBar = "DefaultScrollBar";
            this.comboType.inspectableThumbOffset = {top:0, bottom:0};
            this.comboType.visible = true;
            try
            {
                this.comboType["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboRequire_infoSearch_combo_0()
        {
            try
            {
                this.comboRequire["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboRequire.autoSize = "none";
            this.comboRequire.dropdown = "DefaultScrollingList";
            this.comboRequire.enabled = true;
            this.comboRequire.focusable = false;
            this.comboRequire.groupName = "";
            this.comboRequire.itemRenderer = "DefaultListItemRenderer";
            this.comboRequire.menuDirection = "down";
            this.comboRequire.menuMargin = 0;
            this.comboRequire.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboRequire.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboRequire.menuRowCount = 5;
            this.comboRequire.menuRowsFixed = false;
            this.comboRequire.menuWidth = -1;
            this.comboRequire.menuWrapping = "normal";
            this.comboRequire.overlayAlign = "none";
            this.comboRequire.overlayImg = "";
            this.comboRequire.overlayPadding = {x:0, y:0};
            this.comboRequire.scrollBar = "DefaultScrollBar";
            this.comboRequire.inspectableThumbOffset = {top:0, bottom:0};
            this.comboRequire.visible = true;
            try
            {
                this.comboRequire["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboGrade_infoSearch_combo_0()
        {
            try
            {
                this.comboGrade["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboGrade.autoSize = "none";
            this.comboGrade.dropdown = "DefaultScrollingList";
            this.comboGrade.enabled = true;
            this.comboGrade.focusable = false;
            this.comboGrade.groupName = "";
            this.comboGrade.itemRenderer = "DefaultListItemRenderer";
            this.comboGrade.menuDirection = "down";
            this.comboGrade.menuMargin = 0;
            this.comboGrade.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboGrade.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboGrade.menuRowCount = 5;
            this.comboGrade.menuRowsFixed = false;
            this.comboGrade.menuWidth = -1;
            this.comboGrade.menuWrapping = "normal";
            this.comboGrade.overlayAlign = "none";
            this.comboGrade.overlayImg = "";
            this.comboGrade.overlayPadding = {x:0, y:0};
            this.comboGrade.scrollBar = "DefaultScrollBar";
            this.comboGrade.inspectableThumbOffset = {top:0, bottom:0};
            this.comboGrade.visible = true;
            try
            {
                this.comboGrade["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboClass_infoSearch_combo_0()
        {
            try
            {
                this.comboClass["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboClass.autoSize = "none";
            this.comboClass.dropdown = "DefaultScrollingList";
            this.comboClass.enabled = true;
            this.comboClass.focusable = false;
            this.comboClass.groupName = "";
            this.comboClass.itemRenderer = "DefaultListItemRenderer";
            this.comboClass.menuDirection = "down";
            this.comboClass.menuMargin = 0;
            this.comboClass.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboClass.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboClass.menuRowCount = 5;
            this.comboClass.menuRowsFixed = false;
            this.comboClass.menuWidth = -1;
            this.comboClass.menuWrapping = "normal";
            this.comboClass.overlayAlign = "none";
            this.comboClass.overlayImg = "";
            this.comboClass.overlayPadding = {x:0, y:0};
            this.comboClass.scrollBar = "DefaultScrollBar";
            this.comboClass.inspectableThumbOffset = {top:0, bottom:0};
            this.comboClass.visible = true;
            try
            {
                this.comboClass["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboSex_infoSearch_combo_0()
        {
            try
            {
                this.comboSex["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboSex.autoSize = "none";
            this.comboSex.dropdown = "DefaultScrollingList";
            this.comboSex.enabled = true;
            this.comboSex.focusable = false;
            this.comboSex.groupName = "";
            this.comboSex.itemRenderer = "DefaultListItemRenderer";
            this.comboSex.menuDirection = "down";
            this.comboSex.menuMargin = 0;
            this.comboSex.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboSex.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboSex.menuRowCount = 5;
            this.comboSex.menuRowsFixed = false;
            this.comboSex.menuWidth = -1;
            this.comboSex.menuWrapping = "normal";
            this.comboSex.overlayAlign = "none";
            this.comboSex.overlayImg = "";
            this.comboSex.overlayPadding = {x:0, y:0};
            this.comboSex.scrollBar = "DefaultScrollBar";
            this.comboSex.inspectableThumbOffset = {top:0, bottom:0};
            this.comboSex.visible = true;
            try
            {
                this.comboSex["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboSpec1_infoSearch_combo_0()
        {
            try
            {
                this.comboSpec1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboSpec1.autoSize = "none";
            this.comboSpec1.dropdown = "DefaultScrollingList";
            this.comboSpec1.enabled = true;
            this.comboSpec1.focusable = false;
            this.comboSpec1.groupName = "";
            this.comboSpec1.itemRenderer = "DefaultListItemRenderer";
            this.comboSpec1.menuDirection = "down";
            this.comboSpec1.menuMargin = 0;
            this.comboSpec1.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboSpec1.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboSpec1.menuRowCount = 5;
            this.comboSpec1.menuRowsFixed = false;
            this.comboSpec1.menuWidth = -1;
            this.comboSpec1.menuWrapping = "normal";
            this.comboSpec1.overlayAlign = "none";
            this.comboSpec1.overlayImg = "";
            this.comboSpec1.overlayPadding = {x:0, y:0};
            this.comboSpec1.scrollBar = "DefaultScrollBar";
            this.comboSpec1.inspectableThumbOffset = {top:0, bottom:0};
            this.comboSpec1.visible = true;
            try
            {
                this.comboSpec1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboSpec2_infoSearch_combo_0()
        {
            try
            {
                this.comboSpec2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboSpec2.autoSize = "none";
            this.comboSpec2.dropdown = "DefaultScrollingList";
            this.comboSpec2.enabled = true;
            this.comboSpec2.focusable = false;
            this.comboSpec2.groupName = "";
            this.comboSpec2.itemRenderer = "DefaultListItemRenderer";
            this.comboSpec2.menuDirection = "down";
            this.comboSpec2.menuMargin = 0;
            this.comboSpec2.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboSpec2.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboSpec2.menuRowCount = 5;
            this.comboSpec2.menuRowsFixed = false;
            this.comboSpec2.menuWidth = -1;
            this.comboSpec2.menuWrapping = "normal";
            this.comboSpec2.overlayAlign = "none";
            this.comboSpec2.overlayImg = "";
            this.comboSpec2.overlayPadding = {x:0, y:0};
            this.comboSpec2.scrollBar = "DefaultScrollBar";
            this.comboSpec2.inspectableThumbOffset = {top:0, bottom:0};
            this.comboSpec2.visible = true;
            try
            {
                this.comboSpec2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboSpec3_infoSearch_combo_0()
        {
            try
            {
                this.comboSpec3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboSpec3.autoSize = "none";
            this.comboSpec3.dropdown = "DefaultScrollingList";
            this.comboSpec3.enabled = true;
            this.comboSpec3.focusable = false;
            this.comboSpec3.groupName = "";
            this.comboSpec3.itemRenderer = "DefaultListItemRenderer";
            this.comboSpec3.menuDirection = "down";
            this.comboSpec3.menuMargin = 0;
            this.comboSpec3.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboSpec3.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboSpec3.menuRowCount = 5;
            this.comboSpec3.menuRowsFixed = false;
            this.comboSpec3.menuWidth = -1;
            this.comboSpec3.menuWrapping = "normal";
            this.comboSpec3.overlayAlign = "none";
            this.comboSpec3.overlayImg = "";
            this.comboSpec3.overlayPadding = {x:0, y:0};
            this.comboSpec3.scrollBar = "DefaultScrollBar";
            this.comboSpec3.inspectableThumbOffset = {top:0, bottom:0};
            this.comboSpec3.visible = true;
            try
            {
                this.comboSpec3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboSpec4_infoSearch_combo_0()
        {
            try
            {
                this.comboSpec4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboSpec4.autoSize = "none";
            this.comboSpec4.dropdown = "DefaultScrollingList";
            this.comboSpec4.enabled = true;
            this.comboSpec4.focusable = false;
            this.comboSpec4.groupName = "";
            this.comboSpec4.itemRenderer = "DefaultListItemRenderer";
            this.comboSpec4.menuDirection = "down";
            this.comboSpec4.menuMargin = 0;
            this.comboSpec4.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboSpec4.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboSpec4.menuRowCount = 5;
            this.comboSpec4.menuRowsFixed = false;
            this.comboSpec4.menuWidth = -1;
            this.comboSpec4.menuWrapping = "normal";
            this.comboSpec4.overlayAlign = "none";
            this.comboSpec4.overlayImg = "";
            this.comboSpec4.overlayPadding = {x:0, y:0};
            this.comboSpec4.scrollBar = "DefaultScrollBar";
            this.comboSpec4.inspectableThumbOffset = {top:0, bottom:0};
            this.comboSpec4.visible = true;
            try
            {
                this.comboSpec4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboAddOn1_infoSearch_combo_0()
        {
            try
            {
                this.comboAddOn1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboAddOn1.autoSize = "none";
            this.comboAddOn1.dropdown = "DefaultScrollingList";
            this.comboAddOn1.enabled = true;
            this.comboAddOn1.focusable = false;
            this.comboAddOn1.groupName = "";
            this.comboAddOn1.itemRenderer = "DefaultListItemRenderer";
            this.comboAddOn1.menuDirection = "down";
            this.comboAddOn1.menuMargin = 0;
            this.comboAddOn1.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboAddOn1.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboAddOn1.menuRowCount = 5;
            this.comboAddOn1.menuRowsFixed = false;
            this.comboAddOn1.menuWidth = -1;
            this.comboAddOn1.menuWrapping = "normal";
            this.comboAddOn1.overlayAlign = "none";
            this.comboAddOn1.overlayImg = "";
            this.comboAddOn1.overlayPadding = {x:0, y:0};
            this.comboAddOn1.scrollBar = "DefaultScrollBar";
            this.comboAddOn1.inspectableThumbOffset = {top:0, bottom:0};
            this.comboAddOn1.visible = true;
            try
            {
                this.comboAddOn1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboAddOn2_infoSearch_combo_0()
        {
            try
            {
                this.comboAddOn2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboAddOn2.autoSize = "none";
            this.comboAddOn2.dropdown = "DefaultScrollingList";
            this.comboAddOn2.enabled = true;
            this.comboAddOn2.focusable = false;
            this.comboAddOn2.groupName = "";
            this.comboAddOn2.itemRenderer = "DefaultListItemRenderer";
            this.comboAddOn2.menuDirection = "down";
            this.comboAddOn2.menuMargin = 0;
            this.comboAddOn2.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboAddOn2.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboAddOn2.menuRowCount = 5;
            this.comboAddOn2.menuRowsFixed = false;
            this.comboAddOn2.menuWidth = -1;
            this.comboAddOn2.menuWrapping = "normal";
            this.comboAddOn2.overlayAlign = "none";
            this.comboAddOn2.overlayImg = "";
            this.comboAddOn2.overlayPadding = {x:0, y:0};
            this.comboAddOn2.scrollBar = "DefaultScrollBar";
            this.comboAddOn2.inspectableThumbOffset = {top:0, bottom:0};
            this.comboAddOn2.visible = true;
            try
            {
                this.comboAddOn2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboAddOn3_infoSearch_combo_0()
        {
            try
            {
                this.comboAddOn3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboAddOn3.autoSize = "none";
            this.comboAddOn3.dropdown = "DefaultScrollingList";
            this.comboAddOn3.enabled = true;
            this.comboAddOn3.focusable = false;
            this.comboAddOn3.groupName = "";
            this.comboAddOn3.itemRenderer = "DefaultListItemRenderer";
            this.comboAddOn3.menuDirection = "down";
            this.comboAddOn3.menuMargin = 0;
            this.comboAddOn3.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboAddOn3.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboAddOn3.menuRowCount = 5;
            this.comboAddOn3.menuRowsFixed = false;
            this.comboAddOn3.menuWidth = -1;
            this.comboAddOn3.menuWrapping = "normal";
            this.comboAddOn3.overlayAlign = "none";
            this.comboAddOn3.overlayImg = "";
            this.comboAddOn3.overlayPadding = {x:0, y:0};
            this.comboAddOn3.scrollBar = "DefaultScrollBar";
            this.comboAddOn3.inspectableThumbOffset = {top:0, bottom:0};
            this.comboAddOn3.visible = true;
            try
            {
                this.comboAddOn3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboAddOn4_infoSearch_combo_0()
        {
            try
            {
                this.comboAddOn4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboAddOn4.autoSize = "none";
            this.comboAddOn4.dropdown = "DefaultScrollingList";
            this.comboAddOn4.enabled = true;
            this.comboAddOn4.focusable = false;
            this.comboAddOn4.groupName = "";
            this.comboAddOn4.itemRenderer = "DefaultListItemRenderer";
            this.comboAddOn4.menuDirection = "down";
            this.comboAddOn4.menuMargin = 0;
            this.comboAddOn4.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboAddOn4.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboAddOn4.menuRowCount = 5;
            this.comboAddOn4.menuRowsFixed = false;
            this.comboAddOn4.menuWidth = -1;
            this.comboAddOn4.menuWrapping = "normal";
            this.comboAddOn4.overlayAlign = "none";
            this.comboAddOn4.overlayImg = "";
            this.comboAddOn4.overlayPadding = {x:0, y:0};
            this.comboAddOn4.scrollBar = "DefaultScrollBar";
            this.comboAddOn4.inspectableThumbOffset = {top:0, bottom:0};
            this.comboAddOn4.visible = true;
            try
            {
                this.comboAddOn4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboWearPos_infoSearch_combo_0()
        {
            try
            {
                this.comboWearPos["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboWearPos.autoSize = "none";
            this.comboWearPos.dropdown = "DefaultScrollingList";
            this.comboWearPos.enabled = true;
            this.comboWearPos.focusable = false;
            this.comboWearPos.groupName = "";
            this.comboWearPos.itemRenderer = "DefaultListItemRenderer";
            this.comboWearPos.menuDirection = "down";
            this.comboWearPos.menuMargin = 0;
            this.comboWearPos.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboWearPos.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboWearPos.menuRowCount = 5;
            this.comboWearPos.menuRowsFixed = false;
            this.comboWearPos.menuWidth = -1;
            this.comboWearPos.menuWrapping = "normal";
            this.comboWearPos.overlayAlign = "none";
            this.comboWearPos.overlayImg = "";
            this.comboWearPos.overlayPadding = {x:0, y:0};
            this.comboWearPos.scrollBar = "DefaultScrollBar";
            this.comboWearPos.inspectableThumbOffset = {top:0, bottom:0};
            this.comboWearPos.visible = true;
            try
            {
                this.comboWearPos["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnReset_infoSearch_btn_0()
        {
            try
            {
                this.btnReset["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReset.autoRepeat = false;
            this.btnReset.autoSize = "none";
            this.btnReset.enabled = true;
            this.btnReset.focusable = false;
            this.btnReset.groupName = "";
            this.btnReset.label = "";
            this.btnReset.overlayAlign = "none";
            this.btnReset.overlayImg = "";
            this.btnReset.overlayPadding = {x:0, y:0};
            this.btnReset.selected = false;
            this.btnReset.toggle = false;
            this.btnReset.visible = true;
            try
            {
                this.btnReset["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnSearch_infoSearch_btn_0()
        {
            try
            {
                this.btnSearch["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnSearch.autoRepeat = false;
            this.btnSearch.autoSize = "none";
            this.btnSearch.enabled = true;
            this.btnSearch.focusable = false;
            this.btnSearch.groupName = "";
            this.btnSearch.label = "";
            this.btnSearch.overlayAlign = "none";
            this.btnSearch.overlayImg = "";
            this.btnSearch.overlayPadding = {x:0, y:0};
            this.btnSearch.selected = false;
            this.btnSearch.toggle = false;
            this.btnSearch.visible = true;
            try
            {
                this.btnSearch["componentInspectorSetting"] = false;
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
