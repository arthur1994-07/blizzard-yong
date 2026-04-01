package CharacterCreateRotate_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var btnCharRotateL:Button;
        public var btnCharRotateR:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnCharRotateL_Scene1_asset_0();
            this.__setProp_btnCharRotateR_Scene1_asset_0();
            return;
        }// end function

        function __setProp_btnCharRotateL_Scene1_asset_0()
        {
            try
            {
                this.btnCharRotateL["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnCharRotateL.autoRepeat = false;
            this.btnCharRotateL.autoSize = "none";
            this.btnCharRotateL.enabled = true;
            this.btnCharRotateL.focusable = false;
            this.btnCharRotateL.groupName = "";
            this.btnCharRotateL.label = "";
            this.btnCharRotateL.overlayAlign = "none";
            this.btnCharRotateL.overlayImg = "";
            this.btnCharRotateL.overlayPadding = {x:0, y:0};
            this.btnCharRotateL.preventAutoSize = false;
            this.btnCharRotateL.selected = false;
            this.btnCharRotateL.toggle = false;
            this.btnCharRotateL.visible = true;
            try
            {
                this.btnCharRotateL["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnCharRotateR_Scene1_asset_0()
        {
            try
            {
                this.btnCharRotateR["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnCharRotateR.autoRepeat = false;
            this.btnCharRotateR.autoSize = "none";
            this.btnCharRotateR.enabled = true;
            this.btnCharRotateR.focusable = false;
            this.btnCharRotateR.groupName = "";
            this.btnCharRotateR.label = "";
            this.btnCharRotateR.overlayAlign = "none";
            this.btnCharRotateR.overlayImg = "";
            this.btnCharRotateR.overlayPadding = {x:0, y:0};
            this.btnCharRotateR.preventAutoSize = false;
            this.btnCharRotateR.selected = false;
            this.btnCharRotateR.toggle = false;
            this.btnCharRotateR.visible = true;
            try
            {
                this.btnCharRotateR["componentInspectorSetting"] = false;
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
