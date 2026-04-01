package LottoConfirm_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var num1:MovieClip;
        public var num2:MovieClip;
        public var num3:MovieClip;
        public var num4:MovieClip;
        public var num5:MovieClip;
        public var label:Label;
        public var stepPage:OptionStepper;
        public var btnOK:Button;
        public var btnCancel:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_stepPage_Scene1_asset_0();
            this.__setProp_btnOK_Scene1_asset_0();
            this.__setProp_btnCancel_Scene1_asset_0();
            return;
        }// end function

        function __setProp_stepPage_Scene1_asset_0()
        {
            try
            {
                this.stepPage["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.stepPage.enabled = true;
            this.stepPage.focusable = false;
            this.stepPage.visible = true;
            try
            {
                this.stepPage["componentInspectorSetting"] = false;
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
