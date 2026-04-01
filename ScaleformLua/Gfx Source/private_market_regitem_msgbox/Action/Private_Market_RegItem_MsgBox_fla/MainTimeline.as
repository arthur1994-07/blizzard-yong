package Private_Market_RegItem_MsgBox_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var TextInfo:Label;
        public var TextPrice:Label;
        public var TextCount:Label;
        public var InputPrice:TextInput;
        public var InputCount:TextInput;
        public var BtnOk:Button;
        public var BtnClose:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_InputPrice_Scene1_asset_0();
            this.__setProp_InputCount_Scene1_asset_0();
            this.__setProp_TextInfo_Scene1_asset_0();
            this.__setProp_TextPrice_Scene1_asset_0();
            this.__setProp_TextCount_Scene1_asset_0();
            this.__setProp_BtnOk_Scene1_asset_0();
            this.__setProp_BtnClose_Scene1_asset_0();
            return;
        }// end function

        function __setProp_InputPrice_Scene1_asset_0()
        {
            try
            {
                this.InputPrice["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.InputPrice.defaultText = "";
            this.InputPrice.displayAsPassword = false;
            this.InputPrice.editable = true;
            this.InputPrice.enabled = true;
            this.InputPrice.focusable = true;
            this.InputPrice.maxByte = 0;
            this.InputPrice.maxChars = 0;
            this.InputPrice.OnlyNumber = false;
            this.InputPrice.Restrict = "number";
            this.InputPrice.RestrictAddOn = "";
            this.InputPrice.text = "";
            this.InputPrice.visible = true;
            try
            {
                this.InputPrice["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_InputCount_Scene1_asset_0()
        {
            try
            {
                this.InputCount["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.InputCount.defaultText = "";
            this.InputCount.displayAsPassword = false;
            this.InputCount.editable = true;
            this.InputCount.enabled = true;
            this.InputCount.focusable = true;
            this.InputCount.maxByte = 0;
            this.InputCount.maxChars = 0;
            this.InputCount.OnlyNumber = false;
            this.InputCount.Restrict = "number";
            this.InputCount.RestrictAddOn = "";
            this.InputCount.text = "";
            this.InputCount.visible = true;
            try
            {
                this.InputCount["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TextInfo_Scene1_asset_0()
        {
            try
            {
                this.TextInfo["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TextInfo.autoSize = "center";
            this.TextInfo.enabled = true;
            this.TextInfo.text = "";
            this.TextInfo.visible = true;
            try
            {
                this.TextInfo["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TextPrice_Scene1_asset_0()
        {
            try
            {
                this.TextPrice["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TextPrice.autoSize = "center";
            this.TextPrice.enabled = true;
            this.TextPrice.text = "";
            this.TextPrice.visible = true;
            try
            {
                this.TextPrice["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TextCount_Scene1_asset_0()
        {
            try
            {
                this.TextCount["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TextCount.autoSize = "center";
            this.TextCount.enabled = true;
            this.TextCount.text = "";
            this.TextCount.visible = true;
            try
            {
                this.TextCount["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_BtnOk_Scene1_asset_0()
        {
            try
            {
                this.BtnOk["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.BtnOk.autoRepeat = false;
            this.BtnOk.autoSize = "none";
            this.BtnOk.enabled = true;
            this.BtnOk.focusable = false;
            this.BtnOk.groupName = "";
            this.BtnOk.label = "";
            this.BtnOk.overlayAlign = "none";
            this.BtnOk.overlayImg = "";
            this.BtnOk.overlayPadding = {x:0, y:0};
            this.BtnOk.preventAutoSize = true;
            this.BtnOk.selected = false;
            this.BtnOk.toggle = false;
            this.BtnOk.visible = true;
            try
            {
                this.BtnOk["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_BtnClose_Scene1_asset_0()
        {
            try
            {
                this.BtnClose["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.BtnClose.autoRepeat = false;
            this.BtnClose.autoSize = "none";
            this.BtnClose.enabled = true;
            this.BtnClose.focusable = false;
            this.BtnClose.groupName = "";
            this.BtnClose.label = "";
            this.BtnClose.overlayAlign = "none";
            this.BtnClose.overlayImg = "";
            this.BtnClose.overlayPadding = {x:0, y:0};
            this.BtnClose.preventAutoSize = true;
            this.BtnClose.selected = false;
            this.BtnClose.toggle = false;
            this.BtnClose.visible = true;
            try
            {
                this.BtnClose["componentInspectorSetting"] = false;
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
