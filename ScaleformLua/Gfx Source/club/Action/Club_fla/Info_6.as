package Club_fla
{
    import flash.display.*;
    import flash.text.*;
    import scaleform.clik.controls.*;

    dynamic public class Info_6 extends MovieClip
    {
        public var exList_1:Alliance;
        public var ClubexList:ClubList;
        public var labelChannel:TextField;
        public var labelClass:TextField;
        public var TbtnLev:Button;
        public var TbtnName:Button;
        public var TbtnlLocation:Button;
        public var TbtnRank:Button;
        public var btnEdit:Button;
        public var btnCommisionArea:Button;
        public var labelNotice:Label;
        public var labelActivity:Label;
        public var labelInformation:Label;
        public var labelFounded:Label;
        public var labelRank:Label;
        public var labelBattle1:Label;
        public var labelOnline:Label;
        public var labelBattle2:Label;
        public var labelNoticeDate:Label;
        public var TextAreaNotice:TextArea;
        public var TextAreaActivity:TextArea;
        public var scrollBarNotice:ScrollBar;
        public var scrollBarActivity:ScrollBar;
        public var scrollBarLeading:ScrollBar;
        public var RadioAlliance:RadioButton;
        public var RadioHostile:RadioButton;
        public var checkBox:CheckBox;
        public var RadioAlliance_text:Label;
        public var RadioHostile_text:Label;
        public var checkBox_text:Label;

        public function Info_6()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnCommisionArea_Info_bg_0();
            this.__setProp_btnEdit_Info_button_0();
            this.__setProp_TbtnLev_Info_button_0();
            this.__setProp_TbtnName_Info_button_0();
            this.__setProp_TbtnlLocation_Info_button_0();
            this.__setProp_TbtnRank_Info_button_0();
            this.__setProp_labelOnline_Info_Text_0();
            this.__setProp_TextAreaNotice_Info_Text_0();
            this.__setProp_TextAreaActivity_Info_Text_0();
            this.__setProp_RadioAlliance_Info_Text_0();
            this.__setProp_RadioHostile_Info_Text_0();
            return;
        }// end function

        function __setProp_btnCommisionArea_Info_bg_0()
        {
            try
            {
                this.btnCommisionArea["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnCommisionArea.autoRepeat = false;
            this.btnCommisionArea.autoSize = "none";
            this.btnCommisionArea.enabled = true;
            this.btnCommisionArea.focusable = false;
            this.btnCommisionArea.groupName = "";
            this.btnCommisionArea.label = "";
            this.btnCommisionArea.overlayAlign = "none";
            this.btnCommisionArea.overlayImg = "";
            this.btnCommisionArea.overlayPadding = {x:0, y:0};
            this.btnCommisionArea.selected = false;
            this.btnCommisionArea.toggle = false;
            this.btnCommisionArea.visible = true;
            try
            {
                this.btnCommisionArea["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnEdit_Info_button_0()
        {
            try
            {
                this.btnEdit["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnEdit.autoRepeat = false;
            this.btnEdit.autoSize = "none";
            this.btnEdit.enabled = true;
            this.btnEdit.focusable = false;
            this.btnEdit.groupName = "";
            this.btnEdit.label = "";
            this.btnEdit.overlayAlign = "none";
            this.btnEdit.overlayImg = "";
            this.btnEdit.overlayPadding = {x:0, y:0};
            this.btnEdit.selected = false;
            this.btnEdit.toggle = false;
            this.btnEdit.visible = true;
            try
            {
                this.btnEdit["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TbtnLev_Info_button_0()
        {
            try
            {
                this.TbtnLev["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TbtnLev.autoRepeat = false;
            this.TbtnLev.autoSize = "none";
            this.TbtnLev.enabled = true;
            this.TbtnLev.focusable = false;
            this.TbtnLev.groupName = "";
            this.TbtnLev.label = "";
            this.TbtnLev.overlayAlign = "none";
            this.TbtnLev.overlayImg = "";
            this.TbtnLev.overlayPadding = {x:0, y:0};
            this.TbtnLev.selected = false;
            this.TbtnLev.toggle = true;
            this.TbtnLev.visible = true;
            try
            {
                this.TbtnLev["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TbtnName_Info_button_0()
        {
            try
            {
                this.TbtnName["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TbtnName.autoRepeat = false;
            this.TbtnName.autoSize = "none";
            this.TbtnName.enabled = true;
            this.TbtnName.focusable = false;
            this.TbtnName.groupName = "";
            this.TbtnName.label = "";
            this.TbtnName.overlayAlign = "none";
            this.TbtnName.overlayImg = "";
            this.TbtnName.overlayPadding = {x:0, y:0};
            this.TbtnName.selected = false;
            this.TbtnName.toggle = true;
            this.TbtnName.visible = true;
            try
            {
                this.TbtnName["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TbtnlLocation_Info_button_0()
        {
            try
            {
                this.TbtnlLocation["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TbtnlLocation.autoRepeat = false;
            this.TbtnlLocation.autoSize = "none";
            this.TbtnlLocation.enabled = true;
            this.TbtnlLocation.focusable = false;
            this.TbtnlLocation.groupName = "";
            this.TbtnlLocation.label = "";
            this.TbtnlLocation.overlayAlign = "none";
            this.TbtnlLocation.overlayImg = "";
            this.TbtnlLocation.overlayPadding = {x:0, y:0};
            this.TbtnlLocation.selected = false;
            this.TbtnlLocation.toggle = true;
            this.TbtnlLocation.visible = true;
            try
            {
                this.TbtnlLocation["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TbtnRank_Info_button_0()
        {
            try
            {
                this.TbtnRank["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TbtnRank.autoRepeat = false;
            this.TbtnRank.autoSize = "none";
            this.TbtnRank.enabled = true;
            this.TbtnRank.focusable = false;
            this.TbtnRank.groupName = "";
            this.TbtnRank.label = "";
            this.TbtnRank.overlayAlign = "none";
            this.TbtnRank.overlayImg = "";
            this.TbtnRank.overlayPadding = {x:0, y:0};
            this.TbtnRank.selected = false;
            this.TbtnRank.toggle = true;
            this.TbtnRank.visible = true;
            try
            {
                this.TbtnRank["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelOnline_Info_Text_0()
        {
            try
            {
                this.labelOnline["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelOnline.autoSize = "center";
            this.labelOnline.enabled = true;
            this.labelOnline.text = "";
            this.labelOnline.visible = true;
            try
            {
                this.labelOnline["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TextAreaNotice_Info_Text_0()
        {
            try
            {
                this.TextAreaNotice["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TextAreaNotice.defaultText = "";
            this.TextAreaNotice.displayAsPassword = false;
            this.TextAreaNotice.editable = true;
            this.TextAreaNotice.enabled = true;
            this.TextAreaNotice.focusable = true;
            this.TextAreaNotice.maxByte = 416;
            this.TextAreaNotice.maxChars = 0;
            this.TextAreaNotice.minThumbSize = 1;
            this.TextAreaNotice.OnlyNumber = false;
            this.TextAreaNotice.scrollBar = "scrollBarNotice";
            this.TextAreaNotice.text = "";
            this.TextAreaNotice.thumbOffset = {top:0, bottom:0};
            this.TextAreaNotice.visible = true;
            try
            {
                this.TextAreaNotice["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TextAreaActivity_Info_Text_0()
        {
            try
            {
                this.TextAreaActivity["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TextAreaActivity.defaultText = "";
            this.TextAreaActivity.displayAsPassword = false;
            this.TextAreaActivity.editable = true;
            this.TextAreaActivity.enabled = true;
            this.TextAreaActivity.focusable = true;
            this.TextAreaActivity.maxByte = 0;
            this.TextAreaActivity.maxChars = 0;
            this.TextAreaActivity.minThumbSize = 1;
            this.TextAreaActivity.OnlyNumber = false;
            this.TextAreaActivity.scrollBar = "scrollBarActivity";
            this.TextAreaActivity.text = "";
            this.TextAreaActivity.thumbOffset = {top:0, bottom:0};
            this.TextAreaActivity.visible = true;
            try
            {
                this.TextAreaActivity["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_RadioAlliance_Info_Text_0()
        {
            try
            {
                this.RadioAlliance["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.RadioAlliance.autoSize = "none";
            this.RadioAlliance.enabled = true;
            this.RadioAlliance.focusable = false;
            this.RadioAlliance.groupName = "ClubRelation";
            this.RadioAlliance.label = "";
            this.RadioAlliance.overlayAlign = "none";
            this.RadioAlliance.overlayImg = "";
            this.RadioAlliance.overlayPadding = {x:0, y:0};
            this.RadioAlliance.selected = true;
            this.RadioAlliance.visible = true;
            try
            {
                this.RadioAlliance["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_RadioHostile_Info_Text_0()
        {
            try
            {
                this.RadioHostile["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.RadioHostile.autoSize = "none";
            this.RadioHostile.enabled = true;
            this.RadioHostile.focusable = false;
            this.RadioHostile.groupName = "ClubRelation";
            this.RadioHostile.label = "";
            this.RadioHostile.overlayAlign = "none";
            this.RadioHostile.overlayImg = "";
            this.RadioHostile.overlayPadding = {x:0, y:0};
            this.RadioHostile.selected = false;
            this.RadioHostile.visible = true;
            try
            {
                this.RadioHostile["componentInspectorSetting"] = false;
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
