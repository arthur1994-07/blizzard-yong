package GameOption_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class mcUI_4 extends MovieClip
    {
        public var labelQuality:Label;
        public var comboQuality:DropdownMenu;
        public var btnDefaultPos:Button;
        public var btnNameConfig:Button;
        public var labelUIAlphaStatic:Label;
        public var labelUIAlpha:Label;
        public var sliderUIAlpha:Slider;
        public var checkChat:CheckBox;
        public var checkShowOtherDamage:CheckBox;
        public var checkMiniHP:CheckBox;
        public var checkDisplayLimit:CheckBox;
        public var checkChat_text:Label;
        public var checkShowOtherDamage_text:Label;
        public var checkMiniHP_text:Label;
        public var checkDisplayLimit_text:Label;

        public function mcUI_4()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnDefaultPos_mcUI_Layer2_0();
            this.__setProp_sliderUIAlpha_mcUI_Layer2_0();
            this.__setProp_btnNameConfig_mcUI_Layer2_0();
            this.__setProp_comboQuality_mcUI_Layer2_0();
            this.__setProp_checkDisplayLimit_mcUI_Layer2_0();
            this.__setProp_checkDisplayLimit_text_mcUI_Layer2_0();
            return;
        }// end function

        function __setProp_btnDefaultPos_mcUI_Layer2_0()
        {
            try
            {
                this.btnDefaultPos["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnDefaultPos.autoRepeat = false;
            this.btnDefaultPos.autoSize = "none";
            this.btnDefaultPos.enabled = true;
            this.btnDefaultPos.focusable = false;
            this.btnDefaultPos.groupName = "";
            this.btnDefaultPos.label = "";
            this.btnDefaultPos.overlayAlign = "none";
            this.btnDefaultPos.overlayImg = "";
            this.btnDefaultPos.overlayPadding = {x:0, y:0};
            this.btnDefaultPos.selected = false;
            this.btnDefaultPos.toggle = false;
            this.btnDefaultPos.visible = true;
            try
            {
                this.btnDefaultPos["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_sliderUIAlpha_mcUI_Layer2_0()
        {
            try
            {
                this.sliderUIAlpha["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.sliderUIAlpha.enabled = true;
            this.sliderUIAlpha.focusable = false;
            this.sliderUIAlpha.liveDragging = true;
            this.sliderUIAlpha.maximum = 10;
            this.sliderUIAlpha.minimum = 0;
            this.sliderUIAlpha.offsetLeft = 0;
            this.sliderUIAlpha.offsetRight = 0;
            this.sliderUIAlpha.snapInterval = 1;
            this.sliderUIAlpha.snapping = false;
            this.sliderUIAlpha.value = 0;
            this.sliderUIAlpha.visible = true;
            try
            {
                this.sliderUIAlpha["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnNameConfig_mcUI_Layer2_0()
        {
            try
            {
                this.btnNameConfig["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnNameConfig.autoRepeat = false;
            this.btnNameConfig.autoSize = "none";
            this.btnNameConfig.enabled = false;
            this.btnNameConfig.focusable = false;
            this.btnNameConfig.groupName = "";
            this.btnNameConfig.label = "";
            this.btnNameConfig.overlayAlign = "none";
            this.btnNameConfig.overlayImg = "";
            this.btnNameConfig.overlayPadding = {x:0, y:0};
            this.btnNameConfig.selected = false;
            this.btnNameConfig.toggle = false;
            this.btnNameConfig.visible = true;
            try
            {
                this.btnNameConfig["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboQuality_mcUI_Layer2_0()
        {
            try
            {
                this.comboQuality["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboQuality.autoSize = "none";
            this.comboQuality.dropdown = "DefaultScrollingList";
            this.comboQuality.enabled = true;
            this.comboQuality.focusable = false;
            this.comboQuality.groupName = "";
            this.comboQuality.itemRenderer = "DefaultListItemRenderer";
            this.comboQuality.menuDirection = "down";
            this.comboQuality.menuMargin = 1;
            this.comboQuality.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboQuality.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboQuality.menuRowCount = 5;
            this.comboQuality.menuRowsFixed = true;
            this.comboQuality.menuWidth = -1;
            this.comboQuality.menuWrapping = "normal";
            this.comboQuality.overlayAlign = "none";
            this.comboQuality.overlayImg = "";
            this.comboQuality.overlayPadding = {x:0, y:0};
            this.comboQuality.scrollBar = "DefaultScrollBar";
            this.comboQuality.inspectableThumbOffset = {top:0, bottom:0};
            this.comboQuality.visible = true;
            try
            {
                this.comboQuality["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_checkDisplayLimit_mcUI_Layer2_0()
        {
            try
            {
                this.checkDisplayLimit["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.checkDisplayLimit.autoSize = "none";
            this.checkDisplayLimit.enabled = false;
            this.checkDisplayLimit.focusable = true;
            this.checkDisplayLimit.groupName = "";
            this.checkDisplayLimit.label = "";
            this.checkDisplayLimit.overlayAlign = "none";
            this.checkDisplayLimit.overlayImg = "";
            this.checkDisplayLimit.overlayPadding = {x:0, y:0};
            this.checkDisplayLimit.selected = false;
            this.checkDisplayLimit.visible = true;
            try
            {
                this.checkDisplayLimit["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_checkDisplayLimit_text_mcUI_Layer2_0()
        {
            try
            {
                this.checkDisplayLimit_text["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.checkDisplayLimit_text.autoSize = "none";
            this.checkDisplayLimit_text.autoSizeEnable = false;
            this.checkDisplayLimit_text.enabled = false;
            this.checkDisplayLimit_text.text = "";
            this.checkDisplayLimit_text.visible = true;
            try
            {
                this.checkDisplayLimit_text["componentInspectorSetting"] = false;
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
