package InventoryDecompose_fla
{
    import flash.display.*;
    import flash.text.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var btnOK:Button;
        public var btnCancel:Button;
        public var slot:Slot;
        public var tfHeader:TextField;
        public var tfWarning:TextField;
        public var LabelItemName:Label;
        public var LabelAskDecompose:Label;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_LabelAskDecompose_Scene1_bg_0();
            this.__setProp_btnOK_Scene1_asset_0();
            this.__setProp_btnCancel_Scene1_asset_0();
            return;
        }// end function

        function __setProp_LabelAskDecompose_Scene1_bg_0()
        {
            try
            {
                this.LabelAskDecompose["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.LabelAskDecompose.autoSize = "none";
            this.LabelAskDecompose.autoSizeEnable = false;
            this.LabelAskDecompose.enabled = true;
            this.LabelAskDecompose.text = "분해하시겠습니까_test";
            this.LabelAskDecompose.visible = true;
            try
            {
                this.LabelAskDecompose["componentInspectorSetting"] = false;
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
