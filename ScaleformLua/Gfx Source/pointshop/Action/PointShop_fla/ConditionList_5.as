package PointShop_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class ConditionList_5 extends MovieClip
    {
        public var btnSearchText:Button;
        public var btnSort:Button;
        public var cbSelectAll:CheckBox;
        public var checkBox1:CheckBox;
        public var checkBox2:CheckBox;
        public var checkBox3:CheckBox;
        public var checkBox4:CheckBox;
        public var checkBox5:CheckBox;
        public var checkBox6:CheckBox;
        public var checkBox7:CheckBox;
        public var checkBox8:CheckBox;
        public var checkBox9:CheckBox;
        public var checkBox10:CheckBox;
        public var cbSearchedText:CheckBox;
        public var cbSelectAll_text:Label;
        public var checkBox1_text:Label;
        public var checkBox2_text:Label;
        public var checkBox3_text:Label;
        public var checkBox4_text:Label;
        public var checkBox5_text:Label;
        public var checkBox6_text:Label;
        public var checkBox7_text:Label;
        public var checkBox8_text:Label;
        public var checkBox9_text:Label;
        public var checkBox10_text:Label;
        public var cbSearchedText_text:Label;
        public var labelRanOnlinePoint:Label;
        public var bgRanOnlinePoint:Label;
        public var ASCTB:AutocompleteTextBox;
        public var btnHelp:Button;

        public function ConditionList_5()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnSearchText_ConditionList_Layer2_0();
            this.__setProp_btnSort_ConditionList_Layer2_0();
            this.__setProp_labelRanPointOnline_ConditionList_asset_0();
            this.__setProp_btnHelp_ConditionList_asset1_0();
            return;
        }// end function

        function __setProp_labelRanPointOnline_ConditionList_asset_0()
        {
            try
            {
                this.labelRanOnlinePoint["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelRanOnlinePoint.autoSize = "none";
            this.labelRanOnlinePoint.enabled = true;
            this.labelRanOnlinePoint.text = "label";
            this.labelRanOnlinePoint.visible = true;
            try
            {
                this.labelRanOnlinePoint["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHelp_ConditionList_asset1_0()
        {
            try
            {
                this.btnHelp["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp.autoRepeat = false;
            this.btnHelp.autoSize = "none";
            this.btnHelp.enabled = true;
            this.btnHelp.focusable = false;
            this.btnHelp.groupName = "";
            this.btnHelp.label = "?";
            this.btnHelp.overlayAlign = "none";
            this.btnHelp.overlayImg = "";
            this.btnHelp.overlayPadding = {x:0, y:0};
            this.btnHelp.selected = false;
            this.btnHelp.toggle = false;
            this.btnHelp.visible = true;
            try
            {
                this.btnHelp["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnSearchText_ConditionList_Layer2_0()
        {
            try
            {
                this.btnSearchText["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnSearchText.autoRepeat = false;
            this.btnSearchText.autoSize = "none";
            this.btnSearchText.enabled = true;
            this.btnSearchText.focusable = false;
            this.btnSearchText.groupName = "";
            this.btnSearchText.label = "Default Button";
            this.btnSearchText.overlayAlign = "none";
            this.btnSearchText.overlayImg = "";
            this.btnSearchText.overlayPadding = {x:0, y:0};
            this.btnSearchText.selected = false;
            this.btnSearchText.toggle = false;
            this.btnSearchText.visible = true;
            try
            {
                this.btnSearchText["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnSort_ConditionList_Layer2_0()
        {
            try
            {
                this.btnSort["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnSort.autoRepeat = false;
            this.btnSort.autoSize = "none";
            this.btnSort.enabled = true;
            this.btnSort.focusable = false;
            this.btnSort.groupName = "";
            this.btnSort.label = "";
            this.btnSort.overlayAlign = "none";
            this.btnSort.overlayImg = "";
            this.btnSort.overlayPadding = {x:0, y:0};
            this.btnSort.selected = false;
            this.btnSort.toggle = false;
            this.btnSort.visible = true;
            try
            {
                this.btnSort["componentInspectorSetting"] = false;
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
