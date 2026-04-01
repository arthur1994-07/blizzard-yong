package ClubBattleApply_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var labelClubNameStatic:Label;
        public var labelClubName:Label;
        public var labelTime:Label;
        public var labelHour:Label;
        public var labelMin:Label;
        public var labelInfo:Label;
        public var inputHour:TextInput;
        public var inputMin:TextInput;
        public var btnOK:Button;
        public var btnCancel:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelClubNameStatic_Scene1_asset_0();
            this.__setProp_labelClubName_Scene1_asset_0();
            this.__setProp_labelTime_Scene1_asset_0();
            this.__setProp_inputHour_Scene1_asset_0();
            this.__setProp_labelHour_Scene1_asset_0();
            this.__setProp_inputMin_Scene1_asset_0();
            this.__setProp_labelMin_Scene1_asset_0();
            this.__setProp_labelInfo_Scene1_asset_0();
            this.__setProp_btnOK_Scene1_asset_0();
            this.__setProp_btnCancel_Scene1_asset_0();
            return;
        }// end function

        function __setProp_labelClubNameStatic_Scene1_asset_0()
        {
            try
            {
                this.labelClubNameStatic["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelClubNameStatic.autoSize = "left";
            this.labelClubNameStatic.enabled = true;
            this.labelClubNameStatic.text = "";
            this.labelClubNameStatic.visible = true;
            try
            {
                this.labelClubNameStatic["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelClubName_Scene1_asset_0()
        {
            try
            {
                this.labelClubName["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelClubName.autoSize = "left";
            this.labelClubName.enabled = true;
            this.labelClubName.text = "";
            this.labelClubName.visible = true;
            try
            {
                this.labelClubName["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTime_Scene1_asset_0()
        {
            try
            {
                this.labelTime["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTime.autoSize = "left";
            this.labelTime.enabled = true;
            this.labelTime.text = "";
            this.labelTime.visible = true;
            try
            {
                this.labelTime["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_inputHour_Scene1_asset_0()
        {
            try
            {
                this.inputHour["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputHour.defaultText = "";
            this.inputHour.displayAsPassword = false;
            this.inputHour.editable = true;
            this.inputHour.enabled = true;
            this.inputHour.focusable = true;
            this.inputHour.maxByte = 0;
            this.inputHour.maxChars = 0;
            this.inputHour.OnlyNumber = false;
            this.inputHour.Restrict = "number";
            this.inputHour.RestrictAddOn = "";
            this.inputHour.text = "";
            this.inputHour.textAlign = "left";
            this.inputHour.visible = true;
            try
            {
                this.inputHour["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelHour_Scene1_asset_0()
        {
            try
            {
                this.labelHour["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelHour.autoSize = "left";
            this.labelHour.enabled = true;
            this.labelHour.text = "";
            this.labelHour.visible = true;
            try
            {
                this.labelHour["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_inputMin_Scene1_asset_0()
        {
            try
            {
                this.inputMin["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputMin.defaultText = "";
            this.inputMin.displayAsPassword = false;
            this.inputMin.editable = true;
            this.inputMin.enabled = true;
            this.inputMin.focusable = true;
            this.inputMin.maxByte = 0;
            this.inputMin.maxChars = 0;
            this.inputMin.OnlyNumber = false;
            this.inputMin.Restrict = "number";
            this.inputMin.RestrictAddOn = "";
            this.inputMin.text = "";
            this.inputMin.textAlign = "left";
            this.inputMin.visible = true;
            try
            {
                this.inputMin["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelMin_Scene1_asset_0()
        {
            try
            {
                this.labelMin["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMin.autoSize = "left";
            this.labelMin.enabled = true;
            this.labelMin.text = "";
            this.labelMin.visible = true;
            try
            {
                this.labelMin["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelInfo_Scene1_asset_0()
        {
            try
            {
                this.labelInfo["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelInfo.autoSize = "left";
            this.labelInfo.enabled = true;
            this.labelInfo.text = "";
            this.labelInfo.visible = true;
            try
            {
                this.labelInfo["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnOK_Scene1_asset_0()
        {
            try
            {
                this.btnOK["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnOK.autoRepeat = false;
            this.btnOK.autoSize = "none";
            this.btnOK.enabled = true;
            this.btnOK.focusable = false;
            this.btnOK.groupName = "";
            this.btnOK.label = "";
            this.btnOK.overlayAlign = "none";
            this.btnOK.overlayImg = "";
            this.btnOK.overlayPadding = {x:0, y:0};
            this.btnOK.preventAutoSize = false;
            this.btnOK.selected = false;
            this.btnOK.toggle = false;
            this.btnOK.visible = true;
            try
            {
                this.btnOK["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnCancel_Scene1_asset_0()
        {
            try
            {
                this.btnCancel["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnCancel.autoRepeat = false;
            this.btnCancel.autoSize = "none";
            this.btnCancel.enabled = true;
            this.btnCancel.focusable = false;
            this.btnCancel.groupName = "";
            this.btnCancel.label = "";
            this.btnCancel.overlayAlign = "none";
            this.btnCancel.overlayImg = "";
            this.btnCancel.overlayPadding = {x:0, y:0};
            this.btnCancel.preventAutoSize = false;
            this.btnCancel.selected = false;
            this.btnCancel.toggle = false;
            this.btnCancel.visible = true;
            try
            {
                this.btnCancel["componentInspectorSetting"] = false;
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
